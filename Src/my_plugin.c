#include "driver.h"
#include <string.h>
#include <stdio.h>
#include "Modbus.h"

// Function pointers
static on_report_options_ptr on_report_options;
static on_execute_realtime_ptr on_execute_realtime;
static int16_t* org_read_ptr;

// Buffer sizes
#define RX_DATA_SIZE 16
#define TX_DATA_SIZE 16

// Global buffers and indices
uint8_t RxData[RX_DATA_SIZE];
static uint16_t rx_index = 0;
uint8_t TxData[TX_DATA_SIZE];

// External variables
extern uint16_t Holding_Registers_Database[50];
extern uint8_t Coils_Database[25];

// G-code files
const char* gcode_file_1 = "G-code string here";
const char* gcode_file_2 = "G-code string here";
const char* gcode_file_3 = "G-code string here";

// Function prototypes
static void poll_for_received_data(void);
static void status_checker(void);
static void flush_input_buffer(void);
static void modbus_process(void);

// Define and open a separate stream for Modbus communication
static io_stream_t modbus_stream;

static void modbus_process(void) {
    if (RxData[0] == SLAVE_ID) {
        if (RxData[1] == 0x03 || RxData[1] == 0x04) {
            readHoldingRegs();
        } else if (RxData[1] == 16) {
            writeHoldingRegs();
        } else if (RxData[1] == 0x01) {
            readCoils();
        } else if (RxData[1] == 0x05) {
            writeSingleCoil();
        }
    }
}

// Function to flush the input buffer
static void flush_input_buffer(void) {
    int16_t c;
    while ((c = modbus_stream.read()) != -1) {
        // Discard data
    }
}

static const char* gcode = NULL;

// Function to send G-code commands via the communication stream
static int16_t send_gcode(void) {
    static bool eol_ok = false;

    if (gcode == NULL) {
        return SERIAL_NO_DATA;
    }

    if (*gcode == '\0') {
        if (eol_ok) {
            gcode = NULL;
            return SERIAL_NO_DATA;
        }
        eol_ok = true;
        return ASCII_LF;
    }

    char c = *gcode++;
    if ((eol_ok = (c == '|'))) {
        c = ASCII_LF;
    }

    return (int16_t)c;
}

// Function to poll for received data, store it in RxData, and process it
static void poll_for_received_data(void) {
    int16_t c;
    uint32_t idle_start_time = HAL_GetTick();
    const uint32_t IDLE_TIMEOUT_MS = 500;
    const uint32_t POLLING_INTERVAL_MS = 200;

    rx_index = 0;

    while (1) {
        // Check if data is available in the Modbus stream
        if (modbus_stream.get_rx_buffer_count() > 0) {
            idle_start_time = HAL_GetTick();

            while (rx_index < RX_DATA_SIZE && (c = modbus_stream.read()) != -1) {
                RxData[rx_index++] = (uint8_t)c;
            }

            modbus_process();
        } else if ((HAL_GetTick() - idle_start_time) > IDLE_TIMEOUT_MS) {
            break;
        }

        HAL_Delay(POLLING_INTERVAL_MS);
    }
}

// Function to check the status and execute G-code commands if needed
static void status_checker(void) {
    if (Coils_Database[0] != 0) {
        const char* gcode_to_send = NULL;

        switch (Holding_Registers_Database[10]) {
            case 1:
                gcode_to_send = gcode_file_1;
                break;
            case 2:
                gcode_to_send = gcode_file_2;
                break;
            case 3:
                gcode_to_send = gcode_file_3;
                break;
            default:
                break;
        }

        if (gcode_to_send != NULL) {
            gcode = gcode_to_send;
            org_read_ptr = modbus_stream.read;
            modbus_stream.read = send_gcode;

            while (send_gcode() != SERIAL_NO_DATA) {
                // Process G-code
            }

            modbus_stream.read = org_read_ptr;
            Coils_Database[0] = 0;
        }
    }
}

// Real-time execution check
static void check_register_and_execute_gcode(sys_state_t state) {
    poll_for_received_data();
    status_checker();
    on_execute_realtime(state);
}

// Add plugin information to the report
static void on_report_my_options(bool newopt) {
    if (on_report_options) {
        on_report_options(newopt);
    }

    if (!newopt) {
        const char plugin_info[] = "[PLUGIN:Register Monitor v1.00]" ASCII_EOL;
        modbus_stream.write((uint8_t*)plugin_info);
    }
}

void my_plugin_init(void) {
    // Initialize the Modbus stream
    io_stream_t const *stream;
    if ((stream = stream_open_instance(2, 115200, NULL, "Modbus UART")) == NULL) {
        stream = stream_null_init(115200);
    }

    memcpy(&modbus_stream, stream, sizeof(io_stream_t));

    // Set up the plugin
    modbus_stream.set_enqueue_rt_handler(stream_buffer_all);
    on_report_options = grbl.on_report_options;
    grbl.on_report_options = on_report_my_options;
    on_execute_realtime = grbl.on_execute_realtime;
    grbl.on_execute_realtime = check_register_and_execute_gcode;
}

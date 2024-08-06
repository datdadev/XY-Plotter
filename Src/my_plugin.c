#include "driver.h"
#include <string.h>
#include <stdio.h>

static on_report_options_ptr on_report_options;
static on_execute_realtime_ptr on_execute_realtime;

#define RX_DATA_SIZE 8
static uint8_t RxData[RX_DATA_SIZE];
static uint16_t rx_index = 0;

// Function prototypes
static void poll_for_received_data(void);
static void flush_input_buffer(void);

// Function to flush the input buffer
static void flush_input_buffer(void) {
    int16_t c;
    // Read and discard all data from the stream until the buffer is empty
    while ((c = hal.stream.read()) != -1) {
        // Discard data
    }
}

// Function to poll for received data, store it in RxData, and write it back
static void poll_for_received_data(void) {
    int16_t c;
    uint16_t rx_buffer_count;

    // Wait until a complete message is received
    while (1) {
        rx_buffer_count = hal.stream.get_rx_buffer_count();

        if (rx_buffer_count >= RX_DATA_SIZE) {
            // Read data from the stream
            rx_index = 0;  // Reset index for new message

            while (rx_index < RX_DATA_SIZE && (c = hal.stream.read()) != -1) {
                RxData[rx_index++] = (uint8_t)c;  // Store received character in RxData
            }

            // Echo the received message
            for (uint16_t i = 0; i < rx_index; i++) {
                hal.stream.write(RxData[i]);       // Echo the received character
            }
            hal.stream.write(ASCII_EOL);           // Write ASCII end-of-line character

            // If there is more data to be processed, continue
            if (rx_buffer_count > RX_DATA_SIZE) {
                // Process remaining data
                flush_input_buffer();
            }

            break;  // Exit loop after processing the message
        } else {
            // No complete message received, wait a bit before checking again
            HAL_Delay(10);  // Adjust delay as necessary
        }
    }
}

// Check the Holding_Registers_Database and send G-code commands if needed
static void check_register_and_execute_gcode(sys_state_t state) {
    // Poll for and process received data
    poll_for_received_data();

    // Continue with any other real-time execution tasks
    on_execute_realtime(state);
}

// Add info about our plugin to the $I report
static void on_report_my_options(bool newopt) {
    if (on_report_options) {
        on_report_options(newopt);
    }

    if (!newopt) {
        // Add ASCII_EOL after the plugin information string
        const char plugin_info[] = "[PLUGIN:Register Monitor v1.00]" ASCII_EOL;
        hal.stream.write((uint8_t*)plugin_info);
    }
}

void my_plugin_init(void) {
    // Add info about our plugin to the $I report
    on_report_options = grbl.on_report_options;
    grbl.on_report_options = on_report_my_options;

    // Add check register and execute G-code function to grblHAL foreground process
    on_execute_realtime = grbl.on_execute_realtime;
    grbl.on_execute_realtime = check_register_and_execute_gcode;
}

#include "driver.h"
#include "Modbus.h"
#include <string.h>
#include <stdio.h>

static on_report_options_ptr on_report_options;
static on_execute_realtime_ptr on_execute_realtime;

// UART variables
UART_HandleTypeDef huart2;

uint8_t RxData[256];
uint8_t TxData[256];
extern uint16_t Holding_Registers_Database[50];
extern uint8_t Coils_Database[25];

// Buffer for storing G-code commands
#define GCODE_BUFFER_SIZE 256
static char gcode_buffer[GCODE_BUFFER_SIZE];
static uint16_t gcode_buffer_index = 0;
static uint16_t gcode_buffer_length = 0;

// G-code file strings
const char* gcode_file_1 =
"G21 ; Set units to millimeters\n"
"G90 ; Absolute positioning\n"
"G1 F1500 ; Set feed rate\n"
"G1 X10 Y10 ; Move to position\n"
"G1 X20 Y10 ; Draw line\n"
"G1 X20 Y20 ; Draw line\n"
"G1 X10 Y20 ; Draw line\n"
"G1 X10 Y10 ; Draw line\n"
"M2 ; End of program\n";

const char* gcode_file_2 =
"G21 ; Set units to millimeters\n"
"G90 ; Absolute positioning\n"
"G1 F1500 ; Set feed rate\n"
"G1 X10 Y10 ; Move to position\n"
"G2 X20 Y20 I10 J0 ; Draw clockwise arc\n"
"G2 X10 Y10 I-10 J0 ; Complete the circle\n"
"M2 ; End of program\n";

const char* gcode_file_3 =
"G21 ; Set units to millimeters\n"
"G90 ; Absolute positioning\n"
"G1 F1500 ; Set feed rate\n"
"G1 X10 Y10 ; Move to position\n"
"G1 X20 Y10 ; Draw line\n"
"G1 X10 Y20 ; Draw line\n"
"G1 X20 Y20 ; Draw line\n"
"G1 X10 Y30 ; Draw line\n"
"G1 X20 Y30 ; Draw line\n"
"M2 ; End of program\n";

// Function prototypes
static void send_gcode_sequence(int selected_index);
static int16_t get_macro_char(void);
void SystemClock_Config(void);
void MX_GPIO_Init(void);
void MX_USART2_UART_Init(void);

// UART callback function
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart) {
    if (huart->Instance == USART2) {
        if (RxData[0] == SLAVE_ID) {
            switch (RxData[1]) {
                case 0x01:
                    readCoils();
                    break;
                case 0x03:
                    readHoldingRegs();
                    break;
                case 0x04:
                    readHoldingRegs();
                    break;
                case 0x05:
                    writeSingleCoil();
                    break;
                case 0x06:
                    writeSingleReg();
                    break;
                case 15:
                    writeMultiCoils();
                    break;
                case 16:
                    writeHoldingRegs();
                    break;
                default:
                    break;
            }
        }
        HAL_UART_Receive_IT(&huart2, RxData, 256);
    }
}

// Function to send a sequence of G-code commands to the buffer
static void send_gcode_sequence(int selected_index) {
    const char* selected_gcode;

    // Select the appropriate G-code file
    switch (selected_index) {
        case 0:
            selected_gcode = gcode_file_1;
            break;
        case 1:
            selected_gcode = gcode_file_2;
            break;
        case 2:
            selected_gcode = gcode_file_3;
            break;
        default:
            return;  // Invalid index, do nothing
    }

    // Copy the selected G-code into the buffer
    strncpy(gcode_buffer, selected_gcode, GCODE_BUFFER_SIZE - 1);
    gcode_buffer[GCODE_BUFFER_SIZE - 1] = '\0';  // Ensure null-termination

    gcode_buffer_length = strlen(gcode_buffer);
    gcode_buffer_index = 0;

    // Redirect hal.stream.read to our buffer reader function
    hal.stream.read = get_macro_char;
    hal.stream.file = NULL;  // Input stream is not file based
}

// Function to read a character from the G-code buffer
static int16_t get_macro_char(void) {
    if (gcode_buffer_index < gcode_buffer_length) {
        return gcode_buffer[gcode_buffer_index++];
    } else {
        return 0;  // No more data
    }
}

// Check the Holding_Registers_Database and send G-code commands if needed
static void check_register_and_execute_gcode(sys_state_t state) {
    // Get data from Holding_Registers_Database
    uint16_t number_to_write = Holding_Registers_Database[10];
    uint16_t text_size = Holding_Registers_Database[12];

    // Check if the values are within the required range
    if (number_to_write < 0 || number_to_write > 9 || text_size < 1 || text_size > 10) {
        return;  // Values out of range, do nothing
    }

    // Select which G-code file to use based on some criteria
    int selected_index = 0; // Example: you might have a function to determine this

    send_gcode_sequence(selected_index);

    // Continue with any other real-time execution tasks
    on_execute_realtime(state);
}

// Add info about our plugin to the $I report
static void on_report_my_options(bool newopt) {
    if (on_report_options) {
        on_report_options(newopt);
    }

    if (!newopt) {
        hal.stream.write("[PLUGIN:Register Monitor v1.00]" ASCII_EOL);
    }
}

void my_plugin_init(void) {
    // Add info about our plugin to the $I report
    on_report_options = grbl.on_report_options;
    grbl.on_report_options = on_report_my_options;

    // Initialize UART2
    MX_USART2_UART_Init();

    // Start UART receive interrupt
    HAL_UART_Receive_IT(&huart2, RxData, 256);

    // Add check register and execute G-code function to grblHAL foreground process
    on_execute_realtime = grbl.on_execute_realtime;
    grbl.on_execute_realtime = check_register_and_execute_gcode;
}

void MX_USART2_UART_Init(void)
{
    huart2.Instance = USART2;
    huart2.Init.BaudRate = 115200;
    huart2.Init.WordLength = UART_WORDLENGTH_8B;
    huart2.Init.StopBits = UART_STOPBITS_1;
    huart2.Init.Parity = UART_PARITY_NONE;
    huart2.Init.Mode = UART_MODE_TX_RX;
    huart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
    huart2.Init.OverSampling = UART_OVERSAMPLING_16;
    if (HAL_UART_Init(&huart2) != HAL_OK)
    {
        // Initialization Error
        Error_Handler();
    }

    // Configure GPIOs for USART2
    MX_GPIO_Init();
}

void MX_GPIO_Init(void)
{
    __HAL_RCC_GPIOA_CLK_ENABLE();

    GPIO_InitTypeDef GPIO_InitStruct = {0};

    // Configure GPIO pins for USART2 TX and RX
    GPIO_InitStruct.Pin = GPIO_PIN_2 | GPIO_PIN_3;
    GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
    GPIO_InitStruct.Alternate = GPIO_AF7_USART2;
    HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);
}

//void Error_Handler(void)
//{
//    // User can add their own implementation to report the HAL error return state
//    while (1)
//    {
//    }
//}

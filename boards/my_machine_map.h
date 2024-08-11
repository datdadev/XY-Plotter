#define BOARD_NAME "MY MACHINE"
//#define HAS_BOARD_INIT

#define SERIAL_PORT     1   // GPIOA: TX = 2, RX = 3
#define SERIAL1_PORT    2   // GPIOA: TX = 2, RX = 3

// Define step pulse output pins.
#define X_STEP_PORT                 GPIOD
#define X_STEP_PIN                  13                  // X
#define Y_STEP_PORT                 GPIOD
#define Y_STEP_PIN                  11                  // Y
#define Z_STEP_PORT                 GPIOE
#define Z_STEP_PIN                  2                   // Z
#define STEP_OUTMODE                GPIO_BITBAND
//#define STEP_PINMODE                PINMODE_OD // Uncomment for open drain outputs

// Define step direction output pins.
#define X_DIRECTION_PORT            GPIOD
#define X_DIRECTION_PIN             12
#define Y_DIRECTION_PORT            GPIOB
#define Y_DIRECTION_PIN             15
#define Z_DIRECTION_PORT            GPIOE
#define Z_DIRECTION_PIN             3
#define DIRECTION_OUTMODE           GPIO_BITBAND
//#define DIRECTION_PINMODE           PINMODE_OD // Uncomment for open drain outputs

// Define homing/hard limit switch input pins.
#define X_LIMIT_PORT                GPIOA
#define X_LIMIT_PIN                 11                           // X- Limit
#define Y_LIMIT_PORT                GPIOA
#define Y_LIMIT_PIN                 12                           // Y- Limit
#define Z_LIMIT_PORT                GPIOB
#define Z_LIMIT_PIN                 12                           // Z- Limit
#define LIMIT_INMODE                GPIO_BITBAND

// Define flood and mist coolant enable output pins.
#define COOLANT_FLOOD_PORT          GPIOE
#define COOLANT_FLOOD_PIN           0                           // HEAT0
#define COOLANT_MIST_PORT           GPIOB
#define COOLANT_MIST_PIN            5                           // HEAT1

// EOF

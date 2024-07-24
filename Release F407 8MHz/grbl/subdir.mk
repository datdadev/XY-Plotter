################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../grbl/alarms.c \
../grbl/canbus.c \
../grbl/coolant_control.c \
../grbl/crossbar.c \
../grbl/errors.c \
../grbl/gcode.c \
../grbl/grbllib.c \
../grbl/ioports.c \
../grbl/machine_limits.c \
../grbl/messages.c \
../grbl/modbus.c \
../grbl/motion_control.c \
../grbl/my_plugin.c \
../grbl/ngc_expr.c \
../grbl/ngc_flowctrl.c \
../grbl/ngc_params.c \
../grbl/nuts_bolts.c \
../grbl/nvs_buffer.c \
../grbl/override.c \
../grbl/pid.c \
../grbl/planner.c \
../grbl/protocol.c \
../grbl/regex.c \
../grbl/report.c \
../grbl/settings.c \
../grbl/sleep.c \
../grbl/spindle_control.c \
../grbl/state_machine.c \
../grbl/stepper.c \
../grbl/stepper2.c \
../grbl/stream.c \
../grbl/system.c \
../grbl/tool_change.c \
../grbl/vfs.c 

OBJS += \
./grbl/alarms.o \
./grbl/canbus.o \
./grbl/coolant_control.o \
./grbl/crossbar.o \
./grbl/errors.o \
./grbl/gcode.o \
./grbl/grbllib.o \
./grbl/ioports.o \
./grbl/machine_limits.o \
./grbl/messages.o \
./grbl/modbus.o \
./grbl/motion_control.o \
./grbl/my_plugin.o \
./grbl/ngc_expr.o \
./grbl/ngc_flowctrl.o \
./grbl/ngc_params.o \
./grbl/nuts_bolts.o \
./grbl/nvs_buffer.o \
./grbl/override.o \
./grbl/pid.o \
./grbl/planner.o \
./grbl/protocol.o \
./grbl/regex.o \
./grbl/report.o \
./grbl/settings.o \
./grbl/sleep.o \
./grbl/spindle_control.o \
./grbl/state_machine.o \
./grbl/stepper.o \
./grbl/stepper2.o \
./grbl/stream.o \
./grbl/system.o \
./grbl/tool_change.o \
./grbl/vfs.o 

C_DEPS += \
./grbl/alarms.d \
./grbl/canbus.d \
./grbl/coolant_control.d \
./grbl/crossbar.d \
./grbl/errors.d \
./grbl/gcode.d \
./grbl/grbllib.d \
./grbl/ioports.d \
./grbl/machine_limits.d \
./grbl/messages.d \
./grbl/modbus.d \
./grbl/motion_control.d \
./grbl/my_plugin.d \
./grbl/ngc_expr.d \
./grbl/ngc_flowctrl.d \
./grbl/ngc_params.d \
./grbl/nuts_bolts.d \
./grbl/nvs_buffer.d \
./grbl/override.d \
./grbl/pid.d \
./grbl/planner.d \
./grbl/protocol.d \
./grbl/regex.d \
./grbl/report.d \
./grbl/settings.d \
./grbl/sleep.d \
./grbl/spindle_control.d \
./grbl/state_machine.d \
./grbl/stepper.d \
./grbl/stepper2.d \
./grbl/stream.d \
./grbl/system.d \
./grbl/tool_change.d \
./grbl/vfs.d 


# Each subdirectory must supply rules for building sources it contributes
grbl/%.o grbl/%.su grbl/%.cyclo: ../grbl/%.c grbl/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -DHSE_VALUE=8000000 -D_VOLUMES=1 -D_USE_IOCTL=1 -D_USE_WRITE=1 -c -I"C:/Users/ltd/Documents/STM32/XY-Plotter" -I"C:/Users/ltd/Documents/STM32/XY-Plotter/FatFs" -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../USB_DEVICE/App -I../USB_DEVICE/Target -I"C:/Users/ltd/Documents/STM32/XY-Plotter/lwip/src/include" -I"C:/Users/ltd/Documents/STM32/XY-Plotter/networking/wiznet" -I"C:/Users/ltd/Documents/STM32/XY-Plotter/FatFs/STM" -I"C:/Users/ltd/Documents/STM32/XY-Plotter/Drivers/FATFS/Target" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-grbl

clean-grbl:
	-$(RM) ./grbl/alarms.cyclo ./grbl/alarms.d ./grbl/alarms.o ./grbl/alarms.su ./grbl/canbus.cyclo ./grbl/canbus.d ./grbl/canbus.o ./grbl/canbus.su ./grbl/coolant_control.cyclo ./grbl/coolant_control.d ./grbl/coolant_control.o ./grbl/coolant_control.su ./grbl/crossbar.cyclo ./grbl/crossbar.d ./grbl/crossbar.o ./grbl/crossbar.su ./grbl/errors.cyclo ./grbl/errors.d ./grbl/errors.o ./grbl/errors.su ./grbl/gcode.cyclo ./grbl/gcode.d ./grbl/gcode.o ./grbl/gcode.su ./grbl/grbllib.cyclo ./grbl/grbllib.d ./grbl/grbllib.o ./grbl/grbllib.su ./grbl/ioports.cyclo ./grbl/ioports.d ./grbl/ioports.o ./grbl/ioports.su ./grbl/machine_limits.cyclo ./grbl/machine_limits.d ./grbl/machine_limits.o ./grbl/machine_limits.su ./grbl/messages.cyclo ./grbl/messages.d ./grbl/messages.o ./grbl/messages.su ./grbl/modbus.cyclo ./grbl/modbus.d ./grbl/modbus.o ./grbl/modbus.su ./grbl/motion_control.cyclo ./grbl/motion_control.d ./grbl/motion_control.o ./grbl/motion_control.su ./grbl/my_plugin.cyclo ./grbl/my_plugin.d ./grbl/my_plugin.o ./grbl/my_plugin.su ./grbl/ngc_expr.cyclo ./grbl/ngc_expr.d ./grbl/ngc_expr.o ./grbl/ngc_expr.su ./grbl/ngc_flowctrl.cyclo ./grbl/ngc_flowctrl.d ./grbl/ngc_flowctrl.o ./grbl/ngc_flowctrl.su ./grbl/ngc_params.cyclo ./grbl/ngc_params.d ./grbl/ngc_params.o ./grbl/ngc_params.su ./grbl/nuts_bolts.cyclo ./grbl/nuts_bolts.d ./grbl/nuts_bolts.o ./grbl/nuts_bolts.su ./grbl/nvs_buffer.cyclo ./grbl/nvs_buffer.d ./grbl/nvs_buffer.o ./grbl/nvs_buffer.su ./grbl/override.cyclo ./grbl/override.d ./grbl/override.o ./grbl/override.su ./grbl/pid.cyclo ./grbl/pid.d ./grbl/pid.o ./grbl/pid.su ./grbl/planner.cyclo ./grbl/planner.d ./grbl/planner.o ./grbl/planner.su ./grbl/protocol.cyclo ./grbl/protocol.d ./grbl/protocol.o ./grbl/protocol.su ./grbl/regex.cyclo ./grbl/regex.d ./grbl/regex.o ./grbl/regex.su ./grbl/report.cyclo ./grbl/report.d ./grbl/report.o ./grbl/report.su ./grbl/settings.cyclo ./grbl/settings.d ./grbl/settings.o ./grbl/settings.su ./grbl/sleep.cyclo ./grbl/sleep.d ./grbl/sleep.o ./grbl/sleep.su ./grbl/spindle_control.cyclo ./grbl/spindle_control.d ./grbl/spindle_control.o ./grbl/spindle_control.su ./grbl/state_machine.cyclo ./grbl/state_machine.d ./grbl/state_machine.o ./grbl/state_machine.su ./grbl/stepper.cyclo ./grbl/stepper.d ./grbl/stepper.o ./grbl/stepper.su ./grbl/stepper2.cyclo ./grbl/stepper2.d ./grbl/stepper2.o ./grbl/stepper2.su ./grbl/stream.cyclo ./grbl/stream.d ./grbl/stream.o ./grbl/stream.su ./grbl/system.cyclo ./grbl/system.d ./grbl/system.o ./grbl/system.su ./grbl/tool_change.cyclo ./grbl/tool_change.d ./grbl/tool_change.o ./grbl/tool_change.su ./grbl/vfs.cyclo ./grbl/vfs.d ./grbl/vfs.o ./grbl/vfs.su

.PHONY: clean-grbl


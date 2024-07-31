################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../odometer/odometer.c 

OBJS += \
./odometer/odometer.o 

C_DEPS += \
./odometer/odometer.d 


# Each subdirectory must supply rules for building sources it contributes
odometer/%.o odometer/%.su odometer/%.cyclo: ../odometer/%.c odometer/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -DHSE_VALUE=8000000 -D_VOLUMES=1 -D_USE_IOCTL=1 -D_USE_WRITE=1 -c -I"D:/LTD/STM/new/XY-Plotter" -I"D:/LTD/STM/new/XY-Plotter/FatFs" -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../USB_DEVICE/App -I../USB_DEVICE/Target -I"D:/LTD/STM/new/XY-Plotter/lwip/src/include" -I"D:/LTD/STM/new/XY-Plotter/networking/wiznet" -I"D:/LTD/STM/new/XY-Plotter/FatFs/STM" -I"D:/LTD/STM/new/XY-Plotter/Drivers/FATFS/Target" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-odometer

clean-odometer:
	-$(RM) ./odometer/odometer.cyclo ./odometer/odometer.d ./odometer/odometer.o ./odometer/odometer.su

.PHONY: clean-odometer


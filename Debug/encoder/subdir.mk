################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../encoder/encoder.c 

OBJS += \
./encoder/encoder.o 

C_DEPS += \
./encoder/encoder.d 


# Each subdirectory must supply rules for building sources it contributes
encoder/%.o encoder/%.su encoder/%.cyclo: ../encoder/%.c encoder/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g -DUSE_HAL_DRIVER -DDEBUG -DSTM32F407xx -DHSE_VALUE=8000000 -D_VOLUMES=1 -D_USE_IOCTL=1 -D_USE_WRITE=1 -c -I"D:/LTD/STM/new/XY-Plotter" -I"D:/LTD/STM/new/XY-Plotter/FatFs" -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../USB_DEVICE/App -I../USB_DEVICE/Target -I"D:/LTD/STM/new/XY-Plotter/lwip/src/include" -I"D:/LTD/STM/new/XY-Plotter/networking/wiznet" -I"D:/LTD/STM/new/XY-Plotter/FatFs/STM" -I"D:/LTD/STM/new/XY-Plotter/Drivers/FATFS/Target" -Og -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-encoder

clean-encoder:
	-$(RM) ./encoder/encoder.cyclo ./encoder/encoder.d ./encoder/encoder.o ./encoder/encoder.su

.PHONY: clean-encoder


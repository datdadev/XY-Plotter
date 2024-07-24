################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../networking/wiznet/W5100S/w5100s.c 

OBJS += \
./networking/wiznet/W5100S/w5100s.o 

C_DEPS += \
./networking/wiznet/W5100S/w5100s.d 


# Each subdirectory must supply rules for building sources it contributes
networking/wiznet/W5100S/%.o networking/wiznet/W5100S/%.su networking/wiznet/W5100S/%.cyclo: ../networking/wiznet/W5100S/%.c networking/wiznet/W5100S/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g -DUSE_HAL_DRIVER -DDEBUG -DSTM32F407xx -DHSE_VALUE=8000000 -D_VOLUMES=1 -D_USE_IOCTL=1 -D_USE_WRITE=1 -c -I"C:/Users/ltd/Documents/STM32/GRBL Driver STM32F401" -I"C:/Users/ltd/Documents/STM32/GRBL Driver STM32F401/FatFs" -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../USB_DEVICE/App -I../USB_DEVICE/Target -I"C:/Users/ltd/Documents/STM32/GRBL Driver STM32F401/lwip/src/include" -I"C:/Users/ltd/Documents/STM32/GRBL Driver STM32F401/networking/wiznet" -I"C:/Users/ltd/Documents/STM32/GRBL Driver STM32F401/FatFs/STM" -I"C:/Users/ltd/Documents/STM32/GRBL Driver STM32F401/Drivers/FATFS/Target" -Og -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-networking-2f-wiznet-2f-W5100S

clean-networking-2f-wiznet-2f-W5100S:
	-$(RM) ./networking/wiznet/W5100S/w5100s.cyclo ./networking/wiznet/W5100S/w5100s.d ./networking/wiznet/W5100S/w5100s.o ./networking/wiznet/W5100S/w5100s.su

.PHONY: clean-networking-2f-wiznet-2f-W5100S


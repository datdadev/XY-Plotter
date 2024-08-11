################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../networking/wiznet/arch/checksum.c \
../networking/wiznet/arch/memcpy.c \
../networking/wiznet/arch/sys_arch.c 

OBJS += \
./networking/wiznet/arch/checksum.o \
./networking/wiznet/arch/memcpy.o \
./networking/wiznet/arch/sys_arch.o 

C_DEPS += \
./networking/wiznet/arch/checksum.d \
./networking/wiznet/arch/memcpy.d \
./networking/wiznet/arch/sys_arch.d 


# Each subdirectory must supply rules for building sources it contributes
networking/wiznet/arch/%.o networking/wiznet/arch/%.su networking/wiznet/arch/%.cyclo: ../networking/wiznet/arch/%.c networking/wiznet/arch/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -DHSE_VALUE=8000000 -D_VOLUMES=1 -D_USE_IOCTL=1 -D_USE_WRITE=1 -c -I"D:/LTD/STM/new/XY-Plotter" -I"D:/LTD/STM/new/XY-Plotter/FatFs" -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../USB_DEVICE/App -I../USB_DEVICE/Target -I"D:/LTD/STM/new/XY-Plotter/lwip/src/include" -I"D:/LTD/STM/new/XY-Plotter/networking/wiznet" -I"D:/LTD/STM/new/XY-Plotter/FatFs/STM" -I"D:/LTD/STM/new/XY-Plotter/Drivers/FATFS/Target" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-networking-2f-wiznet-2f-arch

clean-networking-2f-wiznet-2f-arch:
	-$(RM) ./networking/wiznet/arch/checksum.cyclo ./networking/wiznet/arch/checksum.d ./networking/wiznet/arch/checksum.o ./networking/wiznet/arch/checksum.su ./networking/wiznet/arch/memcpy.cyclo ./networking/wiznet/arch/memcpy.d ./networking/wiznet/arch/memcpy.o ./networking/wiznet/arch/memcpy.su ./networking/wiznet/arch/sys_arch.cyclo ./networking/wiznet/arch/sys_arch.d ./networking/wiznet/arch/sys_arch.o ./networking/wiznet/arch/sys_arch.su

.PHONY: clean-networking-2f-wiznet-2f-arch

################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/FATFS/Target/bsp_driver_sd.c \
../Drivers/FATFS/Target/sd_diskio.c 

OBJS += \
./Drivers/FATFS/Target/bsp_driver_sd.o \
./Drivers/FATFS/Target/sd_diskio.o 

C_DEPS += \
./Drivers/FATFS/Target/bsp_driver_sd.d \
./Drivers/FATFS/Target/sd_diskio.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/FATFS/Target/%.o Drivers/FATFS/Target/%.su Drivers/FATFS/Target/%.cyclo: ../Drivers/FATFS/Target/%.c Drivers/FATFS/Target/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -DHSE_VALUE=8000000 -D_VOLUMES=1 -D_USE_IOCTL=1 -D_USE_WRITE=1 -c -I"C:/Users/ltd/Documents/STM32/XY-Plotter" -I"C:/Users/ltd/Documents/STM32/XY-Plotter/FatFs" -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../USB_DEVICE/App -I../USB_DEVICE/Target -I"C:/Users/ltd/Documents/STM32/XY-Plotter/lwip/src/include" -I"C:/Users/ltd/Documents/STM32/XY-Plotter/networking/wiznet" -I"C:/Users/ltd/Documents/STM32/XY-Plotter/FatFs/STM" -I"C:/Users/ltd/Documents/STM32/XY-Plotter/Drivers/FATFS/Target" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-FATFS-2f-Target

clean-Drivers-2f-FATFS-2f-Target:
	-$(RM) ./Drivers/FATFS/Target/bsp_driver_sd.cyclo ./Drivers/FATFS/Target/bsp_driver_sd.d ./Drivers/FATFS/Target/bsp_driver_sd.o ./Drivers/FATFS/Target/bsp_driver_sd.su ./Drivers/FATFS/Target/sd_diskio.cyclo ./Drivers/FATFS/Target/sd_diskio.d ./Drivers/FATFS/Target/sd_diskio.o ./Drivers/FATFS/Target/sd_diskio.su

.PHONY: clean-Drivers-2f-FATFS-2f-Target


################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../FatFs/STM/diskio.c \
../FatFs/STM/ff_gen_drv.c 

OBJS += \
./FatFs/STM/diskio.o \
./FatFs/STM/ff_gen_drv.o 

C_DEPS += \
./FatFs/STM/diskio.d \
./FatFs/STM/ff_gen_drv.d 


# Each subdirectory must supply rules for building sources it contributes
FatFs/STM/%.o FatFs/STM/%.su FatFs/STM/%.cyclo: ../FatFs/STM/%.c FatFs/STM/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g -DUSE_HAL_DRIVER -DDEBUG -DSTM32F407xx -DHSE_VALUE=8000000 -D_VOLUMES=1 -D_USE_IOCTL=1 -D_USE_WRITE=1 -c -I"D:/LTD/STM/new/XY-Plotter" -I"D:/LTD/STM/new/XY-Plotter/FatFs" -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../USB_DEVICE/App -I../USB_DEVICE/Target -I"D:/LTD/STM/new/XY-Plotter/lwip/src/include" -I"D:/LTD/STM/new/XY-Plotter/networking/wiznet" -I"D:/LTD/STM/new/XY-Plotter/FatFs/STM" -I"D:/LTD/STM/new/XY-Plotter/Drivers/FATFS/Target" -Og -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-FatFs-2f-STM

clean-FatFs-2f-STM:
	-$(RM) ./FatFs/STM/diskio.cyclo ./FatFs/STM/diskio.d ./FatFs/STM/diskio.o ./FatFs/STM/diskio.su ./FatFs/STM/ff_gen_drv.cyclo ./FatFs/STM/ff_gen_drv.d ./FatFs/STM/ff_gen_drv.o ./FatFs/STM/ff_gen_drv.su

.PHONY: clean-FatFs-2f-STM


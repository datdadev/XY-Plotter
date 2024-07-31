################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../trinamic/common.c \
../trinamic/tmc2130.c \
../trinamic/tmc2130hal.c \
../trinamic/tmc2209.c \
../trinamic/tmc2209hal.c \
../trinamic/tmc2660.c \
../trinamic/tmc2660hal.c \
../trinamic/tmc26x.c \
../trinamic/tmc5160.c \
../trinamic/tmc5160hal.c \
../trinamic/tmc_interface.c 

OBJS += \
./trinamic/common.o \
./trinamic/tmc2130.o \
./trinamic/tmc2130hal.o \
./trinamic/tmc2209.o \
./trinamic/tmc2209hal.o \
./trinamic/tmc2660.o \
./trinamic/tmc2660hal.o \
./trinamic/tmc26x.o \
./trinamic/tmc5160.o \
./trinamic/tmc5160hal.o \
./trinamic/tmc_interface.o 

C_DEPS += \
./trinamic/common.d \
./trinamic/tmc2130.d \
./trinamic/tmc2130hal.d \
./trinamic/tmc2209.d \
./trinamic/tmc2209hal.d \
./trinamic/tmc2660.d \
./trinamic/tmc2660hal.d \
./trinamic/tmc26x.d \
./trinamic/tmc5160.d \
./trinamic/tmc5160hal.d \
./trinamic/tmc_interface.d 


# Each subdirectory must supply rules for building sources it contributes
trinamic/%.o trinamic/%.su trinamic/%.cyclo: ../trinamic/%.c trinamic/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -DHSE_VALUE=8000000 -D_VOLUMES=1 -D_USE_IOCTL=1 -D_USE_WRITE=1 -c -I"D:/LTD/STM/new/XY-Plotter" -I"D:/LTD/STM/new/XY-Plotter/FatFs" -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../USB_DEVICE/App -I../USB_DEVICE/Target -I"D:/LTD/STM/new/XY-Plotter/lwip/src/include" -I"D:/LTD/STM/new/XY-Plotter/networking/wiznet" -I"D:/LTD/STM/new/XY-Plotter/FatFs/STM" -I"D:/LTD/STM/new/XY-Plotter/Drivers/FATFS/Target" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-trinamic

clean-trinamic:
	-$(RM) ./trinamic/common.cyclo ./trinamic/common.d ./trinamic/common.o ./trinamic/common.su ./trinamic/tmc2130.cyclo ./trinamic/tmc2130.d ./trinamic/tmc2130.o ./trinamic/tmc2130.su ./trinamic/tmc2130hal.cyclo ./trinamic/tmc2130hal.d ./trinamic/tmc2130hal.o ./trinamic/tmc2130hal.su ./trinamic/tmc2209.cyclo ./trinamic/tmc2209.d ./trinamic/tmc2209.o ./trinamic/tmc2209.su ./trinamic/tmc2209hal.cyclo ./trinamic/tmc2209hal.d ./trinamic/tmc2209hal.o ./trinamic/tmc2209hal.su ./trinamic/tmc2660.cyclo ./trinamic/tmc2660.d ./trinamic/tmc2660.o ./trinamic/tmc2660.su ./trinamic/tmc2660hal.cyclo ./trinamic/tmc2660hal.d ./trinamic/tmc2660hal.o ./trinamic/tmc2660hal.su ./trinamic/tmc26x.cyclo ./trinamic/tmc26x.d ./trinamic/tmc26x.o ./trinamic/tmc26x.su ./trinamic/tmc5160.cyclo ./trinamic/tmc5160.d ./trinamic/tmc5160.o ./trinamic/tmc5160.su ./trinamic/tmc5160hal.cyclo ./trinamic/tmc5160hal.d ./trinamic/tmc5160hal.o ./trinamic/tmc5160hal.su ./trinamic/tmc_interface.cyclo ./trinamic/tmc_interface.d ./trinamic/tmc_interface.o ./trinamic/tmc_interface.su

.PHONY: clean-trinamic


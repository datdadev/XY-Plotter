################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../grbl/kinematics/corexy.c \
../grbl/kinematics/delta.c \
../grbl/kinematics/maslow.c \
../grbl/kinematics/polar.c \
../grbl/kinematics/wall_plotter.c 

OBJS += \
./grbl/kinematics/corexy.o \
./grbl/kinematics/delta.o \
./grbl/kinematics/maslow.o \
./grbl/kinematics/polar.o \
./grbl/kinematics/wall_plotter.o 

C_DEPS += \
./grbl/kinematics/corexy.d \
./grbl/kinematics/delta.d \
./grbl/kinematics/maslow.d \
./grbl/kinematics/polar.d \
./grbl/kinematics/wall_plotter.d 


# Each subdirectory must supply rules for building sources it contributes
grbl/kinematics/%.o grbl/kinematics/%.su grbl/kinematics/%.cyclo: ../grbl/kinematics/%.c grbl/kinematics/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g -DUSE_HAL_DRIVER -DDEBUG -DSTM32F407xx -DHSE_VALUE=8000000 -D_VOLUMES=1 -D_USE_IOCTL=1 -D_USE_WRITE=1 -c -I"C:/Users/ltd/Documents/STM32/GRBL Driver STM32F401" -I"C:/Users/ltd/Documents/STM32/GRBL Driver STM32F401/FatFs" -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../USB_DEVICE/App -I../USB_DEVICE/Target -I"C:/Users/ltd/Documents/STM32/GRBL Driver STM32F401/lwip/src/include" -I"C:/Users/ltd/Documents/STM32/GRBL Driver STM32F401/networking/wiznet" -I"C:/Users/ltd/Documents/STM32/GRBL Driver STM32F401/FatFs/STM" -I"C:/Users/ltd/Documents/STM32/GRBL Driver STM32F401/Drivers/FATFS/Target" -Og -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-grbl-2f-kinematics

clean-grbl-2f-kinematics:
	-$(RM) ./grbl/kinematics/corexy.cyclo ./grbl/kinematics/corexy.d ./grbl/kinematics/corexy.o ./grbl/kinematics/corexy.su ./grbl/kinematics/delta.cyclo ./grbl/kinematics/delta.d ./grbl/kinematics/delta.o ./grbl/kinematics/delta.su ./grbl/kinematics/maslow.cyclo ./grbl/kinematics/maslow.d ./grbl/kinematics/maslow.o ./grbl/kinematics/maslow.su ./grbl/kinematics/polar.cyclo ./grbl/kinematics/polar.d ./grbl/kinematics/polar.o ./grbl/kinematics/polar.su ./grbl/kinematics/wall_plotter.cyclo ./grbl/kinematics/wall_plotter.d ./grbl/kinematics/wall_plotter.o ./grbl/kinematics/wall_plotter.su

.PHONY: clean-grbl-2f-kinematics


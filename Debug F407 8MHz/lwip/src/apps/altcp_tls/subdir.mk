################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lwip/src/apps/altcp_tls/altcp_tls_mbedtls.c \
../lwip/src/apps/altcp_tls/altcp_tls_mbedtls_mem.c 

OBJS += \
./lwip/src/apps/altcp_tls/altcp_tls_mbedtls.o \
./lwip/src/apps/altcp_tls/altcp_tls_mbedtls_mem.o 

C_DEPS += \
./lwip/src/apps/altcp_tls/altcp_tls_mbedtls.d \
./lwip/src/apps/altcp_tls/altcp_tls_mbedtls_mem.d 


# Each subdirectory must supply rules for building sources it contributes
lwip/src/apps/altcp_tls/%.o lwip/src/apps/altcp_tls/%.su lwip/src/apps/altcp_tls/%.cyclo: ../lwip/src/apps/altcp_tls/%.c lwip/src/apps/altcp_tls/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g -DUSE_HAL_DRIVER -DDEBUG -DSTM32F407xx -DHSE_VALUE=8000000 -D_VOLUMES=1 -D_USE_IOCTL=1 -D_USE_WRITE=1 -c -I"C:/Users/ltd/Documents/STM32/GRBL Driver STM32F401" -I"C:/Users/ltd/Documents/STM32/GRBL Driver STM32F401/FatFs" -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../USB_DEVICE/App -I../USB_DEVICE/Target -I"C:/Users/ltd/Documents/STM32/GRBL Driver STM32F401/lwip/src/include" -I"C:/Users/ltd/Documents/STM32/GRBL Driver STM32F401/networking/wiznet" -I"C:/Users/ltd/Documents/STM32/GRBL Driver STM32F401/FatFs/STM" -I"C:/Users/ltd/Documents/STM32/GRBL Driver STM32F401/Drivers/FATFS/Target" -Og -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lwip-2f-src-2f-apps-2f-altcp_tls

clean-lwip-2f-src-2f-apps-2f-altcp_tls:
	-$(RM) ./lwip/src/apps/altcp_tls/altcp_tls_mbedtls.cyclo ./lwip/src/apps/altcp_tls/altcp_tls_mbedtls.d ./lwip/src/apps/altcp_tls/altcp_tls_mbedtls.o ./lwip/src/apps/altcp_tls/altcp_tls_mbedtls.su ./lwip/src/apps/altcp_tls/altcp_tls_mbedtls_mem.cyclo ./lwip/src/apps/altcp_tls/altcp_tls_mbedtls_mem.d ./lwip/src/apps/altcp_tls/altcp_tls_mbedtls_mem.o ./lwip/src/apps/altcp_tls/altcp_tls_mbedtls_mem.su

.PHONY: clean-lwip-2f-src-2f-apps-2f-altcp_tls


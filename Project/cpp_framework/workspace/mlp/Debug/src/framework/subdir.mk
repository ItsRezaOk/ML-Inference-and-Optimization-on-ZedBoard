################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/framework/ML.cpp \
../src/framework/Model.cpp \
../src/framework/Utils.cpp 

OBJS += \
./src/framework/ML.o \
./src/framework/Model.o \
./src/framework/Utils.o 

CPP_DEPS += \
./src/framework/ML.d \
./src/framework/Model.d \
./src/framework/Utils.d 


# Each subdirectory must supply rules for building sources it contributes
src/framework/%.o: ../src/framework/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -DZEDBOARD -Wall -O0 -g3 -I../src/framework -I../src/zedboard -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -std=c++17 -O3 -I/home/cam2022/CPRE-487_git/CPRE-4870/Project/cpp_framework/workspace/mlp_platform/export/mlp_platform/sw/mlp_platform/standalone_domain/bspinclude/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



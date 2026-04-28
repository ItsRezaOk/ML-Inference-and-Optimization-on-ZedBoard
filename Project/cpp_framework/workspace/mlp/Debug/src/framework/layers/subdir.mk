################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/framework/layers/Dense.cpp \
../src/framework/layers/Layer.cpp \
../src/framework/layers/LayerNorm.cpp \
../src/framework/layers/PatchEmbed.cpp \
../src/framework/layers/Softmax.cpp \
../src/framework/layers/TokenExtract.cpp \
../src/framework/layers/TransformerBlock.cpp 

OBJS += \
./src/framework/layers/Dense.o \
./src/framework/layers/Layer.o \
./src/framework/layers/LayerNorm.o \
./src/framework/layers/PatchEmbed.o \
./src/framework/layers/Softmax.o \
./src/framework/layers/TokenExtract.o \
./src/framework/layers/TransformerBlock.o 

CPP_DEPS += \
./src/framework/layers/Dense.d \
./src/framework/layers/Layer.d \
./src/framework/layers/LayerNorm.d \
./src/framework/layers/PatchEmbed.d \
./src/framework/layers/Softmax.d \
./src/framework/layers/TokenExtract.d \
./src/framework/layers/TransformerBlock.d 


# Each subdirectory must supply rules for building sources it contributes
src/framework/layers/%.o: ../src/framework/layers/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -DZEDBOARD -Wall -O0 -g3 -I../src/framework -I../src/zedboard -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -std=c++17 -O3 -I/home/cam2022/CPRE-487_git/CPRE-4870/Project/cpp_framework/workspace/mlp_platform/export/mlp_platform/sw/mlp_platform/standalone_domain/bspinclude/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



urbanSteeringProjectName = UrbanSteering
urbanAccessoriesProjectName = UrbanAccessories
urbanSteeringFile = UrbanSteeringFirmware
urbanAccessoriesFile = CAN-Accessories
exampleProject = Examples


.PHONY: help, compile, compileUrbanSteering, compileUrbanAccessories


help:
	@echo "Commands: make compile project=<UrbanSteering|UrbanAccessories|Examples>"


compile:
ifeq ($(project), $(urbanSteeringProjectName))
	$(MAKE)	compileUrbanSteering
else
ifeq ($(project), $(urbanAccessoriesProjectName)) 
	$(MAKE) compileUrbanAccessories
else 
ifeq ($(project), $(exampleProject))
	$(MAKE) compileExample	
else
	@echo ERROR: project $(project) does not exist
endif
endif
endif


compileUrbanSteering:
	@echo Compiling urban steering project
	cd $(urbanSteeringFile); mbed compile --source src --source ../mbed-os --build build -N $(urbanSteeringFile) -f


compileUrbanAccessories:
	@echo Compiling urban accessories project
	cd $(urbanAccessoriesFile); mbed compile --source src --source ../mbed-os --build build -N $(urbanAccessoriesFile) -f


compileExample:
	@echo Compiling example project
	mbed compile --source $(exampleProject) --source mbed-os --build $(exampleProject)/build -N $(exampleProject) -f




# SINFSimulators

This repository contains all the simulators to be used in SINF Course, together with all the configuration files and additional programs for testing purposes. If there's any doubt on how to execute the applications, please check Lab Guide #2 in moodle named PL2.

# SINF C Application for Sprint #2

In this repository we provide to all the students a working version of the C Application that should be implemented. This working version is intended for those who have not successfully implemented the C Application that is required for Sprint #2. This version is implemented in the file sinf_application.c and makes use of three core functions, available and hidden in the sinf_interfaces.h library:

- readSensors: Read messages from the MsgCreator, interprets the data to real sensor values and makes those available on the "sensors" variable;
- checkRules: Based on "sensors" variable, this function updates the "actuators" variables that define if an actuator is on or off;
- writeRGBMatrix: Writes the list of lists to the RGBMatrix to show both state of sensors and actuators.

This scenario is composed by three machines, each with a heater and a mote (temperature, humidity and light sensors). This means that in total we have 3 actuators (3 heater) and 3 temperature sensors, 3 humidity sensors and 3 light sensors. For the implemented rules, there are 3 defined thresholds that will turn on and off the heater. These are defined in the sinf_application.c in a global variable called "temp_threshold". If the temperature surpasses this threshold, the heater will turn off, and vice-versa. For purposes of simplicity, the heater control is only dependent on the temperature sensors. As for the presentation of information, each machine is depicted as a column in the RGBMatrix application, where the first line is the temperature sensor, the second one is the humidity sensor, the third is the light sensor and finally the fourth is the actuator. The color mapping for the temperature sensor is blue when the temperature is below threshold and red otherwise. For the heater, the color mapping is green when it is on, and red otherwise. The following image shows the mapping for all the cells in the RGBMatrix application:

<img src="https://github.com/SINF-FEUP/SINFSimulators/blob/master/RGBMatrix_Screenshot.png" width="600">

# Required files

In order to execute this working version you will need to following files:

- MsgCreator.py
- MsgCreatorConf.txt
- RGBMatrix.py
- RGBMatrixConf.txt
- sinf_application.c
- sinf_interfaces.o -> for Debian
- sinf_interfaces_rpi.o -> for Raspberry Pi 3 (please do not forget to rename the file to "sinf_interfaces.o")
- sinf_interfaces.h

# How to compile and build in Geany

The compilation remains the same, but in order to build you need to change the Build command. For that, in Geany IDE go to "Build", and click on "Set Build Commands". Now, on "C commands" you should see the following on the Build section:

gcc -Wall -o "%e" "%f"

Please replace this string on the Debian VM for the following:

gcc -Wall -o "%e" "%f" sinf_interfaces.o

Now, if you build your application is Geany IDE, you should be able to run it the same way as before. Finally, in order to execute the sinf_application, you should execute the following command in the terminal:

./sinf_application < /dev/pts/x > /dev/pts/y

where x and y are the channels you should use to read from MsgCreator and write to RGBMatrix, correspondingly.

# Important Structures

struct Measurements{
	int mote_id;
	int light;
	int humidity;
	int temperature;
};

struct Actuators{
	int heater_on;
};

# Database for Sprint #3

In the current repository you can find a file called *dump.sql* that has a short version of the database structure for you to use. For those who have not completed the minimum required database implementation, please feel free to use this file. In order to use it, once you log in the PostgreSQL phpPgAdmin, you need to click on top of your database, then on the SQL option and upload the file. Please upload the file for the correct database implementaiton.

So you can easily understand the database structure, please use as a reference the following Relational Model (primary keys in bold font):

* actuator (**act_id**, name, description)
* machine (**name**, description)
* sensor (**type**, description)
* mote (**mote_id**, name, series, #name->machine)
* sensor_mote (**#type->sensor**, **#mote_id->mote**)
* rules (**rule_id**, operator, value, #act_id->actuator, #type->sensor, #mote_id->mote)
* measure (**m_id**, timestamp, value, #type->sensor, #mote_id->mote)
* actuator_machine (**#act_id->actuator**, **#name->machine**)
* state (**s_id**, timestamp, state, #act_id->Actuator, #name->machine)

Regarding the above Relational Model, there are a couple aspects that need to be clarified:

* The relation *actuator_machine* exists because there's a many-to-many association between *actuator* and *machine*. This happens just because of the fact that actuators can be moved around machines, and we need to keep track of those;
* The relation *sensor* only stores the type 'TEMP' and not the sensor itself 'TEMP1'. Thus, there is a relation dedicated to associating sensors with motes.


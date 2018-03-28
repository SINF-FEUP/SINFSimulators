#include "sinf_interfaces.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

/*
 * In order to add or remove rooms from this working version, two changes need to be made.
 * 
 * 1) Change the definition NUMBER_ROOMS to the desired value, e.g. 2 if you only want to rooms
 * 2) Change the global variable temp_threshold with the intended threasholds. The number of thresholds
 * should match the NUMBER_ROOMS, e.g. int temp_threshold[NUMBER_ROOMS] = {8,17};
 * 
 * After these changes, you only need to compile, build and execute your code.
 * 
 * */


#define MAX_NAME_SZ 256
#define NUMBER_ROOMS 3
#define NUMBER_CELLS 4

int temp_threshold[NUMBER_ROOMS] = {10,15,20};

int main()
{	
	struct Measurements sensors[NUMBER_ROOMS];
	struct Actuators actuators[NUMBER_ROOMS];

	int print_values = 0;
	char str[MAX_NAME_SZ];
	
	while(1){
		
		fgets(str, MAX_NAME_SZ, stdin);
		
		readSensors(sensors,str);
		
		/*
		 * TODO: Create a function that sends the collected information to the database
		 */
		
		checkRules(sensors,actuators,NUMBER_ROOMS,temp_threshold);
		
		/*
		 * TODO: Create a function that fetches sensor information from the database
		 */
		
		if (print_values){
			printf("Temperature: %d\n", sensors[0].temperature);
			printf("Humidity: %d\n", sensors[0].humidity);
			printf("Light: %d\n", sensors[0].light);
			printf("Mote: %d\n", sensors[0].mote_id);
		}else{
			writeRGBMatrix(sensors,actuators,NUMBER_ROOMS,temp_threshold,NUMBER_CELLS);	
		}
	}
	
	return 0;
}

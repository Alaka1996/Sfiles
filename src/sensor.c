// src/sensor.c
#include "sensor.h"
#include "utils.h"
#include <stdio.h>
#include <stdlib.h>

#define BUFFER_SIZE 10

void read_sensor_data(uint16_t *data) {
    for(int i = 0; i < BUFFER_SIZE; i++) {
        data[i] = rand() % 1024;
    }
}

void process_data(uint16_t *data) {
    int avg = calculate_average(data, BUFFER_SIZE);
    printf("Average sensor value: %d\n", avg);
    
    if(avg > 512) {
        printf("Warning: Sensor value exceeds threshold!\n");
    } else {
        printf("Sensor value is within safe range.\n");
    }
}

void print_data(uint16_t *data, int size) {
    for (int i = 0; i < size; i++) {
        printf("Sensor Data[%d]: %d\n", i, data[i]);
    }
}

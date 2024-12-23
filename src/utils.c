// src/utils.c
#include "utils.h"

int calculate_average(uint16_t *data, int size) {
    int sum = 0;
    for(int i = 0; i < size; i++) {
        sum += data[i];
    }
    return sum / size;
}

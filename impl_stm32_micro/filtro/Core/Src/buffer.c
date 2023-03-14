/*
 * buffer.c
 *
 *  Created on: Jun 5, 2022
 *      Author: fernando
 */
#include "buffer.h"


uint8_t bufCplt;

uint32_t dacBuf[FULL_BUFFER_SIZE];
uint32_t* dacBufPtr;

uint32_t adcBuf[FULL_BUFFER_SIZE];
uint32_t* adcBufPtr;

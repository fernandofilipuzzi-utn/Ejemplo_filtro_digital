/*
 * buffer.c
 *
 * Ejemplo de diseño de filtro digital
 * Author: Filipuzzi, Fernando Rafael
 * Created: 14/03/2023 21:10:00
 * versión: 20230314
 */


#include "buffer.h"


uint8_t bufCplt;

uint32_t dacBuf[FULL_BUFFER_SIZE];
uint32_t* dacBufPtr;

uint32_t adcBuf[FULL_BUFFER_SIZE];
uint32_t* adcBufPtr;

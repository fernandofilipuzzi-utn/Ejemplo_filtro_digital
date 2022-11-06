/*
 * process_dsp.h
 *
 * Created: 12/12/2021 21:10:00
 *  Author: fernando
 */
#ifndef __PROCESS_DSP_H__
#define __PROCESS_DSP_H__

#ifdef __cplusplus
extern "C" {
#endif

#include "main.h"

//buffer de entrada "X" al bloque process
extern double xBuf[];

//buffer de salida "Y" al bloque process
extern double yBuf[];

void process(int16_t n);
void processDSP();

#endif  /* __FILTRO_H__ */

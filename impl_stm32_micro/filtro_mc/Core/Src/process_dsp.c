/*
 * process_filtro.c
 *
 *
 * Ejemplo de diseño de filtro digital
 * Author: Filipuzzi, Fernando Rafael
 * Created: 14/03/2023 21:10:00
 * versión: 20230314
 */

#include "process_dsp.h"
#include "buffer.h"

//buffer de entrada "X" al bloque process
double xBuf[FULL_BUFFER_SIZE];

//buffer de salida "Y" al bloque process
double yBuf[FULL_BUFFER_SIZE];

//estos punteros hay que declararlos volatiles sino cuando lo compila
//el optimizador del compilador los convierte a constantes
volatile double* xInBufPtr;
volatile double* yOutBufPtr;
volatile double* xBufPtr;
volatile double* yBufPtr;

volatile uint16_t q;

__weak void process(int16_t n)
{
	UNUSED(n);
}


void processDSP()
{
  if(bufCplt)
  {
    //para direc la parte de transferencia
    xInBufPtr =bufCplt&1 ? &xBuf[0] : &xBuf[BUFFER_SIZE];
    yOutBufPtr=bufCplt&1 ? &yBuf[0] : &yBuf[BUFFER_SIZE];

    //para direc la parte de procesamiento
    xBufPtr   =bufCplt&2 ? &xBuf[0] : &xBuf[BUFFER_SIZE];
    yBufPtr   =bufCplt&2 ? &yBuf[0] : &yBuf[BUFFER_SIZE];
	
	q =bufCplt&2? 0 : BUFFER_SIZE;

    for(uint16_t n=0;  n<BUFFER_SIZE; n++)
    {
      //transferencia entre las partes libres del buffer
      //adc(1/2)->X(1/2)
      xInBufPtr[n]=(adcBufPtr[n]/4098.0*3.3-1.5);

      //procesa la otra parte: Y(2/1)->X(2/1)
      //yBufPtr[n]=xBufPtr[n];
      process(q+n);

      //transferencia entre las partes libres del buffer
      //adc(1/2)->X(1/2)
      dacBufPtr[n]=(uint32_t)( (yOutBufPtr[n]+1.5)/3.3*4098.0 );
    }
    bufCplt=0;
  }
}

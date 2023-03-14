// filtro_iir.c
#include "filtro_iir.h"

#include "process_dsp.h"
#include "buffer.h"
#include "filtro_config.h"

#ifdef FILTRO_IIR
#ifdef FILTRO_LP

//Filtro IIR - Buttherworth - Pasa Bajo - bilineal(matlab)
//Orden: 8
//Frecuencia de Muestreo: 12760 (Hz)
#define ORDEN 8
double coef_x[]= {0.000004,0.000031,0.000108,0.000216,0.000270,
			0.000216,0.000108,0.000031,0.000004};
double coef_y[]= {-1.000000,5.527555,-13.650013,19.604363,-17.868804,
			10.565462,-3.952021,0.854023,-0.081553};

#endif //FILTRO_LP

#ifdef FILTRO_HP

volatile int16_t w;
volatile int16_t s;

void process(int16_t n)
{
	yBuf[n]=coef_x[0]*xBuf[n];

	for(int8_t m=1; m<(ORDEN+1); m++)
	{
		s = n-m;
		w = s>=0 ? s : FULL_BUFFER_SIZE+s;
		yBuf[n] += coef_x[m]*xBuf[w]+ coef_y[m]*yBuf[w];
	}
}

#endif //FILTRO_IIR

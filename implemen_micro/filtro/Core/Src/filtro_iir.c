/*
 * filtro_iir.c
 *
 * Created: 24/10/2022 09:04:00
 *  Author: fernando
 */

#include "filtro_iir.h"

#include "process_dsp.h"
#include "buffer.h"

#include "filtro_config.h"

#ifdef FILTRO_IIR

#ifdef FILTRO_LP

//Filtro IIR - Buttherworth - Pasa Bajo - bilineal(matlab)
//Orden: 8
//Frecuencia de Muestreo: 22418 (Hz)
#define ORDEN 8
double coef_x[]= {0.00000007,0.00000058,0.00000203,0.00000407,0.00000508,
		0.00000407,0.00000203,0.00000058,0.00000007};
double coef_y[]= {-1.00000000,6.57310282,-19.01044364,31.58305647,-32.95401793,
		22.10607950,-9.30763126,2.24834098,-0.23850553};

#endif //FILTRO_LP

#ifdef FILTRO_LP_CHEBYSHEV

//Filtro IIR - Chebyshev -  Pasa Bajo - bilineal(matlab)
//Orden: 8
//Frecuencia de Muestreo: 22418 (Hz)
#define ORDEN 8
double coef_x[]= {0.00000000,0.00000002,0.00000007,0.00000015,0.00000019,
		0.00000015,0.00000007,0.00000002,0.00000000};
double coef_y[]= {-1.00000000,7.45524989,-24.44480967,46.03641080,-54.45992407,
		41.43552867,-19.79953573,5.43221684,-0.65513740};

#endif //FILTRO_LP_CHEBYSHEV

#ifdef FILTRO_BP

//Filtro IIR - Buttherworth - Pasa Banda - bilineal(matlab)
//Orden: 5
//Frecuencia de Muestreo: 22418 (Hz)
#define ORDEN 10
double coef_x[]= {0.00001590,-0.00000000,-0.00007951,-0.00000000,0.00015902,
		-0.00000000,-0.00015902,-0.00000000,0.00007951,-0.00000000,
		-0.00001590};
double coef_y[]= {-1.00000000,8.60684135,-33.91205680,80.49757056,-127.42624846,
		140.52526259,-109.32857281,59.25740441,-21.42019228,4.66518510,
		-0.46522603};

#endif //FILTRO_BP

#ifdef FILTRO_HP

//Filtro IIR - Buttherworth - Pasa Alto - bilineal(matlab)
//Orden: 8
//Frecuencia de Muestreo: 22364 (Hz)
#define ORDEN 8
double coef_x[]= {0.48742393,-3.89939144,13.64787002,-27.29574005,34.11967506,
		-27.29574005,13.64787002,-3.89939144,0.48742393};
double coef_y[]= {-1.00000000,6.56977298,-18.99171389,31.53756909,-32.89221913,
		22.05537544,-9.28251651,2.24138942,-0.23767630};

#endif //FILTRO_HP


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

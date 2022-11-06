/*
 * filtro_fir.c
 *
 * Created: 12/12/2021 21:10:00
 *  Author: fernando
 */

#include "filtro_fir.h"

#include "process_dsp.h"
#include "buffer.h"

#include "filtro_config.h"

#ifdef FILTRO_FIR


#ifdef FILTRO_LP

//Filtro FIR -pasa_bajo -
//Orden: 15
//Frecuencia de Muestreo: 22418 (Hz)
#define ORDEN 14
double coef_x[]= {0.00281603,0.00402985,-0.00701053,-0.00666350,0.03715006,
		0.11856189,0.19464913,0.22481934,0.19464913,0.11856189,
		0.03715006,-0.00666350,-0.00701053,0.00402985,0.00281603
		};
double coef_y[]= {-1.00000000,0.00000000,0.00000000,0.00000000,0.00000000,
		0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,
		0.00000000,0.00000000,0.00000000,0.00000000,0.00000000
		};

#endif //FILTRO_LP

#ifdef FILTRO_BP

//Filtro Pasa Banda - bilineal(matlab)
 //Orden: 2
 //Frecuencia de Muestreo: 12760 (Hz)
 #define ORDEN 5
 double coef_x[]= {0.038210,-0.000000,-0.076420,-0.000000,0.038210 };
 double coef_y[]= {-1.000000,2.914602,-3.541090,2.101071,-0.528842};


#endif //FILTRO_BP

#ifdef FILTRO_HP

//Filtro FIR -pasa_alto -
//Orden: 15
//Frecuencia de Muestreo: 22364 (Hz)
#define ORDEN 14
double coef_x[]= {-0.00865977,-0.03052339,-0.05472302,-0.07905268,-0.10115784,
		-0.11881618,-0.13020860,0.86585584,-0.13020860,-0.11881618,
		-0.10115784,-0.07905268,-0.05472302,-0.03052339,-0.00865977
		};
double coef_y[]= {-1.00000000,0.00000000,0.00000000,0.00000000,0.00000000,
		0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,
		0.00000000,0.00000000,0.00000000,0.00000000,0.00000000
		};

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
		yBuf[n] += coef_x[m]*xBuf[w];
	}
}

#endif //FILTRO_FIR


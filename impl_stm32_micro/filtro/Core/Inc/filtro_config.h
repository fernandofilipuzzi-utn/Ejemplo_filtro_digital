/*
 * filtro_config.h
 *
 *  Created on: Jun 5, 2022
 *      Author: fernando
 */
#ifndef __FILTRO_CONFIG_H_
#define __FILTRO_CONFIG_H_

#ifdef __cplusplus
extern "C" {
#endif

//problema de buffer

//#define FILTRO_IIR
#define FILTRO_FIR

#define FILTRO_LP //pasa bajo
//#define FILTRO_LP_CHEBYSHEV //pasa bajo
//#define FILTRO_BP   //pasa medio
//#define FILTRO_HP //pasa alto

#ifdef __cplusplus
}
#endif

#endif /* __FILTRO_CONFIG_H__ */

/*
 * filtro_config.h
 *
 * Ejemplo de diseño de filtro digital
 * Author: Filipuzzi, Fernando Rafael
 * Created: 14/03/2023 21:10:00
 * versión: 20230314
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

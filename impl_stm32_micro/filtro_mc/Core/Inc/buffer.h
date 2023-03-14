/*
 * buffer.h
 *
 * Ejemplo de diseño de filtro digital
 * Author: Filipuzzi, Fernando Rafael
 * Created: 14/03/2023 21:10:00
 * versión: 20230314
 */

#ifndef __BUFFER_H_
#define __BUFFER_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "main.h"

//indica que completó el buffer, una mitad o la otra
//sirve para indicarle al process block que procese la mitad del bloque
//en el caso  ejecutarlo desde el main
extern uint8_t bufCplt;

#define BUFFER_SIZE 512
#define FULL_BUFFER_SIZE 1024

extern uint32_t dacBuf[];
extern uint32_t* dacBufPtr;

extern uint32_t adcBuf[];
extern uint32_t* adcBufPtr;

#ifdef __cplusplus
}
#endif

#endif  /* INC_BUFFER_H_ */

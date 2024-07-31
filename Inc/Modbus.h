/*
 * Modbus.h
 *
 *  Created on: Jul 18, 2024
 *      Author: DELL
 */

#ifndef INC_MODBUS_H_
#define INC_MODBUS_H_

#define SLAVE_ID 1

#define ILLEGAL_FUNCTION       0x01
#define ILLEGAL_DATA_ADDRESS   0x02
#define ILLEGAL_DATA_VALUE     0x03


unsigned short crc16(unsigned char *puchMsg, unsigned short usDataLen);
void sendData (uint8_t *data, int size);
void modbusException (uint8_t exceptioncode);
uint8_t readCoils (void);			//0x01
uint8_t readHoldingRegs (void); 	//0x03
uint8_t readInputRegs (void);		//0x04
uint8_t writeSingleCoil (void);		//0x05
uint8_t writeSingleReg (void);		//0x06
uint8_t writeMultiCoils (void);		//0x15
uint8_t writeHoldingRegs (void);	//0x16
#endif /* INC_MODBUS_H_ */

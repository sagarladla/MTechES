#include <stdlib.h>
#include <stdio.h>
#include <lpc23xx.h>
#include "LCD.h"

unsigned int adcdata;
float voltage;

void delay(void);

int main(void)
{
	
	char bits_id[] = "2024HT01123";
	char *voltage_buffer;
	// enable power to ADC
	PCONP |= (1 << 12);
	// enable input pin of ADC
	// enable AD0.0 pin as input of ADC
	PINSEL1 = 0x4000;
	// enable interrupt to ADC - 	ADC0 INTERRUPT ENABLE REGISTER
	// AD0INTEN = 0x2;
	
	// Without interrupt - types of polling modes - Burst mode and Software trigger mode
	// AD0CR = 0x00210202; // 0x00210202 --Burst mode // 0x01200202 --Software Trigger
	AD0CR |= (1 << 0); // PIN SEL - SELECTING 1ST PIN AS INPUT
	AD0CR |= (1 << 9); // SET CLKDIV
	AD0CR |= (1 << 16); // SET BURST MODE BIT
	AD0CR |= (1 << 21); // SET PDN MODE BIT
	
	lcd_init();
	lcd_clear();
	lcd_print((const unsigned char *)bits_id);
	
	while (1)
	{
		// when bit 1st is set, i.e., 2 value - then conversion is completed. So loop till conversion is not completed
		while (!(AD0STAT & 0x01))
		{
			adcdata = AD0DR0 & 0x0000ffc0;
			// right shift to get 10 bit data
			adcdata >>= 6;
			// convert reading to voltage
			// precision = 2^10 = 1024
			// Vref = 3.3 V
			voltage = (adcdata / 1024.0) * 3.3;
			sprintf(voltage_buffer, "%f", voltage);
			set_cursor(0,1);
			printf("%s", voltage_buffer);
			lcd_print((const unsigned char *)voltage_buffer);
			lcd_print((const unsigned char *)"15/10");
			delay();
		}
	}
}

void delay(void)
{
	int i = 1000,j = 10000;
	while(i--);
	while(j--);
}

/**
 * @author	:	Sagar Ladla
 * @date		: 22 Oct 2024
 * @subject	: ADC, LCD Interfacing
 */

#include <stdio.h>
#include <lpc23xx.h>

#include "LCD.h"

unsigned int adcdata;
float voltage;

void delay(void);

int main(void)
{
	char bits_id[] = "2024HT01123";
	char buffer[10];
	// enable power to ADC
	PCONP |= (1 << 12);
	// enable input pin of ADC
	// enable AD0.0 pin as input of ADC
	PINSEL1 |= (1 << 14);
	PINSEL1 &= ~(1 << 15);
	// enable interrupt to ADC - 	ADC0 INTERRUPT ENABLE REGISTER
	// AD0INTEN |= 0x1;
	lcd_init();
	lcd_clear();
	set_cursor(0,0);
	lcd_print((const unsigned char *)bits_id);	
	// Without interrupt - types of polling modes - Burst mode and Software trigger mode
	// AD0CR = 0x00210202; // 0x00210202 --Burst mode // 0x01200202 --Software Trigger
	AD0CR |= (1 << 0); // PIN SEL - SELECTING 1ST PIN AS INPUT
	AD0CR |= (1 << 9); // SET CLKDIV
	AD0CR |= (1 << 16); // SET BURST MODE BIT
	AD0CR |= (1 << 21); // SET PDN MODE BIT
	//AD0CR |= (1 << 24); // SET SOFTWARE TRIGGER MODE (INTERRUPT)
	while (1)
	{
		// when bit 1st is set, i.e., 2 value - then conversion is completed. So loop till conversion is not completed
		while (!(AD0STAT & 0x01));
		adcdata = AD0DR0 & 0xffc0;
		// right shift to get 10 bit data
		adcdata >>= 6;
		// convert reading to voltage
		// precision = 2^10 = 1024
		// Vref = 3.3 V
		voltage = (adcdata / 1024.0) * 3.3;
		sprintf(buffer, "%fV 23/10", voltage);
		set_cursor(0,1);
		lcd_print((const unsigned char *)buffer);
		delay();
		//AD0CR |= (1 << 24);	
	}
}

void delay(void)
{
	int i = 1000,j = 1000;
	while(i--);
	while(j--);
	return;
}

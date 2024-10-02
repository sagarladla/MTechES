#include <lpc23xx.h>

int adcdata;
float voltage;

void delay(void);

int main(void)
{
	// enable power to ADC
	PCONP |= (1 << 12);
	// enable input pin of ADC
	// enable AD0.1 pin as input of ADC
	PINSEL1 = 0x00010000;
	// enable interrupt to ADC - 	ADC0 INTERRUPT ENABLE REGISTER
	// AD0INTEN = 0x2;
	
	// Without interrupt - types of polling modes - Burst mode and Software trigger mode
	AD0CR = 0x00210202; // 0x00210202 --Burst mode // 0x01200202 --Software Trigger
	while (1)
	{
		// when bit 1st is set, i.e., 2 value - then conversion is completed. So loop till conversion is not completed
		while (!(AD0STAT & 0x02))
		{
			adcdata = AD0DR1 & 0xffc0;
			// right shift to get 10 bit data
			adcdata >>= 6;
			// convert reading to voltage
			// precision = 2^10 = 1024-1 = 1023
			// Vref = 3.3 V
			voltage = (adcdata / 1023.0) * 3.3;
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

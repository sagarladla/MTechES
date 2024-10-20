# 1 "LCD_4bit.c"
 
 
 
 
 
 
 
 
 

# 1 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"


















 




 
# 36 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

# 69 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"


 
# 104 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

 
# 138 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"




 
# 155 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

# 166 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

 
# 177 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

 

















 
# 203 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

























 























































































































































































 


 




 





 



 






	
 





 


 


 



 


 










 





 
# 489 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

# 498 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

 
# 507 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

# 515 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

# 523 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

# 531 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"



	
 
# 554 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

 
# 574 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

 
# 594 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

 
# 614 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"


 
# 639 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

# 662 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"


 
# 680 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

 
# 698 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

 
# 715 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

 
# 732 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

 
# 742 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

 
# 752 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

 
# 762 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

 
# 770 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

 
# 783 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

 
# 796 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"


 
# 827 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"


 
# 843 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"


 




 
# 857 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

 
# 868 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"






# 887 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"
  	
# 900 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

# 914 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"
  	
# 927 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"


 
# 950 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"


 
# 964 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"


 
# 982 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

 






 







 





 






 






 




 



 






 
# 1053 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

 
# 1079 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

 
# 1087 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"

# 1095 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"






 
# 1117 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"





# 1134 "C:\\Keil_v5\\ARM\\INC\\Philips\\lpc23xx.h"


























# 12 "LCD_4bit.c"
# 1 "LCD.h"
 
 
 
 
 
 
 
 
 


extern void lcd_init    (void);
extern void lcd_clear   (void);
extern void lcd_putchar (char c);
extern void set_cursor  (unsigned char column, unsigned char line);
extern void lcd_print   (unsigned char const *string);

 

# 13 "LCD_4bit.c"

 

 


 


 




 








 










# 53 "LCD_4bit.c"

 


 


 


 


 


 


 


 


 


 
const unsigned char UserFont[8][8] = {
  { 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 },
  { 0x10,0x10,0x10,0x10,0x10,0x10,0x10,0x10 },
  { 0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18 },
  { 0x1C,0x1C,0x1C,0x1C,0x1C,0x1C,0x1C,0x1C },
  { 0x1E,0x1E,0x1E,0x1E,0x1E,0x1E,0x1E,0x1E },
  { 0x1F,0x1F,0x1F,0x1F,0x1F,0x1F,0x1F,0x1F },
  { 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 },
  { 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 }
};


 






 

static void delay (int cnt)
{
  cnt <<= 0;

  while (cnt--);
}






 

static unsigned char lcd_read_status (void)
{
  unsigned char status;

  (*(volatile unsigned long *)(0xE0028000 + 0x18)) &= ~0x0F000000;
  ((0) ? ((*(volatile unsigned long *)(0xE0028000 + 0x14)) = 0x10000000) : ((*(volatile unsigned long *)(0xE0028000 + 0x1C)) = 0x10000000));
  ((1) ? ((*(volatile unsigned long *)(0xE0028000 + 0x14)) = 0x20000000) : ((*(volatile unsigned long *)(0xE0028000 + 0x1C)) = 0x20000000));
  delay(10);
  ((1) ? ((*(volatile unsigned long *)(0xE0028000 + 0x14)) = 0xC0000000) : ((*(volatile unsigned long *)(0xE0028000 + 0x1C)) = 0xC0000000) );
  delay(10);
  status  = (((*(volatile unsigned long *)(0xE0028000 + 0x10)) >> 24) & 0xF) << 4;
  ((0) ? ((*(volatile unsigned long *)(0xE0028000 + 0x14)) = 0xC0000000) : ((*(volatile unsigned long *)(0xE0028000 + 0x1C)) = 0xC0000000) );
  delay(10);
  ((1) ? ((*(volatile unsigned long *)(0xE0028000 + 0x14)) = 0xC0000000) : ((*(volatile unsigned long *)(0xE0028000 + 0x1C)) = 0xC0000000) );
  delay(10);
  status |= (((*(volatile unsigned long *)(0xE0028000 + 0x10)) >> 24) & 0xF);
  ((0) ? ((*(volatile unsigned long *)(0xE0028000 + 0x14)) = 0xC0000000) : ((*(volatile unsigned long *)(0xE0028000 + 0x1C)) = 0xC0000000) );
  (*(volatile unsigned long *)(0xE0028000 + 0x18)) |= 0x0F000000;
  return (status);
}






 

static unsigned char wait_while_busy (void)
{
  unsigned char status;

  do  {
    status = lcd_read_status();
  }  while (status & 0x80);              

  return (status);
}






 

void lcd_write_4bit (unsigned char c)
{
  ((0) ? ((*(volatile unsigned long *)(0xE0028000 + 0x14)) = 0x20000000) : ((*(volatile unsigned long *)(0xE0028000 + 0x1C)) = 0x20000000));
  ((1) ? ((*(volatile unsigned long *)(0xE0028000 + 0x14)) = 0xC0000000) : ((*(volatile unsigned long *)(0xE0028000 + 0x1C)) = 0xC0000000) );
  (*(volatile unsigned long *)(0xE0028000 + 0x1C)) = 0x0F000000; (*(volatile unsigned long *)(0xE0028000 + 0x14)) = (c&0x0F & 0xF) << 24;
  delay(10);
  ((0) ? ((*(volatile unsigned long *)(0xE0028000 + 0x14)) = 0xC0000000) : ((*(volatile unsigned long *)(0xE0028000 + 0x1C)) = 0xC0000000) );
  delay(10);
}






 

void lcd_write_cmd (unsigned char c)
{
  wait_while_busy();

  ((0) ? ((*(volatile unsigned long *)(0xE0028000 + 0x14)) = 0x10000000) : ((*(volatile unsigned long *)(0xE0028000 + 0x1C)) = 0x10000000));
  lcd_write_4bit (c>>4);
  lcd_write_4bit (c);
}






 

static void lcd_write_data (unsigned char c)
{
  wait_while_busy();

  ((1) ? ((*(volatile unsigned long *)(0xE0028000 + 0x14)) = 0x10000000) : ((*(volatile unsigned long *)(0xE0028000 + 0x1C)) = 0x10000000));
  lcd_write_4bit (c>>4);
  lcd_write_4bit (c);
}






 

void lcd_putchar (char c)
{ 
  lcd_write_data (c);
}






 

void lcd_init (void)
{ 
  int i;
  unsigned char const *p;

   
  (*(volatile unsigned long *)(0xE0028000 + 0x18)) |= 0xF0000000 | 0x0F000000;

  delay (15000);
  ((0) ? ((*(volatile unsigned long *)(0xE0028000 + 0x14)) = 0x10000000) : ((*(volatile unsigned long *)(0xE0028000 + 0x1C)) = 0x10000000));
  lcd_write_4bit (0x3);                  
  delay (4100);
  lcd_write_4bit (0x3);
  delay (100);
  lcd_write_4bit (0x3);
  lcd_write_4bit (0x2);

  lcd_write_cmd (0x28);                  
  lcd_write_cmd (0x0C);                  
  lcd_write_cmd (0x06);                  

   
  lcd_write_cmd(0x40);                   
  p = &UserFont[0][0];
  for (i = 0; i < sizeof(UserFont); i++, p++)
    lcd_putchar (*p);

  lcd_write_cmd(0x80);                   
}








 

void set_cursor (unsigned char column, unsigned char line)
{
  unsigned char address;

  address = (line * 40) + column;
  address = 0x80 + (address & 0x7F);
  lcd_write_cmd(address);                
}





 

void lcd_clear (void)
{
  lcd_write_cmd(0x01);                   
  set_cursor (0, 0);
}






 

void lcd_print (unsigned char const *string)
{
  while (*string)  {
    lcd_putchar (*string++);
  }
}

 


#include "bootpack.h"
#include<stdio.h>

void HariMain(void)
{
	
    struct BOOTINFO * binfo = (struct BOOTINFO *) 0x0ff0;
	char s[40], mcursor[256];//16 �� 16
	int mx, my; //���x,yλ��
	
	init_gdtidt();
	init_pic();//ϵͳ��ʼ����һЩ�趨
	init_palette(); /* �趨��ɫ��*/
	init_screen8(binfo->vram, binfo->scrnx, binfo->scrny);
	mx = (binfo->scrnx - 16) / 2; /* Ϊ��ʹ���ָ����� */
	my = (binfo->scrny - 28 - 16) / 2;
	init_mouse_cursor8(mcursor, COL8_008484);
	putblock8_8(binfo->vram, binfo->scrnx, 16, 16, mx, my, mcursor, 16);
	sprintf(s, "(%d, %d)", mx, my);
	putfonts8_asc(binfo->vram, binfo->scrnx, 0, 0, COL8_FFFFFF, s);
	
	for (;;) {
		io_hlt();
	}
}


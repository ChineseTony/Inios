/* ���߱�����,��һ�������ڱ���ļ��� */
void io_hlt(void);
void write_mem8(int addr,int data);
/* �Ǻ���������ȴû�к����壬���ʾ����˼�ǣ������ڱ���ļ��������������Լ�ȥ�Ұ��� */

void HariMain(void)
{
	int i;//����������i��һ��32λ����
	
	for(i=0xa0000;i<=0xaffff;i++)
	{
		write_mem8(i,15);//VRAMȫ��д��15
	}
	for(;;)
	{
		io_hlt();
	}

}

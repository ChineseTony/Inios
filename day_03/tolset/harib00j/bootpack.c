/* ���߱�����,��һ�������ڱ���ļ��� */

void io_hlt(void);

/* �Ǻ���������ȴû�к����壬���ʾ����˼�ǣ������ڱ���ļ��������������Լ�ȥ�Ұ��� */

void HariMain(void)
{

fin:
	io_hlt(); /* ִ��naskfunc.nas���_io_hlt */
	goto fin;

}

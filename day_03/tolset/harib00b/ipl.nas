; haribote-ipl
; TAB=4

		ORG		0x7c00			; ָ�������װ�ص�ַ

; ��������Ǳ�׼FAT12��ʽ����ר�õĴ���

		DB		0xeb, 0x4e, 0x90
		DB		"HELLOIPL"		;	�����������ƿ�����������ַ�����8�ֽڣ�
		DW		512				;	ÿ��������sector���Ĵ�С������Ϊ512�ֽڣ�
		DB 		1				;	�أ�cluster���Ĵ�С������Ϊ1��������
		DW		1				;	FAT����ʼλ�ã�һ��ӵ�һ��������ʼ��
		DB		2				;	FAT�ĸ���������Ϊ2��
		DW		224				;	��Ŀ¼�Ĵ�С��һ�����224�
		DW		2880			;	�ô��̵Ĵ�С��������2880������
		DB		0xf0			;	���̵����ࣨ������0xf0��
		DW		9				;	FAT�ĳ��ȣ�������9������
		DW		18				;	1���ŵ���track���м���������������18��
		DW		2				;	��ͷ����������2��
		DD		0				;	�����÷�����������0
		DD		2880			;	��дһ�δ��̴�С
		DB		0,0,0x29		;	���岻�����̶�
		DD		0xffffffff		;	(������) ������
		DB		"HELLO-OS   "	;	���̵����ƣ�11�ֽڣ�
		DB		"FAT12   "		;	���̸�ʽ���ƣ�8�ֽڣ�
		RESB	18				;	�ȿճ�18�ֽ�

; ��������

entry:
		MOV		AX,0			;  ��ʼ���Ĵ���
		MOV		SS,AX
		MOV		SP,0x7c00
		MOV		DS,AX

; ����

		MOV		AX,0x0820
		MOV		ES,AX
		MOV		CH,0			; ����0
		MOV		DH,0			; ��ͷ0
		MOV		CL,2			; ����2����һ����������������������
		
	    MOV		SI,0			; ��¼ʧ�ܴ����ļĴ���
		
		
	   
retry:
		MOV		AH,0x02			; AH=0x02 : ������� 
		MOV		AL,1			; 1������
		MOV		BX,0			
		MOV		DL,0x00			; A������
		INT		0x13			; ���ô���BIOS �ж��Ƿ�������
		JNC		fin				; û����Ļ�����ת��fin
		ADD		SI,1			; ��SI �� 1
		CMP		SI,5			; �Ƚ�SI �� 5
		JAE		error			; SI >= 5ʱ����ת��error
		MOV		AH,0x00
		MOV		DL,0x00			; A ������
		INT		0x13			; ����������
		JMP		retry



fin:
		HLT						; ��CPUֹͣ���ȴ�ָ���CPU�������
		JMP		fin				; ����ѭ��

error:
		MOV		SI,msg
putloop:
		MOV		AL,[SI]
		ADD		SI,1			; ��SI��ַ��һ���ֽڵ����ݶ���AL��
		CMP		AL,0            ; �Ƚ�AL�Ƿ����0
		JE		fin				; ����ȽϵĽ������������ת��fin,fin��һ����ţ���ʾ��������
		MOV		AH,0x0e			; ��ʾһ������
		MOV		BX,15			; ָ���ַ���ɫ
		INT		0x10			; �����Կ�BIOS��INT ��һ���ж�ָ����������ʱ���Ϊ���������á�
		JMP		putloop
msg:
		DB		0x0a, 0x0a		; ��������
		DB		"load error"
		DB		0x0a			; ����
		DB		0

		RESB	0x7dfe-$		; ��0x7dfe��ַ��ʼ��0x00���

		DB		0x55, 0xaa

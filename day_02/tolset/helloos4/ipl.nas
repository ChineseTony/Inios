; hello-os
; TAB=4

		ORG		0x7c00			; �w�������I��?�n��

; �ȉ�?�q?��?�yFAT�i��??

		JMP		entry
		DB		0x90
		DB		"HELLOIPL"		; ??��I���̉Ȑ��C�ӓI�������i8��?�j
		DW		512				; ?�����isector�j�I�召�i�K??512��?�j
		DB		1				; �Ɓicluster�j�I�召�i�K??1�����j
		DW		1				; FAT�I�N�n�ʒu�i��ʘ���꘢���?�n�j
		DB		2				; FAT�I�����i�K??2�j
		DW		224				; ����?�I�召�i���?��224?�j
		DW		2880			; ?��?�I�召�i�K?��2880���j
		DB		0xf0			; ��?�I??�i�K?��0xf0�j
		DW		9				; FAT�I?�x�i�K?��9���j
		DW		18				; 1�������itrack�j�L�{�����i�K?��18�j
		DW		2				; ��?���i�K?��2�j
		DD		0				; �s?�p����C�K?��0
		DD		2880			; �d�ʈꎟ��?�召
		DB		0,0,0x29		; ��?�s���C�Œ�
		DD		0xffffffff		; (�\��) ��?��?
		DB		"HELLO-OS   "	; ��?�I���́i11��?�j���ӁF�������I��i�s�����֓U�ʓI�C����?��?�[��?
		DB		"FAT12   "		; ��?�i�����́i8��?�j
		RESB	18				; ���o18��?

; �����j�S

entry:
		MOV		AX,0			; ���n���񑶊�
		MOV		SS,AX
		MOV		SP,0x7c00
		MOV		DS,AX
		MOV		ES,AX

		MOV		SI,msg
putloop:						; �z?
		MOV		AL,[SI]			; �cSI�n���I�꘢��?�I���e?��AL��
		ADD		SI,1			; ?SI��1
		CMP		AL,0			; ��?AL���ۓ���0
		JE		fin				; �@�ʔ�?�I?�ʐ����C?��?��fin,fin���꘢?���C�\���g?���h
		MOV		AH,0x0e			; ?���꘢����
		MOV		BX,15			; �w�莚��?�F
		INT		0x10			; ?�p??BIOS�CINT ���꘢���f�w�߁C?����??����?�g����?�p�h
		JMP		putloop
fin:
		HLT						; ?CPU��~�C���Ҏw�߁C?CPU?���Ҋ���?
		JMP		fin				; �ٌ��z?

msg:
		DB		0x0a, 0x0a		; ?�s?��
		DB		"hello,Inios"
		DB		0x0a			; ?�s
		DB		0

		RESB	0x7dfe-$		; ��0x7dfe�n��?�n�p0x00�U�[

		DB		0x55, 0xaa
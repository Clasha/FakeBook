/*----------------------------------------------
 * �Խñ�
 ---------------------------------------------- */
SELECT * FROM board;
DELETE FROM board;


/* ============================================ */
CREATE SEQUENCE seq_board;

ALTER TABLE board
	DROP
		CONSTRAINT FK_member_TO_board
		CASCADE;

		
ALTER TABLE board
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

		
/* �Խñ� */
DROP TABLE board 
	CASCADE CONSTRAINTS;

	
/* �Խñ� */
CREATE TABLE board (
	board_num NUMBER(13) NOT NULL, /* �۹�ȣ */
	m_num NUMBER(10), /* ȸ����ȣ */
	reg_date DATE, /* �ð� */
	open_level NUMBER(1), /* �������� */
	content VARCHAR2(2000), /* ���� */
	place VARCHAR2(150), /* ��� */
	picture VARCHAR2(150), /* ���� */
	video VARCHAR2(150) /* ���� */
	
);


ALTER TABLE board
	ADD
		CONSTRAINT PK_board
		PRIMARY KEY (
			board_num
		);

		
ALTER TABLE board
	ADD
		CONSTRAINT FK_member_TO_board
		FOREIGN KEY (
			m_num
		)
		REFERENCES member (
			m_num
		);

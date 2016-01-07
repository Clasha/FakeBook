/*----------------------------------------------
 * ���
 ---------------------------------------------- */

SELECT * FROM reply;
DELETE FROM reply;

/* ============================================ */

ALTER TABLE reply
	DROP
		CONSTRAINT FK_board_TO_reply
		CASCADE;

ALTER TABLE reply
	DROP
		CONSTRAINT FK_member_TO_reply
		CASCADE;

ALTER TABLE reply
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

/* ��� */
DROP TABLE reply 
	CASCADE CONSTRAINTS;

create sequence seq_reply_num;
/* ��� */
CREATE TABLE reply (
	reply_num NUMBER(13) NOT NULL, /* ��۹�ȣ */
	board_num NUMBER(13), /* �۹�ȣ */
	m_num NUMBER(10), /* ����ۼ��� */
	parent_reply NUMBER(13), /* �θ��۹�ȣ */
	r_date DATE, /* �ð� */
	r_content VARCHAR2(1000) /* ��۳��� */
);



ALTER TABLE reply
	ADD
		CONSTRAINT PK_reply
		PRIMARY KEY (
			reply_num
		);

ALTER TABLE reply
	ADD
		CONSTRAINT FK_board_TO_reply
		FOREIGN KEY (
			board_num
		)
		REFERENCES board (
			board_num
		);

ALTER TABLE reply
	ADD
		CONSTRAINT FK_member_TO_reply
		FOREIGN KEY (
			m_num
		)
		REFERENCES member (
			m_num
		);
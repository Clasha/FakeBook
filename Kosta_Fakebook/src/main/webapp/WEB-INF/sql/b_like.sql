/*----------------------------------------------
 * �Խñ� ���ƿ�
 ---------------------------------------------- */

SELECT * FROM b_like;
DELETE FROM b_like;

/* ============================================ */
ALTER TABLE b_like
	DROP
		CONSTRAINT FK_member_TO_b_like
		CASCADE;

ALTER TABLE b_like
	DROP
		CONSTRAINT FK_board_TO_b_like
		CASCADE;

ALTER TABLE b_like
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

/* ���ƿ� */
DROP TABLE b_like 
	CASCADE CONSTRAINTS;

/* ���ƿ� */
CREATE TABLE b_like (
	board_num NUMBER(13) NOT NULL, /* �۹�ȣ */
	m_num NUMBER(10) NOT NULL, /* ȸ����ȣ */
	like_date DATE /* �ð� */
);

ALTER TABLE b_like
	ADD
		CONSTRAINT PK_b_like
		PRIMARY KEY (
			board_num,
			m_num
		);

ALTER TABLE b_like
	ADD
		CONSTRAINT FK_member_TO_b_like
		FOREIGN KEY (
			m_num
		)
		REFERENCES member (
			m_num
		);

ALTER TABLE b_like
	ADD
		CONSTRAINT FK_board_TO_b_like
		FOREIGN KEY (
			board_num
		)
		REFERENCES board (
			board_num
		);
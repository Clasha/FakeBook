/*----------------------------------------------
 * ´ñ±Û
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

/* ´ñ±Û */
DROP TABLE reply 
	CASCADE CONSTRAINTS;

create sequence seq_reply_num;
/* ´ñ±Û */
CREATE TABLE reply (
	reply_num NUMBER(13) NOT NULL, /* ´ñ±Û¹øÈ£ */
	board_num NUMBER(13), /* ±Û¹øÈ£ */
	m_num NUMBER(10), /* ´ñ±ÛÀÛ¼ºÀÚ */
	parent_reply NUMBER(13), /* ºÎ¸ð´ñ±Û¹øÈ£ */
	r_date DATE, /* ½Ã°£ */
	r_content VARCHAR2(1000) /* ´ñ±Û³»¿ë */
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
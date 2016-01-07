/*----------------------------------------------
 * 게시글 좋아요
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

/* 좋아요 */
DROP TABLE b_like 
	CASCADE CONSTRAINTS;

/* 좋아요 */
CREATE TABLE b_like (
	board_num NUMBER(13) NOT NULL, /* 글번호 */
	m_num NUMBER(10) NOT NULL, /* 회원번호 */
	like_date DATE /* 시간 */
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
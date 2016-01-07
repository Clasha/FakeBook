/*----------------------------------------------
 * 게시글
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

		
/* 게시글 */
DROP TABLE board 
	CASCADE CONSTRAINTS;

	
/* 게시글 */
CREATE TABLE board (
	board_num NUMBER(13) NOT NULL, /* 글번호 */
	m_num NUMBER(10), /* 회원번호 */
	reg_date DATE, /* 시간 */
	open_level NUMBER(1), /* 공개수준 */
	content VARCHAR2(2000), /* 내용 */
	place VARCHAR2(150), /* 장소 */
	picture VARCHAR2(150), /* 사진 */
	video VARCHAR2(150) /* 비디오 */
	
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

/*----------------------------------------------
 * 해시태그
 ---------------------------------------------- */

SELECT * FROM hash;
DELETE FROM hash;

/*============================================= */

ALTER TABLE hash
	DROP
		CONSTRAINT FK_board_TO_hash
		CASCADE;

/* 해시태그 */
DROP TABLE hash 
	CASCADE CONSTRAINTS;

/* 해시태그 */
CREATE TABLE hash (
	hash_code VARCHAR2(150), /* 해시코드 */
	board_num NUMBER(13) /* 게시글번호 */
);

ALTER TABLE hash
	ADD
		CONSTRAINT FK_board_TO_hash
		FOREIGN KEY (
			board_num
		)
		REFERENCES board (
			board_num
		);
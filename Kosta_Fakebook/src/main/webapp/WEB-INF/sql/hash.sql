/*----------------------------------------------
 * �ؽ��±�
 ---------------------------------------------- */

SELECT * FROM hash;
DELETE FROM hash;

/*============================================= */

ALTER TABLE hash
	DROP
		CONSTRAINT FK_board_TO_hash
		CASCADE;

/* �ؽ��±� */
DROP TABLE hash 
	CASCADE CONSTRAINTS;

/* �ؽ��±� */
CREATE TABLE hash (
	hash_code VARCHAR2(150), /* �ؽ��ڵ� */
	board_num NUMBER(13) /* �Խñ۹�ȣ */
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
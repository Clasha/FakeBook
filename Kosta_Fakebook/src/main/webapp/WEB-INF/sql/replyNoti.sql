/*----------------------------------------------
 * ´ñ±Û ¾Ë¸²
 ---------------------------------------------- */

SELECT * FROM replyNoti;
DELETE FROM replyNoti;

/* ============================================ */

create table replyNoti (
	noti_num NUMBER(10) NOT NULL,
	m_num NUMBER(10), 
	reply_num NUMBER(10),
	board_num NUMBER(10)
)
/*----------------------------------------------
 * 친구 요청
 ---------------------------------------------- */
select * from FRIENDNOTI
SELECT * FROM Notification;
DELETE FROM Notification;

/*============================================= */

CREATE SEQUENCE SEQ_NOTI;

CREATE TABLE Notification (
	noti_num NUMBER(10) NOT NULL,
	m_num NUMBER(10), 
	read number(1) DEFAULT 0,
	noti_date DATE, 
	noti_type NUMBER(1) 
);

----------- 테이블 생성 후 insert 해야함!!!!!!!!!!!!!!!!! -----------
insert into Notification values (0, '', 0, '', '')
--------------------------------------------------

ALTER TABLE Notification
	ADD
		CONSTRAINT PK_Notification
		PRIMARY KEY (
			noti_num
		);

ALTER TABLE Notification
	ADD
		CONSTRAINT FK_member_TO_Notification
		FOREIGN KEY (
			m_num
		)
		REFERENCES member (
			m_num
		);


DROP SEQUENCE SEQ_NOTI;

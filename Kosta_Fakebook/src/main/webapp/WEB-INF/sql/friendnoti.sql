/*----------------------------------------------
 * 친구 요청 알림
 ---------------------------------------------- */

SELECT * FROM FriendNoti;
select * from NOTIFICATION;
DELETE FROM FriendNoti where m_num = 11;

/* ============================================ */

CREATE TABLE FriendNoti (
	noti_num NUMBER(10) NOT NULL, 
	m_num NUMBER(10), 
	f_num NUMBER(10), 
	accept NUMBER(1) 
);
\
ALTER TABLE FriendNoti
	ADD
		CONSTRAINT PK_FriendNoti
		PRIMARY KEY (
			noti_num
		);

ALTER TABLE FriendNoti
	ADD
		CONSTRAINT FK_member_TO_FriendNoti
		FOREIGN KEY (
			m_num
		)
		REFERENCES member (
			m_num
		);

ALTER TABLE FriendNoti
	ADD
		CONSTRAINT FK_member_TO_FriendNoti2
		FOREIGN KEY (
			f_num
		)
		REFERENCES member (
			m_num
		);

ALTER TABLE FriendNoti
	ADD
		CONSTRAINT FK_Notification_TO_FriendNoti
		FOREIGN KEY (
			noti_num
		)
		REFERENCES Notification (
			noti_num
		);

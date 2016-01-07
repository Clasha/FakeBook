/*----------------------------------------------
 * 좋아요 알림
 ---------------------------------------------- */

SELECT * FROM LikeNoti;
DELETE FROM LikeNoti;

/*============================================= */

ALTER TABLE LikeNoti
   DROP
      CONSTRAINT FK_member_TO_LikeNoti
      CASCADE;

ALTER TABLE LikeNoti
   DROP
      CONSTRAINT FK_board_TO_LikeNoti
      CASCADE;

ALTER TABLE LikeNoti
   DROP
      CONSTRAINT FK_Notification_TO_LikeNoti
      CASCADE;

ALTER TABLE LikeNoti
   DROP
      PRIMARY KEY
      CASCADE
      KEEP INDEX;

/* 좋아요알림 */
DROP TABLE LikeNoti 
   CASCADE CONSTRAINTS;

/* 좋아요알림 */
CREATE TABLE LikeNoti (
   noti_num NUMBER(10) NOT NULL, 	/* 새 컬럼 */
   m_num NUMBER(10) NOT NULL, 	/* 회원번호 */
   board_num NUMBER(13) NOT NULL	/* 게시글번호 */
);

SELECT * FROM BOARD 
		WHERE BOARD_NUM=148

ALTER TABLE LikeNoti
   ADD
      CONSTRAINT PK_LikeNoti
      PRIMARY KEY (
         noti_num
      );

ALTER TABLE LikeNoti
   ADD
      CONSTRAINT FK_member_TO_LikeNoti
      FOREIGN KEY (
         m_num
      )
      REFERENCES member (
         m_num
      )
      ON DELETE CASCADE;

ALTER TABLE LikeNoti
   ADD
      CONSTRAINT FK_board_TO_LikeNoti
      FOREIGN KEY (
         board_num
      )
      REFERENCES board (
         board_num
      )
      ON DELETE CASCADE;
select * from LIKENOTI;
ALTER TABLE LikeNoti
   ADD
      CONSTRAINT FK_Notification_TO_LikeNoti
      FOREIGN KEY (
         noti_num
      )
      REFERENCES Notification (
         noti_num
      )
      ON DELETE CASCADE;
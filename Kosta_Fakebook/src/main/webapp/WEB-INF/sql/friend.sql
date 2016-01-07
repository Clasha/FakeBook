/*----------------------------------------------
 * 친구 요청
 * m_num = 요청을 한 회원 번호
 * m_num2 = 요청을 받아드린 회원 번호
 ---------------------------------------------- */
select count(*) from friend where m_num2=6 and m_num1=
    	(select m_num2 from friend where m_num1=6 and m_num2=8
    
    	select * from friend;
    	select * from friendnoti;
    	select * from notification;
   
    	select * from member;

    
    SELECT * FROM friend;
DELETE FROM friend where m_num2 = 9;

/*============================================= */
ALTER TABLE friend
	DROP
		CONSTRAINT FK_member_TO_friend
		CASCADE;

ALTER TABLE friend
	DROP
		CONSTRAINT FK_member_TO_friend2
		CASCADE;

DROP TABLE friend 
	CASCADE CONSTRAINTS;


CREATE TABLE friend (
	m_num1 NUMBER(10), 
	m_num2 NUMBER(10) 
);


ALTER TABLE friend
	ADD
		CONSTRAINT FK_member_TO_friend
		FOREIGN KEY (
			m_num1
		)
		REFERENCES member (
			m_num
		);

ALTER TABLE friend
	ADD
		CONSTRAINT FK_member_TO_friend2
		FOREIGN KEY (
			m_num2
		)
		REFERENCES member (
			m_num
		);
		
ALTER TABLE friend
   ADD
      CONSTRAINT PK_friend
      PRIMARY KEY (
         m_num1,
         m_num2
      );
      
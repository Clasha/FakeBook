/*----------------------------------------------
 * ȸ��
 ---------------------------------------------- */
insert into friend values(198,161);
delete  from friend where m_num1=198 and m_num2=161 ;
select m_num from member where name='Scarlett'
select m_num from member where name='�̿빮'
update member set name='Scarlett' where m_num=198 
SELECT * FROM member where email=;
DELETE FROM member;
insert into member (m_num, email, password, type, name, birthday)
values (0, 'admin', '123', 2, '������', sysdate);
create sequence notice_seq start with 1 increment by 1; 
/*============================================= */
select * from member;

CREATE SEQUENCE seq_member;
DROP SEQUENCE seq_member;
alter table member modify(email varchar2(100) unique);

CREATE TABLE member (
   m_num NUMBER(10) NOT NULL, 		/* ȸ����ȣ */
   email VARCHAR2(100) NOT NULL, 		/* �̸��� */
   password VARCHAR2(100) NOT NULL, 	/* ��й�ȣ */
   type NUMBER(1) DEFAULT 1, 			/* ȸ������ */
   
   name VARCHAR2(100) NOT NULL, 		/* ���� */
   birthday DATE NOT NULL, 				/* ������� */
   born VARCHAR2(200), 						/* ����� */
   picture VARCHAR2(200) , 					/* �����ʻ��� */

   school VARCHAR2(100), 					/* ����б� */
   school_into date,							/* ����б� ������ */
   school_out date,								/* ����б� ������ */
   school_desc VARCHAR2(400),				/* ����б� ���� */
   

   highschool VARCHAR2(100),				/* ���б� */
   highschool_into date,						/* ���б� ������ */
   highschool_out date,						/* ���б� ������ */
   highschool_desc VARCHAR2(400),		/* �б� ���� */
   highschoolmajor VARCHAR2(100),		/* ���� */
   
   job VARCHAR2(50), 						/* ���� */
   job_addr VARCHAR2(200),					/* ���� �ּ� */
   job_position VARCHAR2(200),				/* ���� ���� */
   job_desc VARCHAR2(200),					/* ���� ���� */
   
   yellow_card NUMBER(1) 					/* ���� */
);

alter table member modify born varchar(500);

SELECT * FROM BOARD 
		WHERE BOARD_NUM IN (SELECT board_num FROM HASH WHERE HASH_CODE LIKE '_'||'�ڱ�')
		ORDER BY REG_DATE DESC

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			m_num
		);

		
ALTER TABLE member
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;
		
/* ȸ�� */
DROP TABLE member 
	CASCADE CONSTRAINTS;

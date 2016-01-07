/*----------------------------------------------
 * 회원
 ---------------------------------------------- */
insert into friend values(198,161);
delete  from friend where m_num1=198 and m_num2=161 ;
select m_num from member where name='Scarlett'
select m_num from member where name='이용문'
update member set name='Scarlett' where m_num=198 
SELECT * FROM member where email=;
DELETE FROM member;
insert into member (m_num, email, password, type, name, birthday)
values (0, 'admin', '123', 2, '관리자', sysdate);
create sequence notice_seq start with 1 increment by 1; 
/*============================================= */
select * from member;

CREATE SEQUENCE seq_member;
DROP SEQUENCE seq_member;
alter table member modify(email varchar2(100) unique);

CREATE TABLE member (
   m_num NUMBER(10) NOT NULL, 		/* 회원번호 */
   email VARCHAR2(100) NOT NULL, 		/* 이메일 */
   password VARCHAR2(100) NOT NULL, 	/* 비밀번호 */
   type NUMBER(1) DEFAULT 1, 			/* 회원유형 */
   
   name VARCHAR2(100) NOT NULL, 		/* 성명 */
   birthday DATE NOT NULL, 				/* 생년월일 */
   born VARCHAR2(200), 						/* 출신지 */
   picture VARCHAR2(200) , 					/* 프로필사진 */

   school VARCHAR2(100), 					/* 출신학교 */
   school_into date,							/* 출신학교 입학일 */
   school_out date,								/* 출신학교 졸업일 */
   school_desc VARCHAR2(400),				/* 출신학교 설명 */
   

   highschool VARCHAR2(100),				/* 대학교 */
   highschool_into date,						/* 대학교 입학일 */
   highschool_out date,						/* 대학교 졸업일 */
   highschool_desc VARCHAR2(400),		/* 학교 설명 */
   highschoolmajor VARCHAR2(100),		/* 전공 */
   
   job VARCHAR2(50), 						/* 직장 */
   job_addr VARCHAR2(200),					/* 직장 주소 */
   job_position VARCHAR2(200),				/* 직장 직위 */
   job_desc VARCHAR2(200),					/* 직장 설명 */
   
   yellow_card NUMBER(1) 					/* 경고수 */
);

alter table member modify born varchar(500);

SELECT * FROM BOARD 
		WHERE BOARD_NUM IN (SELECT board_num FROM HASH WHERE HASH_CODE LIKE '_'||'코기')
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
		
/* 회원 */
DROP TABLE member 
	CASCADE CONSTRAINTS;

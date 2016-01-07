/*----------------------------------------------
 * 알수도 있는 친구
 ---------------------------------------------- */

SELECT * FROM maybe_friend;
DELETE FROM maybe_friend;


/*============================================= */

 CREATE TABLE maybe_friend(
	myId NUMBER(10),
	maybe_friendId NUMBER(10),
	together_friendID varchar2(500),
	
	score number,
	reson varchar2(400)
)

insert into Notification values (0, '', 0, '', '')

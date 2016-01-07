package edu.kosta.com.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosta.com.dao.FriendDAO;
import edu.kosta.com.dao.MaybeFriendDAO;
import edu.kosta.com.dao.MemberDAO;
import edu.kosta.com.dto.MaybeFriend;
import edu.kosta.com.dto.Member;
import edu.kosta.com.dto.My_MaybeFriend;

@Service
public class MaybeFriendService {
	@Autowired
	private SqlSession sqlSession;

	public void getMaybeFriendList(Member member2) {
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		//알만한 친구들을 찾아보자.
		////////////////내정보 가져오기/////////////////////
		String my_born_gu=null; //내가 살고 있는 구 찾기
		String my_job=null;
		String my_job_position = null;
		if(member2.getJob() != null){
			my_job=member2.getJob(); //내가 다니는 직장
			my_job_position = member2.getJob_position(); //직장에서의 직책
		}
		String my_school = member2.getSchool();  //내가다닌 고등학교
		int my_school_out =0;
		if(member2.getSchool_out()!=null){
			my_school_out =member2.getSchool_out().getYear();  //고등학교 졸업년도
		}
		String my_highschool = member2.getHighschool();  //내가다닌 대학교
		int my_highschool_out=0;
		if(member2.getHighschool_out()!=null){
			my_highschool_out = member2.getHighschool_out().getYear(); //대학교 졸업년도
		}
		String my_highschoolmajor = member2.getHighschoolmajor(); //대학교 전공
		String[] my_regi=null;
		if(member2.getBorn()!=null){
			my_regi= member2.getBorn().split(" ");
			for(int j=0;j<my_regi.length;j++){  //내가 사는 구 찾기
				System.out.println("거주지 "+j+"번지 : "+my_regi[j]);
				if(my_regi[j].contains("구")){
					my_born_gu = my_regi[j];
				}
				System.out.println("구가 포함되어있는 문자열 : "+my_born_gu);
			}
		}
		////////////////내정보 가져오기 END/////////////////////
		
		////////////////내친구의 친구 목록 가져오기/////////////////////
		FriendDAO friendDao = sqlSession.getMapper(FriendDAO.class);
		MaybeFriendDAO maybeFriendDAO = sqlSession.getMapper(MaybeFriendDAO.class);
		HashMap<String, Object> id = new HashMap<String, Object>();
		id.put("myid", member2.getM_num());
		
		ArrayList<Integer> friendList=friendDao.getMyFriendList(id);
		
		ArrayList<Integer> array=new ArrayList<Integer>();
		ArrayList<Integer> newArray = new ArrayList<Integer>();
		
		for(int i=0;i<friendList.size();i++){
			System.out.println(friendList.get(i));
			ArrayList<Integer> my_maybe_list = maybeFriendDAO.getMaybe_list(id);
			
				id.put("friendid", friendList.get(i));
				array = friendDao.getFriend_FriendList(id);
				
			for(int j=0;j<array.size();j++){
				id.put("maybe_friendId", array.get(j));//내친구의 친구
				MaybeFriend flag=maybeFriendDAO.check(id);
				
				int x = friendDao.friendCehck(id);// 친구검색 count가 1이상이라면 친구이므로 등록하지않는다
				if(x==0){
					if(flag==null){
						System.out.println("!!!!!함께아는 친구가 있습니다. 그친구는  :"+friendList.get(i));
						id.put("score", 3);
						id.put("reson", "친구의친구-");
						maybeFriendDAO.insertMaybeFriend(id);
					}else{
						String[] confirmSame=null;//Together_friendId를 "-"로 나눠서 넣자
						boolean checkConfirmSame=false;
						
						if(flag.getTogether_friendId()!=null){ //함께아는 친구가 등록되어있지않다면 실행
							if(flag.getTogether_friendId().contains("-")){//"-"포함시 실행
								confirmSame=flag.getTogether_friendId().split("-");
							}else{//"-" 미 포함시 실행
								if(flag.getTogether_friendId().equals(Integer.toString(friendList.get(i)))){
									checkConfirmSame=true;
								}
							}
						}
						if(confirmSame!=null){
							for(int k=0;k<confirmSame.length;k++){
								if(confirmSame[k].equals(Integer.toString(friendList.get(i))) ){
									checkConfirmSame=true;
								}
							}
						}
						if(!checkConfirmSame){
							System.out.println("!!!!!함께아는 친구가 있습니다. 그친구는2  :"+friendList.get(i));
							id.put("reson", "친구의친구-");
							id.put("plusFriend", Integer.toString(friendList.get(i)));
							maybeFriendDAO.updateTogetherFriend(id);
						}
					}//알수도있는 사람이 아니라면 들어오는 if end
				}//친구가 아니라면 들어오는 if
			}//j for end
		}//i for end
		
		//1.일단 모든 사람의 정보를 가져와보자.(자신을 제외한!!!)
		ArrayList<Member> memberList = dao.getAllMember(member2.getEmail());
		ArrayList<Integer> deleteMemberNum = new ArrayList<Integer>();
		for(int i=0;i<friendList.size();i++){
			for(int j=0;j<memberList.size();j++){
				if(friendList.get(i)==memberList.get(j).getM_num()){
					memberList.remove(j);
				}
			}
		}//이미 등록되어있는 친구들 삭제 !
		
		for(int i=0;i<memberList.size();i++){
			//각각의 멤버를 Member Class에 일단 담자
			Member member = memberList.get(i);  
			int myid=member2.getM_num();   //maybe_friend table에 저장될 내 아이디
			int maybe_friendId ;          //알만한 친구 아이디
			int score=0;                  //점수
			String reson = "";          //아는 이유
			
			//2.나와 거주지가 같은곳인가??
			String[] resiArray=null;
			String born_gu = null;
			if(member.getBorn()!=null){//친구 사는곳 미입력시 실행 안함
				resiArray = member.getBorn().split(" ");
				for(int j=0;j<resiArray.length;j++){  //친구의 사는 구 찾기
					if(resiArray[j].contains("구")){
						born_gu = resiArray[j];
					}
				}//j for end
			}
			
			if(born_gu!=null){//친구 사는곳 입력시 실행
				if(born_gu.equals(my_born_gu)){
					score+=1; //나와 같은 구에 산다면 점수 +1
					reson+="같은 구에 사시네요-";
				}//if end
			}
			
			//3.나와 직업이 같은가?
			if(member.getJob()!=null){//친구 직업 입력시 실행
				if(member.getJob().equals(my_job)){
					score+=1; //같은 직업이라면 점수 +1
					reson+="같은 직장이네요-";
					if(member.getJob_position().equals(my_job_position)){
						score+=2;  //같은 직업 같은 직책이라면 +3
						reson+="같은 직책이네요-";
					}
				}
			}
			
			//4.나와 고등학교가 같은가?
			if(member.getSchool()!=null){//친구 학교 입력시 실행
				if(member.getSchool().equals(my_school)){
					score+=1; //같은 학교라면 점수+1
					reson+="같은 고등학교네요-";
					if(member.getSchool_out().getYear()==my_school_out){
						score+=2;  //같은학교의 같은학년이라면 점수 +2;
						reson+="같은 학년이네요-";
					}
				}
			}
			
			//5.나와 대학이 같은가?
			if(member.getHighschool()!=null){//친구 대학교 입력시 실행
				if(member.getHighschool().equals(my_highschool)&&member.getHighschoolmajor().equals(my_highschoolmajor)){
					score+=1;//같은 대학의 같은 전공이라면 점수 +1
					reson+="같은 대학이네요-";
					if(member.getHighschool_out().getYear()==my_highschool_out){
						score+=2;//같은 전공에 같은 학년이라면 점수 +2
						reson+="같은 대학에 같은 학년이네요-";
					}
				}
			}
			
			//현재 for문에서의 member가 이미 내친구의 친구로써 등록되어있는 멤버인가??
			//그렇다면 score와 reson을 plus해서 UPDATE 하도록 하자.
			//아니라면 새로 등록하면된다.
			HashMap<String, Object> hashmap = new HashMap<String, Object>();
			if(score>0){
				hashmap.put("myid", member2.getM_num());
				hashmap.put("maybe_friendId", member.getM_num());
				hashmap.put("score", score);
				hashmap.put("reson", reson);
				hashmap.put("together_friendId", null);
				MaybeFriend maybeFriend = maybeFriendDAO.getAllList(hashmap);
				
				if(maybeFriend!=null){//이미 등록되어있던 친구네요 update해줘야합니다.
					//이미등록되어있던 친구라면? 그런데 이미 같은 이유로 등록되어있다면 이유를 검색해보자
					//이유가 이미 등록되어있다면 score와 reson이 증가 되면 안되겠다 
					if(score>0){
						String[] maybeFriendreson = maybeFriend.getReson().split("-");
						
						String[] scoreReson = reson.split("-");
						String sameReson="";
						for(int j=0;j<maybeFriendreson.length;j++){
							System.out.println("maybeFriendreson : "+maybeFriendreson[j]);
							for(int k=0;k<scoreReson.length;k++){
								System.out.println("scoreReson : "+scoreReson[k]);
								if(maybeFriendreson[j].equals(scoreReson[k])){
									sameReson+=maybeFriendreson[j]+"-";
									
									if(scoreReson[k].equals("같은 구에 사시네요")){
										score -=1;
									}
									if(scoreReson[k].equals("같은 직장이네요")){
										score -=1;
									}
									if(scoreReson[k].equals("같은 직책이네요")){
										score -=2;
									} 
									if(scoreReson[k].equals("같은 고등학교네요")){
										score -=1;
									} 
									if(scoreReson[k].equals("같은 학년이네요")){
										score -=2;
									} 
									if(scoreReson[k].equals("같은 대학이네요")){
										score -=1;
									}
									if(scoreReson[k].equals("같은 대학에 같은 학년이네요")){
										score -=2;
									}
									
									scoreReson[k]="";
								}//if end
							}//k for end
						}//j for end
						String newReson="";
						for(int j=0;j<scoreReson.length;j++){
							if(scoreReson[j]!=""){
								newReson += scoreReson[j]+"-" ;
							}
						}
						hashmap.remove("score"); 	hashmap.remove("reson");
						hashmap.put("score", score);
						hashmap.put("reson", newReson);
					}
					maybeFriendDAO.updateMaybeFriend(hashmap);
				}else{//새로운 알수도 있는 친구네요 insert 해줘야 합니다.
					maybeFriendDAO.insertMaybeFriend(hashmap);
				}
			}
			System.out.println("총 점수 : "+score);
		}//모든 멤버리스트  for end
	}//알수도있는 친구찾기 끝 

	public ArrayList<My_MaybeFriend> getMaybeList_ScoreSort(Member member2) {
		
		HashMap<String, Object> myInfo = new HashMap<String, Object>();
		myInfo.put("myid", member2.getM_num());
		
		MaybeFriendDAO dao = sqlSession.getMapper(MaybeFriendDAO.class);
		ArrayList<MaybeFriend> scoreSortedMaybeFriendList=dao.getScoreSortMaybeList(myInfo);
		
		ArrayList<My_MaybeFriend> my_MaybeFriendList=new ArrayList<My_MaybeFriend>();
		
		MemberDAO memberDao = sqlSession.getMapper(MemberDAO.class);
		for(int i=0;i<scoreSortedMaybeFriendList.size();i++){
			HashMap<String,Integer > hashmap = new HashMap<String, Integer>();
			hashmap.put("friendId", scoreSortedMaybeFriendList.get(i).getMaybe_friendId());
			Member member = memberDao.getMaybe_FriendInfo(hashmap);
			
			MaybeFriend maybeFriend = scoreSortedMaybeFriendList.get(i);
			
			
			
			My_MaybeFriend friend = new My_MaybeFriend();
			
			if(member.getSchool()!=null){
				friend.setSchool(member.getSchool());
				friend.setSchool_into(member.getSchool_into());
				friend.setSchool_out(member.getSchool_out());
				friend.setSchool_desc(member.getSchool_desc());
			}
				
			
			if(member.getHighschool()!=null){
				friend.setHighschool(member.getHighschool());
				friend.setHighschool_into(member.getHighschool_into());
				friend.setHighschool_out(member.getHighschool_out());
				friend.setHighschool_desc(member.getHighschool_desc());
				friend.setHighschoolmajor(member.getHighschoolmajor());
			}
			
			friend.setM_num(member.getM_num());
			friend.setEmail(member.getEmail());
			friend.setPassword(member.getPassword());
			friend.setName(member.getName());
			friend.setBirthday(member.getBirthday());
			
			friend.setType(member.getType());
			friend.setYellow_card(member.getYellow_card());
			if(member.getPicture()!=null){
				friend.setPicture(member.getPicture());
			}
			
			if(member.getBorn()!=null){
				String[] borns = member.getBorn().split(" ");
				String born="";
				for(int j=0;j<borns.length;j++){
					if(j<=2){
						born+=borns[j];
					}
				}
				friend.setBorn(born);
			}
			
			if(member.getJob()!=null){
				friend.setJob(member.getJob());
				friend.setJob_addr(member.getJob_addr());
				friend.setJob_position(member.getJob_position());
				friend.setJob_desc(member.getJob_desc());
			}
			
			
			friend.setScore(maybeFriend.getScore());
			if(maybeFriend.getReson()!=null){
				String[] resons = maybeFriend.getReson().split("-");
				friend.setResons(resons);
			}
			
			if(maybeFriend.getTogether_friendId() != null){
				String[] together_friends = maybeFriend.getTogether_friendId().split("-");
				String[] together_friendsName =new String[together_friends.length];
				System.out.println("�̰ź��������� :::"+Arrays.toString(together_friends));
				for(int j=0;j<together_friends.length;j++){
					System.out.println("leng : "+together_friends.length);
					if(!together_friends[j].equals("")){
						together_friendsName[j] = memberDao.getTogether_firendName(Integer.parseInt(together_friends[j]));
					}
				}
				friend.setTogether_friendIds(together_friends);
				friend.setTogether_friendNames(together_friendsName);
			}
			
			my_MaybeFriendList.add(friend);
		}
		
		for(int i=0;i<my_MaybeFriendList.size();i++){
			System.out.println(my_MaybeFriendList.get(i).toString());
		}
		
		return my_MaybeFriendList;
	}

	public void dropMaybeFriends(Member member2) {
		
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("myid", member2.getM_num());
		MaybeFriendDAO dao = sqlSession.getMapper(MaybeFriendDAO.class);
		dao.dropMaybeFriends(hashmap);
		
	}
}

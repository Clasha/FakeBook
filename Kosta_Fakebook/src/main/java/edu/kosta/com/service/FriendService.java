package edu.kosta.com.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosta.com.dao.FriendDAO;
import edu.kosta.com.dao.MemberDAO;
import edu.kosta.com.dao.NotiDAO;
import edu.kosta.com.dto.Member;
import edu.kosta.com.dto.My_FriendListCommand;
import edu.kosta.com.dto.My_Profile_FriendListCommand;

@Service
public class FriendService {
	
	@Autowired
	private SqlSession sqlSession;

	public ArrayList<Member> getRequestFriendList(Member member) {
		FriendDAO friendDAO = sqlSession.getMapper(FriendDAO.class);
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("myid", member.getM_num());
		
		ArrayList<Integer> requestFriends = friendDAO.getRequestFriendList(hashmap);
		
		ArrayList<Member> requestFriendsInfo =new ArrayList<Member>();
		for(int i=0;i<requestFriends.size();i++){
			hashmap.put("m_num", requestFriends.get(i));
			Member memberInfo = memberDAO.getMemberInfo(hashmap);
			
			//�ּ� �Ϻκи� �����ֱ�!!
			if(memberInfo.getBorn()!= null){
				String born = memberInfo.getBorn();
				String[] str = born.split(" ");
				born = "";
				for(int j=0;j<2;j++){
					born +=str[j];
				}
				memberInfo.setBorn(born);
			}
			requestFriendsInfo.add(memberInfo);
		}
		
		return requestFriendsInfo;
	}
	
	public ArrayList<Member> getRequestedFriendList(Member member){
		FriendDAO friendDAO = sqlSession.getMapper(FriendDAO.class);
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("myid", member.getM_num());
		
		ArrayList<Integer> requestedFriends = friendDAO.getRequestedFriendList(hashmap);
		
		ArrayList<Member> requestedFriendsInfo =new ArrayList<Member>();
		for(int i=0;i<requestedFriends.size();i++){
			hashmap.put("m_num", requestedFriends.get(i));
			Member memberInfo = memberDAO.getMemberInfo(hashmap);
			
			//�ּ� �Ϻκи� �����ֱ�!!
			if(memberInfo.getBorn()!= null){
				String born = memberInfo.getBorn();
				String[] str = born.split(" ");
				born = "";
				for(int j=0;j<2;j++){
					born +=str[j];
				}
				memberInfo.setBorn(born);
			}

			
			requestedFriendsInfo.add(memberInfo);
		}
		
		return requestedFriendsInfo;
	}

	public void deleteFrinedRequested(int my_m_num, int m_num) {
		FriendDAO friendDAO = sqlSession.getMapper(FriendDAO.class);
		HashMap<String, Object> hashmap =new HashMap<String, Object>();
		hashmap.put("m_num1", my_m_num);
		hashmap.put("m_num2", m_num);
		
		friendDAO.deleteFrinedRequested(hashmap);
	}


	public void deleteFrinedRequest(HashMap<String, Object> hashmap) {
		FriendDAO friendDAO = sqlSession.getMapper(FriendDAO.class);
		friendDAO.deleteFrinedRequest(hashmap);
		
		
	}
	
		public ArrayList<My_FriendListCommand> getFriendList(Member member2) {
			HashMap<String, Object> hashmap = new HashMap<String, Object>();
			hashmap.put("m_num1", member2.getM_num());
			FriendDAO friendDAO = sqlSession.getMapper(FriendDAO.class);
			ArrayList<Integer> friendIds = friendDAO.getFriendIds(hashmap);

			ArrayList<My_FriendListCommand> my_FriendList = new ArrayList<My_FriendListCommand>();
			
			
			for(int i=0;i<friendIds.size();i++){
				hashmap.put("m_num", friendIds.get(i));
				MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
				Member member = memberDAO.getMemberInfo(hashmap);
				
				My_FriendListCommand friendList = new My_FriendListCommand();
				friendList.setM_num(member.getM_num());
				friendList.setName(member.getName());
				if(member.getPicture()!=null){
						friendList.setPicture(member.getPicture());
				}
				
				hashmap.put("m_num1", friendIds.get(i));
				hashmap.put("loginId", member2.getM_num());
				
				
				ArrayList<Integer> arr = friendDAO.getTogetherFriendIds(hashmap);
				int[] friend_friendIds=new int[arr.size()];
				String[] friend_friendNames=new String[arr.size()];
				for(int j=0;j<arr.size();j++){
							friend_friendIds[j]=arr.get(j);
							hashmap.put("m_num", arr.get(j));
							
							Member friend_friendInfo = memberDAO.getMemberInfo(hashmap);
							friend_friendNames[j]=friend_friendInfo.getName();
				}
				friendList.setTogetherFriendIds(friend_friendIds); 
				friendList.setTogetherFriendNames(friend_friendNames);
				
				hashmap.put("m_num", friendIds.get(i));
				NotiDAO notiDAO = sqlSession.getMapper(NotiDAO.class);
				
				
				ArrayList<Integer> notiFriendIds = notiDAO.getRecentlyNoti(hashmap);
				ArrayList<Integer> notiFriendIds2 = notiDAO.getRecentlyNoti2(hashmap);
				
				
				for(int j=0;j<notiFriendIds2.size();j++){  //array 2�� ��ġ��
					notiFriendIds.add(notiFriendIds2.get(j));
				}
				ArrayList<Integer> uniqueNotiFriendIds = new ArrayList<Integer>(new HashSet<Integer>(notiFriendIds));
				
				int [] recentlyNotiId = new int[uniqueNotiFriendIds.size()];
				String[] recentlyNotiNames=new String[uniqueNotiFriendIds.size()];
				
				for(int j=0;j<uniqueNotiFriendIds.size();j++){
					recentlyNotiId[j] = uniqueNotiFriendIds.get(j);
					
					hashmap.put("m_num", recentlyNotiId[j]);//�ֱپ˸����� ��� ���̵�
					Member friend_NotiInfo = memberDAO.getMemberInfo(hashmap);//�˸� ģ�� ������������
					recentlyNotiNames[j]=friend_NotiInfo.getName();//�˸�ģ�� �̸��ֱ� 
				}
				
				friendList.setRecentlyNotiIds(recentlyNotiId);//�˸� ���̵�� ����
				friendList.setRecentlyNotiNames(recentlyNotiNames); //�˸� �̸��� ����
				System.out.println(friendList.toString());
				my_FriendList.add(friendList);
			}//i for end
			
			return my_FriendList;
		}
	
		
		public ArrayList<My_Profile_FriendListCommand> getMyProfileFriendList(Member member) {
			HashMap<String, Object> hashmap = new HashMap<String, Object>();
			hashmap.put("m_num1", member.getM_num());
			FriendDAO friendDAO = sqlSession.getMapper(FriendDAO.class);
			
			ArrayList<Integer> friendIds = friendDAO.getFriendIds(hashmap);
			
			
			ArrayList<My_Profile_FriendListCommand> my_FriendList = new ArrayList<My_Profile_FriendListCommand>();
			
			
			for(int i=0;i<friendIds.size();i++){
				hashmap.put("m_num", friendIds.get(i));
				MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
				Member member2 = memberDAO.getMemberInfo(hashmap);
				
				My_Profile_FriendListCommand friendList = new My_Profile_FriendListCommand();
				friendList.setM_num(member2.getM_num());
				friendList.setName(member2.getName());
				if(member2.getPicture()!=null){
						friendList.setPicture(member2.getPicture());
				}
				
				hashmap.put("m_num1", friendIds.get(i));
				hashmap.put("loginId", member.getM_num());
				
				
				ArrayList<Integer> arr = friendDAO.getTogetherFriendIds(hashmap);
				//////////////////////////////////////////////////////////////////
				int friendCount = friendDAO.getFriendCount(hashmap);
				friendList.setFriendCount(friendCount);
				/////////////////
				
				int[] friend_friendIds=new int[arr.size()];
				String[] friend_friendNames=new String[arr.size()];
				for(int j=0;j<arr.size();j++){
							friend_friendIds[j]=arr.get(j);
							hashmap.put("m_num", arr.get(j));
							
							Member friend_friendInfo = memberDAO.getMemberInfo(hashmap);
							friend_friendNames[j]=friend_friendInfo.getName();
				}
				friendList.setTogetherFriendIds(friend_friendIds); 
				friendList.setTogetherFriendNames(friend_friendNames);
				
				hashmap.put("m_num", friendIds.get(i));
				NotiDAO notiDAO = sqlSession.getMapper(NotiDAO.class);
				ArrayList<Integer> notiFriendIds = notiDAO.getRecentlyNoti(hashmap);
				
				int[] recentlyNotiIds=new int[notiFriendIds.size()];
				String[] recentlyNotiNames=new String[notiFriendIds.size()];
				
				for(int j=0;j<notiFriendIds.size();j++){
					recentlyNotiIds[j]=notiFriendIds.get(j);
					hashmap.put("m_num", notiFriendIds.get(j));
					
					Member friend_NotiInfo = memberDAO.getMemberInfo(hashmap);
					recentlyNotiNames[j]=friend_NotiInfo.getName();
				}
				friendList.setRecentlyNotiIds(recentlyNotiIds);
				friendList.setRecentlyNotiNames(recentlyNotiNames); 
				my_FriendList.add(friendList);
			}//i for end
			
			return my_FriendList;
			
		}
		
		public boolean isRealFriend(HttpServletRequest request) {
			String num2=null; 
			int num=0;
			if (request.getParameter("fnum") != null) {
					num = Integer.parseInt( request.getParameter("fnum") );
			 }else if(request.getParameter("num").contains(" ")){
					num2 = request.getParameter("num").trim();
			}else{
				num2=request.getParameter("num");
			}
			
			if(num2!=null){
				num = Integer.parseInt(num2);
			}//if end
			boolean flag =false;
			
			HttpSession session = request.getSession();
			Member loginMember = (Member) session.getAttribute("loginUser");
			if(num==loginMember.getM_num()){
				flag= false;
			}else{
				HashMap<String, Object> hashmap = new HashMap<String, Object>();
				hashmap.put("loginNum", loginMember.getM_num());
				hashmap.put("f_num", num);
				FriendDAO friendDAO = sqlSession.getMapper(FriendDAO.class);
				int check = friendDAO.isRealFriend(hashmap);
				
				if(check==0){
					flag = false; 
				}else{
					flag = true; 
				}//if end
			}//if end
			return flag;
		}
		
		/*public ArrayList<My_Profile_FriendListCommand> getProfileTogetherFriendList(HttpServletRequest request) {
			String num2=null; 
			int num=0;
			if (request.getParameter("fnum") != null) {
					num = Integer.parseInt( request.getParameter("fnum") );
				 }else if(request.getParameter("num").contains(" ")){
						num2 = request.getParameter("num").trim();
					}else{
						num2=request.getParameter("num");
					}
			if(num2!=null){
				num = Integer.parseInt(num2);
			}
			HttpSession session = request.getSession();
			Member loginMember = (Member) session.getAttribute("loginUser");
			
			
			HashMap<String, Object> hashmap = new HashMap<String, Object>();
			hashmap.put("m_num1",num);
			hashmap.put("loginId",loginMember.getM_num());
			FriendDAO friendDAO =sqlSession.getMapper(FriendDAO.class);
			ArrayList<Integer> profile_togetherFriendList=friendDAO.getTogetherFriendIds(hashmap);
			
			ArrayList<My_Profile_FriendListCommand> profileTogethers = new ArrayList<My_Profile_FriendListCommand>();
			
			for(int i=0;i<profile_togetherFriendList.size();i++){
				My_Profile_FriendListCommand friendInfo = new My_Profile_FriendListCommand();
				
				hashmap.put("m_num", profile_togetherFriendList.get(i));
				MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
				Member profile_togetherFriendInfo = memberDAO.getMemberInfo(hashmap);
				
				friendInfo.setM_num(profile_togetherFriendInfo.getM_num()); 
				friendInfo.setName(profile_togetherFriendInfo.getName());
				if(profile_togetherFriendInfo.getPicture()!=null){
					friendInfo.setPicture(profile_togetherFriendInfo.getPicture());
				}
				
				hashmap.put("m_num1",profile_togetherFriendInfo.getM_num());
				hashmap.put("loginId",loginMember.getM_num());
				ArrayList<Integer> togetherFriend_loginUser_TogetherNums=friendDAO.getTogetherFriendIds(hashmap);
				
				int[] togetherFriendIds=new int[togetherFriend_loginUser_TogetherNums.size()];
				String[] togetherFriendNames=new String[togetherFriend_loginUser_TogetherNums.size()];
			
				for(int j=0;j<togetherFriend_loginUser_TogetherNums.size();j++){
					togetherFriendIds[j]=togetherFriend_loginUser_TogetherNums.get(j);
					
					hashmap.put("m_num", togetherFriend_loginUser_TogetherNums.get(j));
					Member memberInfo = memberDAO.getMemberInfo(hashmap);
					togetherFriendNames[j] = memberInfo.getName();
				}
				
				friendInfo.setTogetherFriendIds(togetherFriendIds);
				friendInfo.setTogetherFriendNames(togetherFriendNames);
				hashmap.put("m_num",profile_togetherFriendInfo.getM_num());
				friendInfo.setFriendCount(friendDAO.getFriendCount(hashmap));
				profileTogethers.add(friendInfo);
				System.out.println(friendInfo.toString());
			}
			
			return profileTogethers;
		}*/
		//ģ�� ������ ���� ģ���� ���� �Բ��ƴ� ������� ���� �������� �޼ҵ�
	      public ArrayList<My_Profile_FriendListCommand> getProfileTogetherFriendList(HttpServletRequest request) {
	         String num2=null; 
	         int num=0;
	         if (request.getParameter("fnum") != null) {
	               num = Integer.parseInt( request.getParameter("fnum") );
	             }else if(request.getParameter("num").contains(" ")){
	                  num2 = request.getParameter("num").trim();
	               }else{
	                  num2=request.getParameter("num");
	               }
	         if(num2!=null){
	            num = Integer.parseInt(num2);
	         }
	         HttpSession session = request.getSession();
	         Member loginMember = (Member) session.getAttribute("loginUser");
	         
	         
	         //ģ�� ���̵� m_num1�� ���
	         HashMap<String, Object> hashmap = new HashMap<String, Object>();
	         hashmap.put("m_num1",num);
	         hashmap.put("loginId",loginMember.getM_num());
	         FriendDAO friendDAO =sqlSession.getMapper(FriendDAO.class);
	         //�����ʿ� �� ģ���� �Բ� �ƴ� ģ������ ����� �ҷ��´�.
	         ArrayList<Integer> profile_togetherFriendList=friendDAO.getTogetherFriendIds(hashmap);
	         
	         ArrayList<My_Profile_FriendListCommand> profileTogethers = new ArrayList<My_Profile_FriendListCommand>();
	         
	         for(int i=0;i<profile_togetherFriendList.size();i++){
	            My_Profile_FriendListCommand friendInfo = new My_Profile_FriendListCommand();
	            
	            //�Բ��ƴ� ģ���鿡 ���� ���������� �����´�.
	            hashmap.put("m_num", profile_togetherFriendList.get(i));
	            MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
	            Member profile_togetherFriendInfo = memberDAO.getMemberInfo(hashmap);
	            
	            friendInfo.setM_num(profile_togetherFriendInfo.getM_num()); //�����ʵ� ģ���� �Բ��ƴ� ģ���� ��ȣ
	            friendInfo.setName(profile_togetherFriendInfo.getName()); //�����ʵ� ģ���� �Բ��ƴ� ģ���� �̸�
	            if(profile_togetherFriendInfo.getPicture()!=null){
	               friendInfo.setPicture(profile_togetherFriendInfo.getPicture());
	               //�����ʵ� ģ���� �Բ��ƴ� ģ���� ������ null�̾ƴ϶�� ����
	            }
	            
	            //�����ʵ� ģ���� �Բ��ƴ� ģ���� �α����� ������� �Բ��ƴ� ģ������ �̸��� ���̵� �ֱ�
	            hashmap.put("m_num1",profile_togetherFriendInfo.getM_num());
	            hashmap.put("loginId",loginMember.getM_num());
	            //�α����� ����� ������ �� ģ���� �Բ��ƴ� ģ����� �α��� ������ �԰�ƴ� ģ���� num�ҷ�����
	            ArrayList<Integer> togetherFriend_loginUser_TogetherNums=friendDAO.getTogetherFriendIds(hashmap);
	            
	            int[] togetherFriendIds=new int[togetherFriend_loginUser_TogetherNums.size()];
	            String[] togetherFriendNames=new String[togetherFriend_loginUser_TogetherNums.size()];
	         
	            for(int j=0;j<togetherFriend_loginUser_TogetherNums.size();j++){
	               togetherFriendIds[j]=togetherFriend_loginUser_TogetherNums.get(j);//���̵���� int�迭�� ����
	               
	               hashmap.put("m_num", togetherFriend_loginUser_TogetherNums.get(j));
	               //���̵�� �̸������ͼ� �迭�� �ֱ�
	               Member memberInfo = memberDAO.getMemberInfo(hashmap);
	               togetherFriendNames[j] = memberInfo.getName();
	            }
	            
	            friendInfo.setTogetherFriendIds(togetherFriendIds);
	            friendInfo.setTogetherFriendNames(togetherFriendNames);
	            hashmap.put("m_num",profile_togetherFriendInfo.getM_num());
	            friendInfo.setFriendCount(friendDAO.getFriendCount(hashmap));
	            
	            
	            //�ֱ� ģ������ �Ͼ �˶� �ϳ� �������� 
	            NotiDAO notiDAO = sqlSession.getMapper(NotiDAO.class);
	            
	            //�ֱ� 1�� �ȿ� ���� ģ���� ģ���� �Ȼ������ id�� ������
	            ArrayList<Integer> notiFriendIds = notiDAO.getRecentlyNoti(hashmap);
	            ArrayList<Integer> notiFriendIds2 = notiDAO.getRecentlyNoti2(hashmap);
	            
	            
	            for(int j=0;j<notiFriendIds2.size();j++){  //array 2�� ��ġ��
	               notiFriendIds.add(notiFriendIds2.get(j));
	            }
	            //�ߺ��� ���̵� ����
	            ArrayList<Integer> uniqueNotiFriendIds = new ArrayList<Integer>(new HashSet<Integer>(notiFriendIds));
	            
	            int [] recentlyNotiId = new int[uniqueNotiFriendIds.size()];
	            String[] recentlyNotiNames=new String[uniqueNotiFriendIds.size()];
	            
	            
	            for(int j=0;j<uniqueNotiFriendIds.size();j++){
	               recentlyNotiId[j] = uniqueNotiFriendIds.get(j);
	               
	               hashmap.put("m_num", recentlyNotiId[j]);//�ֱپ˸����� ��� ���̵�
	               Member friend_NotiInfo = memberDAO.getMemberInfo(hashmap);//�˸� ģ�� ������������
	               recentlyNotiNames[j]=friend_NotiInfo.getName();//�˸�ģ�� �̸��ֱ� 
	            }
	            
	            friendInfo.setRecentlyNotiIds(recentlyNotiId);//�˸� ���̵�� ����
	            friendInfo.setRecentlyNotiNames(recentlyNotiNames);//�˸� �̸��� ����
	            
	            
	            
	            profileTogethers.add(friendInfo);
	            System.out.println(friendInfo.toString());
	         }
	         
	         return profileTogethers;
	      }
		
		public ArrayList<Member> getTogether_removeFriend(ArrayList<My_Profile_FriendListCommand> friend_profile_togetherList,
				int num , int loginNum) {
			ArrayList<Integer> removeList = new ArrayList<Integer>();
			for(int i=0;i<friend_profile_togetherList.size();i++){
				My_Profile_FriendListCommand friends = friend_profile_togetherList.get(i);
				removeList.add(friends.getM_num());
				System.out.println("지울사람 번호는 지울사람 번호는 지울사람 번호는 :"+friends.getM_num());
			}
			HashMap<String, Object> hashmap = new HashMap<String, Object>();
			hashmap.put("m_num1", num);
			FriendDAO friendDAO = sqlSession.getMapper(FriendDAO.class);
			
			ArrayList<Integer> allFriends=friendDAO.getFriendIds(hashmap);
			
			if(removeList.size()!=0){
				for(int i=0;i<removeList.size();i++){
					for(int j=0;j<allFriends.size();j++){
						int removeInt  = removeList.get(i);
						int friendInt  = allFriends.get(j);
						if(removeInt == friendInt ){
							allFriends.remove(j);
						}
					}
				}
			}
			System.out.println(allFriends.size());
			ArrayList<Integer> arr = new ArrayList<Integer>(new HashSet<Integer>(allFriends));
			
			
			ArrayList<Member> noKnowFriends = new ArrayList<Member>(); 
			MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
			for(int i=0;i<arr.size();i++){
				System.out.println("친구 친구 친구 친구 친구 친구 : "+arr.get(i));
				if(arr.get(i) != loginNum){
					hashmap.put("m_num", arr.get(i));
					hashmap.put("loginNum", loginNum);
					Member member= memberDAO.getMemberInfo(hashmap);
					noKnowFriends.add(member);
					System.out.println("dd"+member.toString());
				}
			}
			
			return noKnowFriends;
		}
		
		//���� ģ����û�� �ɰ��ִ� ģ������ Ȯ���ϴ� �޼ҵ�
	      public int isfriendRequestCehck(HttpServletRequest request){
	         String num2=null; 
	         int num=0;
	         if (request.getParameter("fnum") != null) {
	               num = Integer.parseInt( request.getParameter("fnum") );
	             }else if(request.getParameter("num").contains(" ")){
	                  num2 = request.getParameter("num").trim();
	               }else{
	                  num2=request.getParameter("num");
	               }
	         if(num2!=null){
	            num = Integer.parseInt(num2);
	         }//if end
	         
	         
	         HttpSession session = request.getSession();
	         Member loginMember = (Member) session.getAttribute("loginUser");
	         HashMap<String, Object> hashmap = new HashMap<String, Object>();
	         hashmap.put("m_num1", loginMember.getM_num());
	         hashmap.put("m_num2", num);
	         FriendDAO friendDAO = sqlSession.getMapper(FriendDAO.class);
	         int count=friendDAO.isfriendRequestCehck(hashmap);
	         return count;
	      }
		

	
}

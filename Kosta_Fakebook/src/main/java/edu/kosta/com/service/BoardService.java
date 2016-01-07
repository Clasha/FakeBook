package edu.kosta.com.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import edu.kosta.com.dao.BoardDAO;
import edu.kosta.com.dao.NotiDAO;
import edu.kosta.com.dto.Board;
import edu.kosta.com.dto.Member;
import edu.kosta.com.utils.FileUtils;

@Service("BoardService")
public class BoardService {

	@Autowired
	private SqlSession sqlSession;

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;



	public void insertBoard(Board board, HttpServletRequest request) throws Exception {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("m_num", board.getM_num());
		hashMap.put("open_level", board.getOpen_level());
		hashMap.put("content", board.getContent());
		hashMap.put("place", board.getPlace());
		hashMap.put("picture", board.getPicture());
		hashMap.put("video", board.getVideo());

		MultipartHttpServletRequest mpRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = mpRequest.getFileNames();
		MultipartFile multipartFile = null;
		while (iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			/*if (multipartFile.isEmpty() == false) {
				System.out.println("------------- file start -------------");
				System.out.println("name : " + multipartFile.getName());
				System.out.println("filename : " + multipartFile.getOriginalFilename());
				System.out.println("size : " + multipartFile.getSize());
				System.out.println("-------------- file end --------------\n");
			}*/
		}

		List<Map<String, Object>> fileInfo = fileUtils.parseInsertFileInfo(hashMap, mpRequest);
		for (int i = 0, size = fileInfo.size(); i < size; i++) {
			/*System.out.println("------------- file upload start -------------");
			System.out.println(fileInfo.get(i).get("M_NUM"));
			System.out.println(fileInfo.get(i).get("ORIGINAL_FILE_NAME"));
			System.out.println(fileInfo.get(i).get("STORED_FILE_NAME"));
			System.out.println(fileInfo.get(i).get("FILE_SIZE"));
			System.out.println(fileInfo.get(i).get("FILE_TYPE"));
			System.out.println("-------------- file upload end --------------\n");
*/
			StringTokenizer tokenizer = new StringTokenizer((String) fileInfo.get(i).get("FILE_TYPE"), "/");
			if (tokenizer.hasMoreTokens()) {
				String fileType = tokenizer.nextToken();
				System.out.println("fileType : " + fileType);
				if (fileType.equals("image")) {
					hashMap.put("picture", fileInfo.get(i).get("STORED_FILE_NAME"));
				} else if (fileType.equals("video")) {
					hashMap.put("video", fileInfo.get(i).get("STORED_FILE_NAME"));
				}
			}
		}

		System.out.println(hashMap);
		sqlSession.getMapper(BoardDAO.class).insertBoard(hashMap);

	}

	public List<Board> selectByM_num(Member member, HttpServletRequest request) throws Exception {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("m_num", member.getM_num());
		//System.out.println(member);
		List<Board> boards = sqlSession.getMapper(BoardDAO.class).selectByM_num(hashMap);
	/*	System.out.println("------------- boards start -------------");
		for (Board board : boards) {
			System.out.println(board);
		}
		System.out.println("------------- boards end -------------");*/
		return boards;
	}

	public List<Board> selectPartOfBoard(Member member, int start, int end) {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("m_num", member.getM_num());
		hashMap.put("start", start);
		hashMap.put("end", end);
		List<Board> boards = sqlSession.getMapper(BoardDAO.class).selectPartOfBoard(hashMap);
		return boards;
	}

	
	public List<Board> selectTimeLine(HttpServletRequest request) {
		
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
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("m_num", num);

		List<Board> boards = sqlSession.getMapper(BoardDAO.class).selectTimeLine(hashMap);
		for(int i=0;i<boards.size();i++){
			
		}
		return boards;

	}

	public List<Board> detail(int num, HttpServletRequest request) throws Exception {
		num = Integer.parseInt(request.getParameter("board_num"));
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("board_num", num);
		System.out.println(hashmap);
		List<Board> detail = sqlSession.getMapper(BoardDAO.class).detail(hashmap);
		System.out.println(detail);
		return detail;
	}
	
	public List<Board> detail2(Integer board_num, Integer noti_num, HttpServletRequest request) {
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("board_num", board_num);
		System.out.println(hashmap);
		List<Board> detail = sqlSession.getMapper(BoardDAO.class).detail(hashmap);
		sqlSession.getMapper(NotiDAO.class).readupdate(noti_num);
		System.out.println(detail);
		return detail;
	}

	public ArrayList<Board> selectMyPictureBoardNum(HttpServletRequest request, int reply_start, int reply_end) {
		
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
		
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("m_num", num);

		ArrayList<Board> boards = sqlSession.getMapper(BoardDAO.class).selectMyPictureBoardNum(hashMap);
		return boards;
	}
	
	
	public List<Board> selectBoardByHash(String hashtag, int start, int end) {
		System.out.println("<< BoardService : selectBoardByHash >> hashtag: " + hashtag);
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		
		hashmap.put("hashtag", hashtag);
		hashmap.put("start", start);
		hashmap.put("end", end);
		
		BoardDAO boardDAO = sqlSession.getMapper(BoardDAO.class);
		List<Board> boards = boardDAO.selectBoardByHash(hashmap);
		return boards;
	}
	
	public void deleteBoard(int board_num) {
		BoardDAO boardDAO = (BoardDAO)sqlSession.getMapper(BoardDAO.class);
		boardDAO.deleteBoard(board_num);	
	}

	public void updateBoard(int board_num, String editContent, int openLevel) {
	//	System.out.println( "����");
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("board_num", board_num);
		hashmap.put("editContent", editContent);
		hashmap.put("openLevel", openLevel);
		BoardDAO boardDAO = (BoardDAO)sqlSession.getMapper(BoardDAO.class);
		boardDAO.updateBoard(hashmap);	
	}

	public List<Board> selectBoardOne(int boardNum) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		HashMap<String, Object> hash = new HashMap<String, Object>();
		hash.put("boardNum", boardNum);
		
		return dao.selectBoardOne(hash);
	}
}

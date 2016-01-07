package edu.kosta.com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import edu.kosta.com.dto.Board;

public interface BoardDAO {
	void insertBoard(HashMap<String, Object> hashMap);
	List<Board> selectByM_num(HashMap<String, Object> hashMap);
	List<Board> selectPartOfBoard(HashMap<String, Object> hashMap);
	List<Board> selectTimeLine(HashMap<String, Object> hashMap);
	public List<Board> detail(HashMap<String, Object> hashmap);
	ArrayList<Board> selectMyPictureBoardNum(HashMap<String, Object> hashMap);
	List<Board> selectBoardByHash(HashMap<String, Object> hashmap);
	void deleteBoard(int board_num);
	void updateBoard(HashMap<String, Object> hashmap);
	
	List<Board> selectBoardOne(HashMap<String, Object> hash);
}

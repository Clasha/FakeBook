package edu.kosta.com.dao;

import java.util.HashMap;

public interface BLikeDAO {
	void boardLike(HashMap<String, Object> hashmap);

	void boardLikeCancel(HashMap<String, Object> hashmap);

}

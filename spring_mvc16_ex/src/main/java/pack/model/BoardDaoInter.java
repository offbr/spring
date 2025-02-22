package pack.model;

import java.util.List;
import java.util.Map;

import pack.controller.BoardBean;

public interface BoardDaoInter {
		List<BoardDto> selectDataAll(Map<String, Integer> map);
		BoardDto selectPart(String num);		
		List<BoardDto> selectSearchData(BoardBean bean); // 검색
		int totalList(); //전체레코드 수		
		int numList(); //글 맥스값 
		void readcntCount(String num); //조회수 증가	
		int checkPass(BoardBean bean); //수정 및 삭제시 패스 확인
		boolean insertData(BoardBean bean);
		boolean updateData(BoardBean bean);
		boolean deleteData(String num);
		boolean insertReply(BoardBean bean); //답글
		boolean updateReply(Map<String, Integer> map); //답글 onum갱신
		boolean updateOnum(BoardBean bean); //답글 onum갱신
}

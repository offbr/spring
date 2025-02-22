package com.movie.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.movie.resources.MovieAnnoInter;

@Repository
public class BoardDaoImpl implements BoardDaoInter{
	
	@Autowired
	private MovieAnnoInter inter;
	
	@Override
	public List<BoardDto> selectDataAll(Map<String, Integer> map) {
		return inter.selectDataAll(map);
	}
	
	@Override
	public List<BoardDto> selectSearchData(Map<String, String> map) {
		return inter.selectSearchData(map);
	}
	
	@Override
	public BoardDto selectPart(String b_no) {
		return inter.selectPart(b_no);
	}
	
	@Override
	public int b_noMax() {
		return inter.b_noMax();
	}
	
	@Override
	public int totalCount() {
		return inter.totalCount();
	}
	
	@Override
	public int checkPass(BoardBean bean) {
		return inter.checkPass(bean);
	}
	
	@Override
	public boolean insertData(BoardBean bean) {
		return inter.insertData(bean);
	}
	
	@Override
	public boolean updateData(BoardBean bean) {
		return inter.updateData(bean);
	}
	
	@Override
	public boolean deleteData(String b_no) {
		return inter.deleteData(b_no);
	}
	
}
















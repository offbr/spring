package pack.model;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.controller.MemBean;

@Repository
public class MemDaoImpl extends SqlSessionDaoSupport implements MemDaoInter{
	@Autowired
	public MemDaoImpl(SqlSessionFactory sqlSessionFactory) {
		setSqlSessionFactory(sqlSessionFactory);
	}
	
	//전체자료
	@Override
	public List<MemDto> getDataAll() {
		return getSqlSession().selectList("selectDataAll");
	}
	
	//부분자료
	@Override
	public MemDto selectPart(String num) {
		return getSqlSession().selectOne("selectPart", num);
	}
	
	@Override
	public boolean insertData(MemBean bean) {
		try {
			getSqlSession().insert("insertData", bean);
			return true;
		} catch (Exception e) {
			System.out.println("insertData err : " + e);
		}
		return false;
	}
	
	@Override
	public boolean updateData(MemBean bean) {
		try {
			getSqlSession().update("updateData", bean);
			return true;
		} catch (Exception e) {
			System.out.println("updateData err : " + e);
		}
		return false;
	}
	
	@Override
	public boolean deleteData(String num) {
		int re = getSqlSession().delete("deleteData", num);
		if(re > 0 ) return true;
		else return false;
	}
}










package pack.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoImpl extends SqlSessionDaoSupport implements DaoInter{
	@Autowired	
	public DaoImpl(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}
	
	@Override
	public int login(Map<String, String> map) {
		int count = getSqlSession().selectOne("login", map);
		return count;
	}
	
	@Override
	public List<GogekDto> gogekSearch(Map<String, String> map) {
		return getSqlSession().selectList("gogekSearch", map);
	}
	
	@Override
	public List<BuserDto> buserSearch(Map<String, String> map) {
		return getSqlSession().selectList("buserSearch", map);
	}
	
	@Override
	public List<BuserDto> gogekList(Map<String, String> map) {
		return getSqlSession().selectList("gogekList", map);
	}

}

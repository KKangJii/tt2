package kr.co.bit.test;

import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import junit.framework.Assert;
import kr.co.bit.board.vo.BoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:config/spring/spring-mvc.xml")
public class JUnitTest {
	
	@Autowired
	private DataSource ds;
	
	@Autowired
	private SqlSessionFactory factory;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Ignore
	@Test
	public void DB접속테스트() throws Exception {
		System.out.println(ds.getConnection());
		System.out.println(sqlSession);
	}
	
	@Test
	public void 전체게시글조회테스트() {
		List<BoardVO> list = sqlSession.selectList("kr.co.bit.board.dao.BoardDAO.selectAllBoard");
		
		Assert.assertEquals(2, list.size());
	}
	
	
}





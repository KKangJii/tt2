package kr.co.bit.sign.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.bit.kaka.vo.KakaoVO;
import kr.co.bit.sign.vo.SignVO;
import kr.co.bit.util.ConnectionFactory;

public class SignDAO {
	
	
	
	
	public void UpdateKakao(KakaoVO kakao,KakaoVO userVO) {

		StringBuilder sql = new StringBuilder();
		sql.append("update t_kakao");
		sql.append(" set  id = ?, email_id = ?,email_domain = ?,tel1 = ?,tel2 = ?,tel3 = ?,post = ?,basic_addr = ?,detail_addr = ?");
		sql.append(" where name = ?");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, kakao.getId());
			pstmt.setString(2, kakao.getEmail_id());
			pstmt.setString(3, kakao.getEmail_domain());
			pstmt.setString(4, kakao.getTel1());
			pstmt.setString(5, kakao.getTel2());
			pstmt.setString(6, kakao.getTel3());
			pstmt.setString(7, kakao.getPost());
			pstmt.setString(8, kakao.getBasic_addr());
			pstmt.setString(9, kakao.getDetail_addr());
			pstmt.setString(10, userVO.getName());

			pstmt.executeUpdate();

		} catch (Exception e) {

		}
	}
	
	public KakaoVO MypageKakao(KakaoVO kakao) {
		KakaoVO kakaoVO = null;
		
		StringBuilder sql = new StringBuilder();
		sql.append("select id,tel1,tel2,tel3,email_id,email_domain,post,basic_addr,detail_addr, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
		sql.append(" from t_kakao where name = ? ");
		
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				
				) {
			pstmt.setString(1, kakao.getName());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				kakaoVO = new KakaoVO();
				kakaoVO.setId(rs.getString("id"));
				kakaoVO.setTel1(rs.getString("tel1"));
				kakaoVO.setTel2(rs.getString("tel2"));
				kakaoVO.setTel3(rs.getString("tel3"));
				kakaoVO.setEmail_id(rs.getString("email_id"));
				kakaoVO.setEmail_domain(rs.getString("email_domain"));
				kakaoVO.setPost(rs.getString("post"));
				kakaoVO.setBasic_addr(rs.getString("basic_addr"));
				kakaoVO.setDetail_addr(rs.getString("detail_addr"));
				kakaoVO.setReg_date(rs.getString("reg_date"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return kakaoVO;
		
	}
	public KakaoVO KakaoInfo(String id,String kakao) {
		KakaoVO kakaoVO = null;
		StringBuilder sql = new StringBuilder();
		sql.append("select id,name ");
		sql.append(" from t_kakao ");
		sql.append(" where id = ? and name = ?");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, id);
			pstmt.setString(2, kakao);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				kakaoVO = new KakaoVO();
				kakaoVO.setId(rs.getString("id"));
				kakaoVO.setName(rs.getString("name"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return kakaoVO;

	}
	

	public void kakaoinsert(KakaoVO kakao) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_kakao(id, name, email_id,email_domain,tel1,tel2,tel3,post,basic_addr,detail_addr)");
		sql.append(" values (?,?,?,?,?,?,?,?,?,?)");
		
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			int loc = 1;
			pstmt.setString(loc++, kakao.getId());
			pstmt.setString(loc++, kakao.getName());
			pstmt.setString(loc++, kakao.getEmail_id());
			pstmt.setString(loc++, kakao.getEmail_domain());
			pstmt.setString(loc++, kakao.getTel1());
			pstmt.setString(loc++, kakao.getTel2());
			pstmt.setString(loc++, kakao.getTel3());
			pstmt.setString(loc++, kakao.getPost());
			pstmt.setString(loc++, kakao.getBasic_addr());
			pstmt.setString(loc++, kakao.getDetail_addr());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			
		}
	}
	public void insert(SignVO sign) {

		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_member(id, password, name, email_id,email_domain,tel1,tel2,tel3,post,basic_addr,detail_addr)");
		sql.append("values (?,?,?,?,?,?,?,?,?,?,?)");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, sign.getId());
			pstmt.setString(2, sign.getPassword());
			pstmt.setString(3, sign.getName());
			pstmt.setString(4, sign.getEmail_id());
			pstmt.setString(5, sign.getEmail_domain());
			pstmt.setString(6, sign.getTel1());
			pstmt.setString(7, sign.getTel2());
			pstmt.setString(8, sign.getTel3());
			pstmt.setString(9, sign.getPost());
			pstmt.setString(10, sign.getBasic_addr());
			pstmt.setString(11, sign.getDetail_addr());

			pstmt.executeUpdate();

		} catch (Exception e) {

		}
	}

	public List<SignVO> selectAllSign() {
		List<SignVO> list = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append(
				"select id, name, email_id, email_domain, tel1, tel2, tel3, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
		sql.append(" from t_member ");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				SignVO sign = new SignVO();
				String id = rs.getString("id");
				String name = rs.getString("name");
				String email_id = rs.getString("email_id");
				String email_domain = rs.getString("email_domain");
				String tel1 = rs.getString("tel1");
				String tel2 = rs.getString("tel2");
				String tel3 = rs.getString("tel3");
				String regDate = rs.getString("reg_date");

				sign.setId(id);
				sign.setName(name);
				sign.setEmail_id(email_id);
				sign.setEmail_domain(email_domain);
				sign.setTel1(tel1);
				sign.setTel2(tel2);
				sign.setTel3(tel3);
				sign.setReg_date(regDate);

				list.add(sign);

			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}

	public SignVO LogInfo(SignVO sign) {
		SignVO userVO = null;
		StringBuilder sql = new StringBuilder();
		sql.append("select id,password,type");
		sql.append(" from t_member ");
		sql.append(" where id = ? and password = ?");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, sign.getId());
			pstmt.setString(2, sign.getPassword());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				userVO = new SignVO();
				userVO.setId(rs.getString("id"));
				userVO.setPassword(rs.getString("password"));
				userVO.setType(rs.getString("type"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return userVO;

	}

	public SignVO Mypage(SignVO userVO) {
		SignVO sign = null;

		StringBuilder sql = new StringBuilder();
		sql.append("select id,name,tel1,tel2,tel3,email_id,email_domain,post,basic_addr,detail_addr, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
		sql.append(" from t_member where id = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());

		) {
			pstmt.setString(1, userVO.getId());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				sign = new SignVO();
				sign.setId(rs.getString("id"));
				sign.setName(rs.getString("name"));
				sign.setTel1(rs.getString("tel1"));
				sign.setTel2(rs.getString("tel2"));
				sign.setTel3(rs.getString("tel3"));
				sign.setEmail_id(rs.getString("email_id"));
				sign.setEmail_domain(rs.getString("email_domain"));
				sign.setPost(rs.getString("post"));
				sign.setBasic_addr(rs.getString("basic_addr"));
				sign.setDetail_addr(rs.getString("detail_addr"));
				sign.setReg_date(rs.getString("reg_date"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return sign;

	}
	public void delete(SignVO userVO) {
		StringBuilder sql = new StringBuilder();
		sql.append("DELETE FROM t_member where id = ? and password = ?");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			) {
			pstmt.setString(1,userVO.getId());
			pstmt.setString(2,userVO.getPassword());
			
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		} 
	}
	public void Update(SignVO sign,SignVO userVO) {

		StringBuilder sql = new StringBuilder();
		sql.append("update t_member");
		sql.append(" set  name = ?, email_id = ?,email_domain = ?,tel1 = ?,tel2 = ?,tel3 = ?,post = ?,basic_addr = ?,detail_addr = ?");
		sql.append(" where id = ?");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, sign.getName());
			pstmt.setString(2, sign.getEmail_id());
			pstmt.setString(3, sign.getEmail_domain());
			pstmt.setString(4, sign.getTel1());
			pstmt.setString(5, sign.getTel2());
			pstmt.setString(6, sign.getTel3());
			pstmt.setString(7, sign.getPost());
			pstmt.setString(8, sign.getBasic_addr());
			pstmt.setString(9, sign.getDetail_addr());
			pstmt.setString(10, userVO.getId());

			pstmt.executeUpdate();

		} catch (Exception e) {

		}
	}
	public void Checkdelete(String str) {
		StringBuilder sql = new StringBuilder();
		sql.append("DELETE FROM t_member where id = ?");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			) {
			pstmt.setString(1,str);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		} 
	}
	public boolean IdCheck(String id) {
		boolean result = false;
		StringBuilder sql = new StringBuilder();
		sql.append("select id ");
		sql.append(" from t_member");
		sql.append(" where id = ?");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			) {
			pstmt.setString(1, id);
			
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				result = true;
			}
		
		}catch(Exception e) {
			
		}
		return result;
	}
	
	public boolean IdCheckkakao(String id) {
		boolean result = false;
		StringBuilder sql = new StringBuilder();
		sql.append("select id ");
		sql.append(" from t_kakao");
		sql.append(" where id = ?");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			) {
			pstmt.setString(1, id);
			
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				result = true;
			}
		
		}catch(Exception e) {
			
		}
		return result;
	}

}

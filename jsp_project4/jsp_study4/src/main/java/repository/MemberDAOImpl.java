package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.MemberVO;
import orm.DatabaseBuilder;

public class MemberDAOImpl implements MemberDAO {

	private static Logger log =  LoggerFactory.getLogger(MemberDAOImpl.class);
	private SqlSession sql; 
	private String NS = "memberMapper.";
	
	public MemberDAOImpl() {
		new DatabaseBuilder(); 
		sql = DatabaseBuilder.getFactory().openSession();

	}
	
	
	
	@Override
	public int insert(MemberVO mvo) {
		//사용자 추가
		log.info(">>> insert DAO 진입");
		int isOk = sql.insert(NS+"register",mvo);
		if(isOk >0)sql.commit();
		return isOk;
	}



	@Override
	public MemberVO selectOne(MemberVO mvo2) {
		// 로그인
		log.info(">>> login DAO 진입");
		return sql.selectOne(NS+"login", mvo2);
	}



	@Override
	public int lastLogin(String id2) {
		// 로그아웃 (마지막 로그인 시간)
		log.info(">>> logout DAO 진입");
		int isOk = sql.update(NS+"logout", id2); 
		if(isOk > 0 ) {
			sql.commit();
		}
		return isOk;
	}



	@Override
	public List<MemberVO> list() {
		// 전체 회원출력
		log.info(">>> list DAO 진입");
		List<MemberVO> list = sql.selectList(NS+"list");
		return list;
	}



	@Override
	public int update(MemberVO mvo2) {
		// 회원 정보수정
		log.info(">>> update DAO 진입");
		int isOk = sql.update(NS+"up", mvo2); 
		if(isOk > 0 ) {
			sql.commit();
		}
		return isOk; 
	}



	@Override
	public int delete(String id2) {
		// 회원삭제(회원탈퇴)
		log.info(">>> delete DAO 진입");
		int isOk = sql.delete(NS+"del", id2); 
		if(isOk > 0 ) {
			sql.commit();
		}
		return isOk;
	}

}

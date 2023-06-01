package service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.MemberVO;
import repository.MemberDAO;
import repository.MemberDAOImpl;

public class MemberServiceImpl implements MemberService {

	private static Logger log = LoggerFactory.getLogger(MemberServiceImpl.class);
	private MemberDAO mdao;
	

	public MemberServiceImpl() {
		mdao = new MemberDAOImpl();
	}
	
	
	@Override
	public int register(MemberVO mvo) {
		log.info(">>> register service 진입!");
		return mdao.insert(mvo);
	}


	@Override
	public MemberVO login(MemberVO mvo2) {
		log.info(">>> login service 진입!");
		return mdao.selectOne(mvo2);
	}


	@Override
	public int lastLogin(String id2) {
		log.info(">>> lastLogin service 진입!");
		return mdao.lastLogin(id2);
	}


	@Override
	public List<MemberVO> list() {
		log.info(">>> list service 진입!");
		return mdao.list();
	}


	@Override
	public int edit(MemberVO mvo2) {
		log.info(">>> edit service 진입!");
		return mdao.update(mvo2);
	}


	@Override
	public int delete(String id2) {
		log.info(">>> delete service 진입!");
		return mdao.delete(id2);
	}

}

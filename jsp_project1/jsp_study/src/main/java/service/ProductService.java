package service;

import java.util.List;

import domain.productVO;
import repository.DAO;
import repository.ProductDAO;

public class ProductService implements Service {

	//dao객체가 없으니 여기서 생성!
	private DAO dao;
	
	public ProductService() {
		dao = new ProductDAO();
	}
	
	@Override
	public int register(productVO pvo) {
		// jsp에서 받은 객체 pvo를 가지고 db에 넣어달라고 요청하기 (dao에게)
		//dao에게 연결할 메서드는 db구문으로 하는 것이 일반적
		System.out.println(">>> register service 진입성공 ");
		return  dao.insert(pvo);
	
	}

	@Override
	public List<productVO> list() {
		// TODO Auto-generated method stub
		System.out.println(">>> list service 진입성공 ");
		return dao.selectList(); //줄거없음!
	}

	@Override
	public productVO detail(int pno) {
		// TODO Auto-generated method stub
		System.out.println(">>> detail service 진입성공 ");
		return dao.selectOne(pno);
	}

	@Override
	public int modify(productVO pvo) {
		// TODO Auto-generated method stub
		System.out.println(">>> modify service 진입성공 ");
		return dao.update(pvo);
	}

	@Override
	public int remove(int pno2) {
		// TODO Auto-generated method stub
		System.out.println(">>> delete service 진입성공 ");
		return dao.delete(pno2);
	}


	
	
	
	
	
}

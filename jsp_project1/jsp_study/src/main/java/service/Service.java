package service;

import java.util.List;

import domain.productVO;

public interface Service {

	int register(productVO pvo);

	List<productVO> list();

	productVO detail(int pno);

	int modify(productVO pvo1);

	int remove(int pno2);

	

}

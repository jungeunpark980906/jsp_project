package handle;

import domain.PagingVO;

public class PagingHandler {
	
	private int startPage; 
	private int endPage; 
	private int nQty = 8;
	private boolean prev, next; 
	private int totalCount;
	private PagingVO pgvo; 
	
	//생성자
	public PagingHandler(PagingVO pgvo, int totalCount) {
		this.pgvo = pgvo;
		this.totalCount = totalCount;

	
		this.endPage =(int)(Math.ceil(pgvo.getPageNo() / (this.nQty*1.0)) * this.nQty);
		this.startPage = this.endPage - (this.nQty -1);
		
		int lastPage = (int)Math.ceil((totalCount*1.0) / pgvo.getQty());
		if(lastPage < this.endPage) { 
			this.endPage = lastPage;
		}
		
		//다음버튼과 이전버튼
		this.prev = this.startPage > 1; 
		this.next = this.endPage < lastPage; 
		
		
	}
	
	//시작 페이지네이션 리턴
	public int getStartPage() {
		return startPage;
	}
	
	
	//setter,getter
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getNqty() {
		return nQty;
	}

	public void setNqty(int nQty) {
		this.nQty = nQty;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public PagingVO getPgvo() {
		return pgvo;
	}

	public void setPgvo(PagingVO pgvo) {
		this.pgvo = pgvo;
	}

	
}
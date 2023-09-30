package com.i4.i4blog.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


//페이징 DTO
@Data
@AllArgsConstructor
@NoArgsConstructor
	/**
	 * @author 최규하
	 * 기본적인 페이징 형식을 따름
	 */
public class PageDTO {
	private Criteria cri;
	private int articleTotalCount;
	private int endPage;
	private int beginPage;
	private boolean prev;
	private boolean next;
	
	private final int buttonNum = 5;
	
	
	private void calcDataOfPage() {
		
		endPage = (int) (Math.ceil(cri.getPageNum() / (double) buttonNum) * buttonNum);
		
		beginPage = (endPage - buttonNum) + 1;
		
		prev = beginPage != 1;
		
		next = articleTotalCount > (endPage * cri.getCountPerPage());
		
		if(!next) {
			endPage = (int) Math.ceil(articleTotalCount / (double) cri.getCountPerPage()); 
		}
		
	}
	
	public void setArticleTotalCount(int articleTotalCount) {
		this.articleTotalCount = articleTotalCount;
		calcDataOfPage();
	}
}

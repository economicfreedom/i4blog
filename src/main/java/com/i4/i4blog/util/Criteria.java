package com.i4.i4blog.util;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;


//페이징 크리테리아
@Getter
@Setter
@ToString

	/**
	 * @author 최규하
	 * 페이징 크리테리아 기본적인 형식을 따름
	 */
public class Criteria {
	
	//사용자가 선택한 페이지 정보를 담을 변수.

	private int pageNum;
	private int countPerPage;

	//검색에 필요한 데이터를 변수로 선언.
	private String keyword;
	private String type;
	public int getOffset() {
    return (this.pageNum - 1) * this.countPerPage;
}
	public Criteria() {
		this.pageNum = 1;
		this.countPerPage = 10;
	}

}

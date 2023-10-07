package com.i4.i4blog.repository.interfaces.comment;
import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.i4.i4blog.repository.model.comment.Comment;
import com.i4.i4blog.vo.comment.CommentVO;
//import com.mysql.cj.protocol.a.NativeConstants.IntegerDataType;

 
@Mapper
public interface CommentRepository  {	
	/**
	 * 
	 * @param comment create
	 * @return
	 */
	//생성
	//댓글 등록(작성)
	public int create(Comment comment);
	
	//댓글 등록 (유저)
	public int createByUserId(Integer id);
	
	//댓글 수정
	public int updateComment(Integer id);
	//댓글 삭제
	public int commentDelete(Integer id);
	
	//댓글 목록 리스트
	public List<Comment>commentList(int commentList);
	
	
	
	//댓글 갯수
	public int commentTotal(int commentList);

	
	/**
	 * @author 최규하
	 * 이름은 delete지만 실제론 state를 바꾸기 때문에 update로 동작함
	 * state가 1이었던걸 0으로 바꿈
	 */
	public int deleteById(Integer id);
	
	
	
	
}

package com.i4.i4blog.service;

import org.springframework.stereotype.Service;

import com.i4.i4blog.dto.board.BoardWriteFormDto;
import com.i4.i4blog.repository.interfaces.board.BoardRepository;
import com.i4.i4blog.repository.model.board.Board;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardService {

	private final BoardRepository boardRepository;
	
	// 게시글 등록 - insert
	public void boardWriteService(BoardWriteFormDto boardWriteFormDto) {
		Board board = new Board();
		board.setBoardTitle(boardWriteFormDto.getBoardTitle());
		board.setBoardContent(boardWriteFormDto.getBoardContent());
		board.setBoardCategory(boardWriteFormDto.getBoardCategory());
		
		int result = boardRepository.insert(board);
	}

}

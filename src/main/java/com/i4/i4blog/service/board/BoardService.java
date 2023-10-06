package com.i4.i4blog.service.board;

import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Service;

import com.i4.i4blog.dto.board.BoardWriteFormDto;
import com.i4.i4blog.repository.interfaces.board.BoardRepository;
import com.i4.i4blog.repository.model.board.Board;
import com.i4.i4blog.vo.board.BoardVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class BoardService {

	private final BoardRepository boardRepository;
	
	// 게시글 등록 - insert
	public void boardWriteService(BoardWriteFormDto boardWriteFormDto) {
		Board board = Board.builder()
				.userId(boardWriteFormDto.getUserId())
				.boardCategory(boardWriteFormDto.getBoardCategory())
				.boardTitle(boardWriteFormDto.getBoardTitle())
				.boardContent(boardWriteFormDto.getBoardContent())
				.boardPublic(boardWriteFormDto.getBoardPublic())
				.build();
		
		int result = boardRepository.insert(board);
	}

    public Integer deleteById(Integer id){
		log.info("boardService deleteById Start");
        return boardRepository.deleteById(id);
    }
    
    public List<Board> findByUserId(Integer userId, Principal principal) {
    	String findUserId = null;
    	log.info("findUserId {}",findUserId);
    	log.info("principal.getName {}", principal.getName());
    	if (principal.getName().equals(findUserId)) {
			return boardRepository.findAllByUserId(userId);
		} else {
			return boardRepository.findByUserId(userId);
		}
    }
    
//    public List<Board> findByUserId(Integer userId) {
//    	List<Board> boardList = boardRepository.findByUserId(userId);
//    	return boardList;
//    }
    
    public BoardVO findById(Integer id) {
    	BoardVO board = boardRepository.findById(id);
    	return board;
    }
    
    public Integer updateCount(Integer id) {
    	return boardRepository.updateCount(id);
    }
    
    

}

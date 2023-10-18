package com.i4.i4blog.service.board;

import com.i4.i4blog.dto.board.BoardUpdateFormDto;
import com.i4.i4blog.dto.board.BoardWriteFormDto;

import com.i4.i4blog.repository.interfaces.board.BoardRepository;
import com.i4.i4blog.repository.interfaces.user.UserRepository;
import com.i4.i4blog.repository.model.board.Board;
import com.i4.i4blog.vo.board.BoardListVo;
import com.i4.i4blog.vo.board.BoardVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class BoardService {

    private final BoardRepository boardRepository;
    private final UserRepository userRepository;

    /**
     * 게시글 작성
     *
     * @param boardWriteFormDto
     */
    public void boardWriteService(BoardWriteFormDto boardWriteFormDto, Principal principal) {
        Integer uid = userRepository.getIdByUserId(principal.getName());
        Board board = Board.builder()
                .userId(uid)
                .boardCategory(boardWriteFormDto.getBoardCategory())
                .boardTitle(boardWriteFormDto.getBoardTitle())
                .boardContent(boardWriteFormDto.getBoardContent())
                .boardPublic(boardWriteFormDto.getBoardPublic())
                .boardThumbnail(boardWriteFormDto.getThumbnail())
                .boardImgOriginal(boardWriteFormDto.getOriginalImg())
                .build();

        int result = boardRepository.insert(board);
    }

    public Integer deleteById(Integer id) {
        log.info("boardService deleteById Start");
        return boardRepository.deleteById(id);
    }

    /**
     * 게시글 목록
     *
     * @param userId
     * @return List<Board>
     */
    public List<BoardListVo> findByUserId(Integer id, @RequestParam Integer category) {
    	log.info("서비스 category값 =====> {}", category);
    	
        List<BoardListVo> boardList = boardRepository.findByUserId(id, category);
        return boardList;
    }

    /**
     * 게시글 내용보기
     *
     * @param id
     * @return BoardVO
     * 게시글 id로 글 내용보기
     */
    public BoardVO findById(Integer id) {
        BoardVO board = boardRepository.findById(id);
        return board;
    }

    /**
     * 조회수 +1
     * @param id
     * @return
     */
    public Integer updateCount(Integer id) {
        return boardRepository.updateCount(id);
    }

    public Board getBoard(Integer id) {
        return boardRepository.getBoard(id);
    }

    public void boardUpdateService(BoardUpdateFormDto boardUpdateFormDto) {
        log.info("boardUpdateService Start");
        Board board = boardRepository.getBoard(boardUpdateFormDto.getId());
        log.info("boardUpdateFormDto.getBoardTitle() : {}", boardUpdateFormDto.getBoardTitle());
        board.setBoardTitle(boardUpdateFormDto.getBoardTitle());

        board.setBoardContent(boardUpdateFormDto.getBoardContent());
        board.setBoardCategory(boardUpdateFormDto.getBoardCategory());
        board.setBoardPublic(boardUpdateFormDto.getBoardPublic());
        board.setBoardThumbnail(boardUpdateFormDto.getThumbnail());
        board.setBoardImgOriginal(boardUpdateFormDto.getOriginalImg());
        boardRepository.updateById(board);
    }

    public void deleteThumbnail(Integer id) {
        boardRepository.deleteThumbnail(id);
    }
    
    public int count(Integer userId) {
    	int result = boardRepository.count(userId);
    	return result;
    };

}

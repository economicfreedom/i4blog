package com.i4.i4blog.service.board;

import com.i4.i4blog.dto.board.BoardUpdateFormDto;
import com.i4.i4blog.dto.board.BoardWriteFormDto;

import com.i4.i4blog.dto.search.SearchResultDTO;
import com.i4.i4blog.repository.interfaces.board.BoardRepository;
import com.i4.i4blog.repository.interfaces.user.UserRepository;
import com.i4.i4blog.repository.model.board.Board;
import com.i4.i4blog.util.Criteria;
import com.i4.i4blog.vo.board.BoardListVo;
import com.i4.i4blog.vo.board.BoardVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

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
        Integer uid = userRepository.getId(principal.getName());
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

//    public List<Board> findByUserId(Integer userId, Principal principal) {
//    	String findUserId = null;
//    	log.info("findUserId {}",findUserId);
//    	log.info("principal.getName {}", principal.getName());
//    	if (principal.getName().equals(findUserId)) {
//			return boardRepository.findAllByUserId(userId);
//		} else {
//			return boardRepository.findByUserId(userId);
//		}
//    }

    /**
     * 게시글 목록
     *
     * @param userId
     * @return List<Board>
     */
    public List<BoardListVo> findByUserId(Integer id) {
        List<BoardListVo> boardList = boardRepository.findByUserId(id);
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
        System.out.println("DB 조회 전");
        BoardVO board = boardRepository.findById(id);
        System.out.println("DB 조회 후");
        System.out.println(board);
        return board;
    }

    /**
     * 조회수 +1
     *
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

}

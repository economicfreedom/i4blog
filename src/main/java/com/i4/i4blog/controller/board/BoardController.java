package com.i4.i4blog.controller.board;

import java.security.Principal;
import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.i4.i4blog.service.board.BoardService;
import com.i4.i4blog.service.like.LikeService;
import com.i4.i4blog.service.user.UserService;
import com.i4.i4blog.vo.board.BoardListVo;
import com.i4.i4blog.vo.board.BoardVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/blog/{userId}/board")
@RequiredArgsConstructor
@Slf4j
public class BoardController {

    private final BoardService boardService;
    private final UserService userService;
    private final LikeService likeService;

    /**
     * 게시글 작성 페이지
     */
    // 추가
    // 최규하
    // GPT 카운트
    @PreAuthorize("isAuthenticated()")
    @GetMapping("/write")
    public String boardWrite(Model model, Principal principal) {



        byte count = userService.getGptCountByUserId(principal.getName());
        model.addAttribute("gptCount",count);

        return "board/write";
    }


    /**
     * 사용자의 게시글 리스트 페이지
     */
    @GetMapping("/list")
    public String boardList(Model model, @PathVariable String userId, @RequestParam(value = "category", required = false) String category) {
    	Integer id = userService.getIdByUserId(userId);
    	int count = boardService.count(id);
    	model.addAttribute("count", count);

        List<BoardListVo> boardList = boardService.findByUserId(id, category);
        if (boardList.isEmpty()) {
            log.info("list is empty {}", boardList);
            model.addAttribute("boardList", null);
        } else {
            log.info("boardList {} ", boardList);
            model.addAttribute("boardList", boardList);
        }

        return "board/list";
    }

    /**
     * 게시글 내용보기
     *
     * @param model
     * @param id
     * @return view.jsp
     * 해당 id의 게시글 내용보기
     */
    @GetMapping("/view/{id}")
    public String boardView(Model model, @PathVariable Integer id, Principal principal) {
        boardService.updateCount(id);
        BoardVO board = boardService.findById(id);
        model.addAttribute("board", board);
        
        boolean like = false;
        if (principal != null) {
        	like = likeService.existsLike(board.getId(), principal);
		}
        model.addAttribute("like", like);

        return "board/view";
    }

    /**
     * 게시글 수정 페이지
     *
     * @param model
     * @param id
     * @return update.jsp
     */
    // 추가 - 최규하
    // 내용 - 회원 가입된 사용자만 접근 가능하게 추가
    @PreAuthorize("isAuthenticated()")
    @GetMapping("/update/{id}")
    public String boardUpdate(Model model, @PathVariable Integer id) {
        log.info("받아온 id", id);
        BoardVO board = boardService.findById(id);
        model.addAttribute("board", board);

        return "board/update";
    }
   
}

package com.icia.board.controller;

import com.icia.board.dto.BoardDTO;
import com.icia.board.dto.BoardFileDTO;
import com.icia.board.dto.CommentDTO;
import com.icia.board.dto.PageDTO;
import com.icia.board.service.BoardService;
import com.icia.board.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private CommentService commentService;

    @GetMapping("/save")
    public String saveForm() {
        return "boardPages/boardSave";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO) throws IOException {
        System.out.println("boardDTO = " + boardDTO);
        boardService.save(boardDTO);
        return "redirect:/board/";
    }

    @GetMapping("/")
    public String findAll(Model model) {
        List<BoardDTO> boardDTOList = boardService.findAll();
        model.addAttribute("boardList", boardDTOList);
        return "boardPages/boardList";
    }

//    @GetMapping("/paging")
//    public String paging(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
//                         Model model) {
//        System.out.println("page = " + page);
//        // 사용자가 요청한 페이지에 해당하는 글 목록 데이터
//        List<BoardDTO> boardDTOList = boardService.pagingList(page);
//        System.out.println("boardDTOList = " + boardDTOList);
//        // 하단에 보여줄 페이지 번호 목록 데이터
//        PageDTO pageDTO = boardService.pagingParam(page);
//        model.addAttribute("boardList", boardDTOList);
//        model.addAttribute("paging", pageDTO);
//        return "boardPages/boardPaging";
//    }

    @GetMapping("/paging")
    public String paging(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
                         @RequestParam(value = "q", required = false, defaultValue = "") String q,
                         @RequestParam(value = "type", required = false, defaultValue = "boardTitle") String type,
                         Model model) {
        System.out.println("page = " + page + ", q = " + q);
        List<BoardDTO> boardDTOList = null;
        PageDTO pageDTO = null;
        if (q.equals("")) {
            // 사용자가 요청한 페이지에 해당하는 글 목록 데이터
            boardDTOList = boardService.pagingList(page);
            // 하단에 보여줄 페이지 번호 목록 데이터
            pageDTO = boardService.pagingParam(page);
        } else {
            boardDTOList = boardService.searchList(page, type, q);
            pageDTO = boardService.pagingSearchParam(page, type, q);
        }
        model.addAttribute("boardList", boardDTOList);
        model.addAttribute("paging", pageDTO);
        model.addAttribute("q", q);
        model.addAttribute("type", type);
        return "boardPages/boardPaging";
    }

//    @GetMapping("/search")
//    public String search(@RequestParam("q") String q, // 검색어
//                         @RequestParam(value = "page", required = false, defaultValue = "1") int page,
//                         Model model) {
//        List<BoardDTO> boardDTOList = boardService.searchList(q, page);
//        PageDTO pageDTO = boardService.pagingSearchParam(page, q);
//        model.addAttribute("boardList", boardDTOList);
//        model.addAttribute("paging", pageDTO);
//        model.addAttribute("q", q);
//        return "boardPages/boardPaging";
//    }

    @GetMapping
    public String findById(@RequestParam("id") Long id, Model model,
                           @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                           @RequestParam(value = "q", required = false, defaultValue = "") String q,
                           @RequestParam(value = "type", required = false, defaultValue = "boardTitle") String type) {
        boardService.updateHits(id);
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        model.addAttribute("page", page);
        model.addAttribute("q", q);
        model.addAttribute("type", type);
        if(boardDTO.getFileAttached() == 1) {
            List<BoardFileDTO> boardFileDTO = boardService.findFile(id);
            model.addAttribute("boardFileList", boardFileDTO);
            System.out.println("boardFileDTO = " + boardFileDTO);
        }
        List<CommentDTO> commentDTOList = commentService.findAll(id);
        if(commentDTOList.size() == 0) {
            model.addAttribute("commentList", null);
        } else {
            model.addAttribute("commentList", commentDTOList);
        }
        return "boardPages/boardDetail";
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        return "boardPages/boardUpdate";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO, Model model) {
        boardService.update(boardDTO);
        BoardDTO dto = boardService.findById(boardDTO.getId());
        model.addAttribute("board", dto);
//        return ""redirect:/board?id="+boardDTO.getId()";
        return "boardPages/boardDetail";
    }

    @GetMapping("/delete-check")
    public String deleteCheck(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        return "boardPages/deleteCheck";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        boardService.delete(id);
        return "redirect:/board/";
    }
}

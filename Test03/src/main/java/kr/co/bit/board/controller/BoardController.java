package kr.co.bit.board.controller;

import java.util.List;

import javax.validation.Valid;

import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bit.board.service.BoardServiceimpl;
import kr.co.bit.board.vo.BoardVO;

@RequestMapping("/board")
@Controller
public class BoardController {
	
	@Autowired
	private BoardServiceimpl service;
	
	@RequestMapping("/list")
	public ModelAndView list() {
		List<BoardVO> BoardList = service.selectAllBoard();
		
		System.out.println("구웨에에에에엑");
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("board/list");
		mav.addObject("BoardList",BoardList);
		
		return mav;
	}
	@RequestMapping("/detail/{no}")
	public String selectOne(@PathVariable int no,Model mod) {
		BoardVO boardVO = service.selectOne(no);
		
		mod.addAttribute("boardVO",boardVO);
 		
		return "board/detail";
	}
	@RequestMapping(value = "/write",method=RequestMethod.GET)
	public String writeForm(Model model) {
		
		BoardVO board = new BoardVO();
		
		model.addAttribute("boardVO", board);
		
		return "board/write";
	}
	@RequestMapping(value = "/write",method=RequestMethod.POST)
	public String write(@Valid BoardVO board) {
		service.insertBoard(board);
		
		return "redirect:/board/list";
	}
	@RequestMapping(value = "/{no}",method=RequestMethod.DELETE)
	public String delete(@PathVariable int no) {
		
		service.deleteBoard(no);
		return "redirect:/board/list";
	}
	
	@RequestMapping(value = "/{no}",method=RequestMethod.GET)
	public String modifyForm(Model model) {
		
		BoardVO board = new BoardVO();
		
		model.addAttribute("boardVO", board);
		
		return "board/modify";
	}
	@RequestMapping(value = "/{no}",method=RequestMethod.POST)
	public String modify(@PathVariable int no,@Valid BoardVO board) {
		board.setNo(no);
		service.modifyBoard(board);
		
		return "redirect:/board/detail/"+no;
	}

}

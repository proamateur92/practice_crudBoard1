package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.service.BoardService;
import kr.co.service.ReplyService;
import kr.co.vo.BoardVO;
import kr.co.vo.PageMaker;
import kr.co.vo.ReplyVO;
import kr.co.vo.SearchCriteria;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	BoardService service;

	@Inject 
	ReplyService replyService;
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "/board/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception {
		logger.info("writeView");
	}

	// 게시판 글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	@ResponseBody
	public int write1(BoardVO boardVO) throws Exception {

		logger.info("ajax write");
		int check = service.write(boardVO);

		return check;
	}

	// 게시글 목록
	@RequestMapping(value="/board/main", method= RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		
		logger.info("list page");
		
		model.addAttribute("boardInfo", service.list(scri));
	
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/board/main";
	}
	
	@RequestMapping(value="/board/readView", method=RequestMethod.GET)
	public String read(BoardVO boardVO, Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		
		logger.info("read page");
		
		BoardVO board = service.read(boardVO.getBno());
		
		if(board==null) 
		return "redirect:/";
		
		model.addAttribute("scri", scri);
		model.addAttribute("read", board);
		
		List<ReplyVO> replyList = replyService.readReply(boardVO.getBno());
		model.addAttribute("replyList", replyList);
		
		return "/board/readView";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	@ResponseBody
	public int delete(BoardVO boardVO) throws Exception {
		logger.info("delete page");
		
		int check = service.delete(boardVO.getBno());
		
		return check;
	}
	
	@RequestMapping(value="/updateView", method=RequestMethod.GET)
	public String updateView(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("update page");
		
		BoardVO board = service.read(boardVO.getBno());
		
		model.addAttribute("scri", scri);
		model.addAttribute("read", board);
		
		return "/board/updateView";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	@ResponseBody
	public int update(BoardVO boardVO) throws Exception {
		logger.info("update");
		
		int check = service.update(boardVO);
		
		return check;
	}
}

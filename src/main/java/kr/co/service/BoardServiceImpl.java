package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.BoardDAO;
import kr.co.vo.BoardVO;
import kr.co.vo.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	public BoardDAO dao;

	@Override
	public int write(BoardVO boardVO) throws Exception {
		return dao.write(boardVO);
	}

	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		return dao.list(scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}
	
	@Override
	public BoardVO read(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(bno);
	}

	@Override
	public int update(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.update(boardVO);
	}

	@Override
	public int delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.delete(bno);
	}
	
}

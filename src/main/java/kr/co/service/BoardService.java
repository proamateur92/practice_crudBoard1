package kr.co.service;

import java.util.List;

import kr.co.vo.BoardVO;
import kr.co.vo.SearchCriteria;

public interface BoardService {
	
	//게시글 작성
	public int write(BoardVO boardVO) throws Exception;
	
	//게시글 목록
	public List<BoardVO> list(SearchCriteria scri) throws Exception;
	
	//게시글 갯수
	public int listCount(SearchCriteria scri) throws Exception;

	//게시글 상세보기
	public BoardVO read(int bno) throws Exception;
	
	//게시글 수정
	public int update(BoardVO boardVO) throws Exception;
	
	//게시글 삭제
	public int delete(int bno) throws Exception;
}

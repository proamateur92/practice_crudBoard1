package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.BoardVO;
import kr.co.vo.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO{

	@Inject
	private SqlSession sqlSession;
	
	// 게시판 글 작성
	@Override
	public int write(BoardVO boardVO) throws Exception {
		return sqlSession.insert("boardMapper.insert", boardVO);
	}

	// 게시판 목록
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("boardMapper.listPage", scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("boardMapper.listCount", scri);
	}
	// 게시글 상세보기
	@Override
	public BoardVO read(int bno) throws Exception {
		return sqlSession.selectOne("boardMapper.read", bno);
	}

	// 게시글 수정
	@Override
	public int update(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.update", boardVO);
	}

	// 게시글 삭제
	@Override
	public int delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete("boardMapper.delete", bno);
	}
	
}

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="../../resources/jquery-3.5.1.min.js"></script>
	 	<title>게시판</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			$('.dlt_btn').on("click", function(){
				let check = confirm("글을 삭제하시겠습니까?");
				
				if(check){
					$.ajax({
						url: "/delete",
						type: "POST",
						data: {"bno": $('#bno').val()},
						success: function(data){
							if(data>=1){
								alert('삭제완료');
							} else{
								alert('해당 게시물은 이미 삭제되었습니다.')
							}
							location.href="/board/main";
						},
						error: function(){
							alert('에러');
						}
					});
				}
			});
			
			$('.bck_btn').on('click', function(){
				location.href = "/board/main?page=${scri.page}"
					+"&perPageNum=${scri.perPageNum}"
					+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			});
		})
	</script>
	<body>
	
		<div id="root">
			<header>
				<h1>게시판</h1>
			</header>
			<hr />
			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr />
			
			<section id="container">
				<form action="/updateView">
				  <input type="hidden" id="bno" name="bno" value="${read.bno}" />
				  <input type="hidden" id="page" name="page" value="${scri.page}"> 
				  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
				  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					<table>
						<tbody>
							<tr>
								<td>
									<label for="bno"></label><input type="hidden" id="bno" name="bno" value="${read.bno}" readonly/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="title">제목</label><input type="text" id="title" name="title" value="${read.title}" readonly/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="content">내용</label><input type="text" id="content" name="content" value="${read.content}" readonly/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${read.writer}" readonly/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="regdate">작성날짜</label>
									<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd"/><input type="hidden" name="regdate" value="${read.regdate }">				
								</td>
							</tr>		
						</tbody>			
					</table>
					<input type="submit" class="udt_btn" value="수정">
					<input type="button" class="dlt_btn" value="삭제">
					<input type="button" class="bck_btn" value="메인">
				</form>
			
			<!-- 댓글 -->
				<div id="reply">
				  <ol class="replyList">
				    <c:forEach items="${replyList}" var="replyList">
				      <li>
				        <p>
				        작성자 : ${replyList.writer}<br />
				        작성 날짜 :  <fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" />
				        </p>
				
				        <p>${replyList.content}</p>
				      </li>
				    </c:forEach>   
				  </ol>
				</div>
			</section>
			<hr />
		</div>
	</body>
</html>
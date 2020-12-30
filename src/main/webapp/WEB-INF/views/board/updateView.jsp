<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="../../resources/jquery-3.5.1.min.js"></script>
	 	<title>수정 페이지</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			
			$('.udt_btn').on('click', function(){
				let check = confirm('글을 수정하시겠습니까?');
				
				if(fn_valiChk()){
					return false;
				}
				
				var $frm = $('#frm :input');
				var param1 = $frm.serialize();
				
				var data1 = $('#frm').serialize();
				var param = JSON.stringify(data1);
				
				$.ajax({
					url: "/update",
					dataType: "json",
					type: "POST",
					data: data1,
					success: function(data){
						alert('수정이 완료되었습니다.');
						location.href="/board/readView?bno="+$('#bno').val();
					},
					error: function(){
						alert('수정 에러');
					}
				});
			})
			
			function fn_valiChk(){
				var regForm = $("form[name='updateForm'] .chk").length;
				for(var i = 0; i<regForm; i++){
					if($('.chk').eq(i).val()==""||$(".chk").eq(i).val()==null){
						alert($('.chk').eq(i).attr("title"));
						return true;
					}
				}
			}
			
			$('.bck_btn').on('click', function(){
				event.preventDefault();
				location.href = "/board/main?bno=${read.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
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
			<form name="readForm" role="form" method="post">
			  <input type="hidden" id="bno" name="bno" value="${read.bno}" />
			  <input type="hidden" id="page" name="page" value="${scri.page}"> 
			  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
			  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
			  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
			</form>

				<form id="frm" name="updateForm">
					<table>
						<tbody>
							<tr>
								<td>
									<label for="bno"></label><input type="hidden" id="bno" name="bno" value="${read.bno}" readonly/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="title">제목</label><input type="text" id="title" name="title" value="${read.title}" class="chk" title="제목을 입력해주세요."/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="content">내용</label><input type="text" id="content" name="content" value="${read.content}" class="chk" title="내용을 입력해주세요."/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${read.writer}" class="chk" title="작성자를 입력해주세요."/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="regdate">작성날짜</label>
									<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd"/>					
								</td>
							</tr>		
						</tbody>			
					</table>
					<input type="button" id="udt_btn" class="udt_btn" value="수정">
					<input type="button" class="bck_btn" value="메인">
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>
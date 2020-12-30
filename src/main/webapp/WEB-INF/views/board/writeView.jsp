<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../../resources/jquery-3.5.1.min.js"></script>

<title>게시판</title>

<script>
	function btn2(){
			var checking = confirm('글을 작성하시겠습니까?');
			
			if(checking) {
					
					if(fn_valiChk()){
						return false;	
					}
					
					$.ajax({
					url: "/write",
					type: "POST",
					data: $("#frm").serialize(),
					success: function(data){
						if(data>0) {
							alert('글 작성 성공');
						} else{
							alert('글 작성 실패');
						}
						$('#title').val('');
						$('#content').val('');
						$('#writer').val('');
					},
					error: function(){
						alert("에러");
						$('#title').val('');
						$('#content').val('');
						$('#writer').val('');
					}
				});
		}
		
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($('.chk').eq(i).val()==""||$(".chk").eq(i).val()==null){
					alert($('.chk').eq(i).attr("title"));
					return true;
				}
			}
		}	
	}
</script>
</head>
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
			<form id="frm" name="writeForm">
				<table>
					<tbody>
						<tr>
							<td>
								<label for="title">제목</label><input type="text" id="title" name="title" class="chk" title="제목을 입력하세요.">
							</td>
						</tr>
						<tr>
							<td>
								<label for="content">내용</label><textarea id="content" name="content" class="chk" title="내용을 입력하세요."></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<label for="writer">작성자</label><input type="text" id="writer" name="writer" class="chk" title="작성자를 입력하세요.">
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<input type="button" onclick="btn2();" value="작성">
		</section>
	</div>
</body>
</html>
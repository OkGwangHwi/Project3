<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%@ include file="../common/isFlag.jsp" %>

 <body>
 <script>
//유기명함수
function checkValidate(frm){
	if(frm.title.value == ""){
		alert("제목을 입력하세요"); //경고창 띄움
		frm.title.focus(); //제목 입력란으로 포커스 이동
		return false; //전송되지 않도록 이벤트리스너로 false반환
	}
	if(frm.content.value == ""){
		alert("내용을 입력하세요");
		frm.content.focus();
		return false;
	}
}

//무기명함수
/* var checkValidate2 = function(frm){
	//실행부는 유기명함수와 동일함.
} */
</script>
<center>
<div id="wrap">
<%@ include file="../include/top.jsp" %>

<img src="../images/space/sub_image.jpg" id="main_visual" />

<div class="contents_box">
	<div class="left_contents">
		<%@ include file = "../include/space_leftmenu.jsp" %>
	</div>
	<div class="right_contents">
		<div class="top_title">
			<!-- <img src="../images/space/sub01_title.gif" alt="공지사항" class="con_title" /> -->
			<img src="../images/space/<%=boardTitle %>.gif" alt="" class="con_title" />
			<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;<%=boardTitle %><p>
		</div>
	<div>

<form enctype="multipart/form-data" action="WriteProc.jsp?bname=info" method="get" onsubmit="return checkValidate(this);">
<input type="hidden" name="bname" value="<%=bname %>" />
<table class="table table-bordered">
<colgroup>
	<col width="20%"/>
	<col width="*"/>
</colgroup>
<tbody>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">작성자</th>
		<td>
			<input type="text" class="form-control" 
				style="width:100px;" />
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">이메일</th>
		<td>
			<input type="text" class="form-control" 
				style="width:400px;" />
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">패스워드</th>
		<td>
			<input type="text" class="form-control" 
				style="width:200px;" />
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">제목</th>
		<td>
			<input type="text" class="form-control" name="title"/>
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">내용</th>
		<td>
			<textarea rows="10" class="form-control" name="content"></textarea>
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">첨부파일</th>
		<td>
			<input type="file" class="form-control" />
		</td>
	</tr>
</tbody>
</table>

<div class="row text-center" style="">
	<!-- 각종 버튼 부분 -->
	
	<button type="submit" class="btn btn-danger">전송하기</button>&nbsp;&nbsp;
	<button type="reset" class="btn btn-primary">Reset</button>&nbsp;&nbsp;
	<button type="button" class="btn btn-warning" 
		onclick="location.href='boardList.jsp?bname=<%=bname %>';">리스트보기</button>
</div>
</form> 

				</div>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>


	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>
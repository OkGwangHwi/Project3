<%@page import="model.BbsDAO"%>
<%@page import="model.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%@ include file="../common/isFlag.jsp" %>
<%
/*
검색후 파라미터 처리를 위한 추가부분
	: 리스트에서 검색후 상세보기, 그리고 다시 리스트보기를
	눌렀을때 검색이 유지되도록 처리하기위한 코드삽입
*/
String queryStr = "bname="+bname+"&";
String searchColumn = request.getParameter("searchColumn");
String searchWord = request.getParameter("searchWord");
if(searchWord != null){
	queryStr += "searchColumn="+searchColumn+"&searchWord="+searchWord+"&";
}
//3페이지에서 상세보기했다면 리스트로 돌아갈때도 3페이지로 가야한다.
String nowPage = request.getParameter("nowPage");
if(nowPage==null || nowPage.equals("")){
	nowPage="1";
}
queryStr += "&nowPage="+nowPage;

//폼값 받기 - 파라미터로 전달된 게시물의 일련번호
String num = request.getParameter("num");
BbsDAO dao = new BbsDAO(application);


//게시물의 조회수 +1증가
dao.updateVisitCount(num);

BbsDTO dto = dao.selectView(num);

dao.close();
%>
 <body>
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
					<img src="../images/space/<%=boardTitle %>.gif" alt="" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;<%=boardTitle %><p>
				</div>
				<div>

<form enctype="multipart/form-data">
<table class="table table-bordered">
<colgroup>
	<col width="20%"/>
	<col width="30%"/>
	<col width="20%"/>
	<col width="*"/>
</colgroup>
<tbody>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">작성자</th>
		<td>
			<%=dto.getId() %>
		</td>
		<th class="text-center" 
			style="vertical-align:middle;">작성일</th>
		<td>
			<%=dto.getPostDate() %>
		</td>
	</tr>
	<tr>
		
		<th class="text-center" 
			style="vertical-align:middle;">조회수</th>
		<td>
			<%=dto.getVisitcount() %>
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">제목</th>
		<td colspan="3">
			<%=dto.getTitle() %>.
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">내용</th>
		<td colspan="3">
			<%=dto.getContent() %>
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">첨부파일</th>
		<td colspan="3">
			파일명.jpg
		</td>
	</tr>
</tbody>
</table>

<div class="row text-center" style="">
	<!-- 각종 버튼 부분 -->
	<% if(bname.equals("freeboard") || bname.equals("info") || bname.equals("photo")){ %>
	<button type="button" class="btn btn-primary"
		onclick="location.href='boardEdit.jsp?num=<%=dto.getNum() %>&bname=<%=bname %>';">수정하기</button>&nbsp;&nbsp;
	<button type="button" class="btn btn-success"
		onclick="location.href='DeleteProc.jsp?num=<%=dto.getNum() %>&bname=<%=bname %>';">삭제하기</button>&nbsp;&nbsp;
	<button type="button" class="btn btn-warning" 
		onclick="location.href='boardList.jsp?bname=<%=bname %>';">리스트보기</button>
	<% }else{ %>
	<button type="button" class="btn btn-warning" 
		onclick="location.href='boardList.jsp?bname=<%=bname %>';">리스트보기</button>
	<% } %>
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
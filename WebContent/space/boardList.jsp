<%@page import="util.PagingUtil"%>
<%@page import="model.BbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%@ include file="../common/isFlag.jsp" %>
<%
//한글깨짐처리 - 검색폼에서 입력된 한글이 전송되기때문
request.setCharacterEncoding("UTF-8");

//web.xml에 저장된 컨텍스트 초기화 파라미터를 application객체를 통해 가져옴
String driver = application.getInitParameter("MariaJDBCDriver");
String url = application.getInitParameter("MariaConnectURL");

//DAO객체 생성 및 DB커넥션
BbsDAO dao = new BbsDAO(driver,url);

/*
파라미터를 저장할 용도로 생성한 Map컬렉션. 여러개의 파라미터가
있는경우 한꺼번에 저장한 후 DAO로 전달할것임.
*/
Map<String,Object> param = new HashMap<String,Object>();

//필수파라미터인 bname을 DAO로 전달하기위해 Map컬렉션에 저장한다.
param.put("bname",bname);

//폼값을 받아서 파라미터를 저장할 변수 생성
String queryStr = ""; //검색시 페이지번호로 쿼리스트링을 넘겨주기 위한 용도

//필수파라미터에 대한 쿼리스트링 처리
queryStr = "bname="+bname+"&";

//검색어 입력시 전송된 폼값을 받아 Map에 저장
String searchColumn = request.getParameter("searchColumn");
String searchWord = request.getParameter("searchWord");
if(searchWord != null){
	//검색어를 입력한 경우 Map에 값을 입력함.
	param.put("Column",searchColumn);
	param.put("Word",searchWord);
	
	//검색어가 있을때 쿼리스트링을 만들어준다.
	queryStr += "searchColumn="+searchColumn+"&searchWord="+searchWord+"&";
}

//board테이블에 입력된 전체 레코드 갯수를 카운트하여 반환받음
int totalRecordCount = dao.getTotalRecordCount(param);

/*페이지처리 start*/
//web.xml의 초기화 파라미터 가져와서 정수로 변경후 저장
int pageSize = Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
int blockPage = Integer.parseInt(application.getInitParameter("BLOCK_PAGE"));

//전체페이지수 계산 => 105개 / 10 => 10.5 => ceil(10.5) => 11 (올림처리)
int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);

/*
현재페이지번호 : 파라미터가 없을때는 무조건 1페이지로 지정하고, 있을때는 해당 값을
	얻어와서 지정한다. 즉, 리스트에 처음 진입했을때는 1페이지가 된다.
*/
int nowPage = (request.getParameter("nowPage")==null
				|| request.getParameter("nowPage").equals(""))
					? 1 : Integer.parseInt(request.getParameter("nowPage"));

//MariaDB를 통해 한페이지에 출력할 게시물의 범위를 결정한다.
//limit의 첫번째 인자 : 시작인덱스
int start = (nowPage-1)*pageSize ;
//limit의 두번째 인자 : 가져올 레코드의 갯수
int end = pageSize;

//게시물의 범위를 Map컬렉션에 저장하고 DAO로 전달한다.
param.put("start",start);
param.put("end",end);
/*페이지처리 end*/

//조건에 맞는 레코드를 select하여 결과셋을 List컬렉션으로 반환받음
List<BbsDTO> bbs = dao.selectListPage(param);

//DB자원해제
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
<script src="../common/jquery/jquery-3.5.1.js"></script>
<script>
$(function(){
	
});
</script>
</head>
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
			
			<div class="row text-right" style="margin-bottom:20px;
		padding-right:50px;">
<!-- 검색부분 -->
<form class="form-inline">	
	<div class="form-group">
		<select name="keyField" class="form-control">
			<option value="">제목</option>
			<option value="">작성자</option>
			<option value="">내용</option>
		</select>
	</div>
	<div class="input-group">
		<input type="text" name="keyString"  class="form-control"/>
		<div class="input-group-btn">
			<button type="submit" class="btn btn-default">
				<i class="glyphicon glyphicon-search"></i>
			</button>
		</div>
	</div>
</form>	
</div>
<div class="row">
	<!-- 게시판리스트부분 -->
	<table class="table table-bordered table-hover">
	<colgroup>
		<col width="80px"/>
		<col width="*"/>
		<col width="120px"/>
		<col width="120px"/>
		<col width="80px"/>
		<col width="50px"/>
	</colgroup>
	
	<thead>
	<tr class="success">
		<th class="text-center">번호</th>
		<th class="text-left">제목</th>
		<th class="text-center">작성자</th>
		<th class="text-center">작성일</th>
		<th class="text-center">조회수</th>
		<th class="text-center">첨부</th>
	</tr>
	</thead>
	<tbody>
	<!-- 리스트반복 -->
	<%
		//List컬렉션에 입력된 데이터가 없을때 true를 반환
		if(bbs.isEmpty()){
	%>
		<tr>
			<td colspan="6" align="center" height="100">
				등록된 게시물이 없습니다.
			</td>
		</tr>
	<%
		}
		else {
			//게시물의 가상번호로 사용할 변수
			int vNum = 0;
			int countNum = 0;
			/*
			컬렉션에 입력된 데이터가 있다면 저장된 BbsDTO의 갯수만큼
			즉, DB가 반환해준 레코드의 갯수만큼 반복하면서 출력한다.
			*/
			for(BbsDTO dto : bbs) {
				vNum = totalRecordCount - (((nowPage-1) * pageSize) + countNum++);
				/*
				전체게시물수 : 107개
				페이지사이즈 : 10
				
				현재페이지1
					첫번째게시물 : 107 - (((1-1)*10)+0) = 107
					두번째게시물 : 107 - (((1-1)*10)+1) = 106
				현재페이지2
					첫번째게시물 : 107 - (((2-1)*10)+0) = 97
					두번째게시물 : 107 - (((2-1)*10)+1) = 96
				*/
	%>
	<tr>
		<td class="text-center"><%=vNum %></td>
		<td class="text-left"><a href="boardView.jsp?num=<%=dto.getNum() %>&bname=<%=bname %>&nowPage=<%=nowPage%>&<%=queryStr%>"><%=dto.getTitle() %></a></td>
		<td class="text-center"><%=dto.getId() %></td>
		<td class="text-center"><%=dto.getPostDate() %></td>
		<td class="text-center"><%=dto.getVisitcount() %></td>
		<td class="text-center">첨부</td>
	</tr>
	<%
			}
		}
	%>
	</tbody>
	</table>
</div>
<div class="col text-right" style="padding-right:10px;">
<% if(bname.equals("freeboard") || bname.equals("photo") || bname.equals("info")){ %>
	<!-- 각종 버튼 부분 -->
	<!-- <button type="reset" class="btn">Reset</button> -->
		
	<button type="button" class="btn btn-primary" 
		onclick="location.href='boardWrite.jsp?bname=<%=bname %>';">글쓰기</button>
				
	<!-- <button type="button" class="btn btn-primary">수정하기</button>
	<button type="button" class="btn btn-success">삭제하기</button>
	<button type="button" class="btn btn-info">답글쓰기</button>
	<button type="button" class="btn btn-warning">리스트보기</button>
	<button type="submit" class="btn btn-danger">전송하기</button> -->
<% } %>
</div>
<div class="col text-center">
	<!-- 페이지번호 부분 -->
	<ul class='pagination justify-content-center'>
		<%=PagingUtil.pagingBS4(totalRecordCount,pageSize, blockPage, nowPage,"boardList.jsp?"+queryStr) %>
	</ul>
</div>
	</div>
	<%@ include file="../include/quick.jsp" %>
</div>
<%@ include file="../include/footer.jsp" %>
</center>
</body>
</html>
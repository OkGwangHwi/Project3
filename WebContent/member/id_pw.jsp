<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<script>
function check(frm){
		
	var name = document.idsearchFrm.name.value;
	 if(name.length<1 || name==null){
	  alert("이름을 입력하십시오");
	  return false;
	 }
	var email = document.idsearchFrm.email.value;
	 if(email.length<1 || email==null){
		  alert("이메일을 입력하십시오");
		  return false;
		 }
	 
	 var url = "idCheck.jsp?id=" + id;
	 window.open(url, "post", "height = 200, width = 600");
}

</script>

 <body>
	<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/member/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				<%@ include file = "../include/member_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/member/id_pw_title.gif" alt="" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;멤버쉽&nbsp;>&nbsp;아이디/비밀번호찾기<p>
				</div>
				<form action="" name="idsearchFrm" onsubmit="return check(this);">
				<div class="idpw_box">
					<div class="id_box">
						<ul>
							<li><input type="text" name="name" value="" class="login_input01" /></li>
							<li><input type="text" name="email" value="" class="login_input01" /></li>
						</ul>
						<a href="idSearch.jsp" alt="확인"><img src="../images/member/id_btn01.gif" class="id_btn" /></a>
						<a href="join01.jsp" alt="회원가입"><img src="../images/login_btn03.gif" class="id_btn02" /></a>
					</div>
					<div class="pw_box">
						<ul>
							<li><input type="text" name="" value="" class="login_input01" /></li>
							<li><input type="text" name="" value="" class="login_input01" /></li>
							<li><input type="text" name="" value="" class="login_input01" /></li>
						</ul>
						<a href=""><img src="../images/member/id_btn01.gif" class="pw_btn" /></a>
					</div>
				</div>
				</form>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>

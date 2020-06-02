<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp"%>
<script>
	function check(frm) {
		console.log(frm)
		
		if (frm.name.value == "") {
			frm.name.focus();
			alert("이름을 입력하십시오");
			return false;
		}
		
		if (frm.email.value == "") {
			frm.email.focus();
			alert("이메일을 입력하십시오");
			return false;
		}
		window.open("idSearch.jsp?from="+frm.from.value+"&email="+frm.email.value+"&subject="+frm.subject.value,"아이디 찾기","width:10,height:10");
	}

	function pwCheck(frm) {
		
		if (frm.id.value == "") {
			frm.id.focus();
			alert("아이디를 입력하십시오");
			return false;
		}
		if (frm.name2.value == "") {
			frm.name2.focus();
			alert("이름을 입력하십시오");
			return false;
		}
		if (frm.email2.value == "") {
			frm.email2.focus();
			alert("이름을 입력하십시오");
			return false;
		}
		
		
	}
</script>

<body>
	<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp"%>

		<img src="../images/member/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				<%@ include file="../include/member_leftmenu.jsp"%>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/member/id_pw_title.gif" alt=""
						class="con_title" />
					<p class="location">
						<img src="../images/center/house.gif" />&nbsp;&nbsp;멤버쉽&nbsp;>&nbsp;아이디/비밀번호찾기
					<p>
				</div>
				<form method="post" action="#" name="idsearchFrm"
					onsubmit="return check(this);">
					<div class="idpw_box">
						<div class="id_box">
							<ul>
								<li><input type="text" name="name" value=""
									class="login_input01" /></li>
								<li><input type="text" name="email" value=""
									class="login_input01" /></li>
								<li><input type="hidden" name="from"
									value="akflseo@naver.com" class="login_input01" /></li>
								<li><input type="hidden" name="subject"
									value="잊어버린 아이디를 확인하세요." class="login_input01" /></li>
							</ul>
							<input type="image" src="../images/member/id_btn01.gif"
								class="id_btn" alt="확인" /> <a href="join01.jsp" alt="회원가입"><img
								src="../images/login_btn03.gif" class="id_btn02" /></a>
						</div>
					</div>
				</form>
				<form method="post" action="pwSearch.jsp" name="pwsearchFrm"
					onsubmit="return pwCheck(this);">
					<div class="pw_box">
						<ul>
							<li><input type="text" name="id" value=""
								class="login_input01" /></li>
							<li><input type="text" name="name2" value=""
								class="login_input01" /></li>
							<li><input type="text" name="email2" value=""
								class="login_input01" /></li>
							<li><input type="hidden" name="from2"
								value="akflseo@naver.com" class="login_input01" /></li>
							<li><input type="hidden" name="subject2"
								value="잊어버린 비밀번호를 확인하세요." class="login_input01" /></li>
						</ul>
						<input type="image" src="../images/member/id_btn01.gif"
							class="pw_btn" alt="확인" />
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../include/quick.jsp"%>


	<%@ include file="../include/footer.jsp"%>
	</center>
</body>
</html>

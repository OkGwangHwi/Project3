<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
 <body>
 <script src="../common/jquery/jquery-3.5.1.js"></script>
 <script>
 	function checkJoin(frm){
 		
 		var name = document.getElementsByName("name");
 		if(name[0].value==""){
 			alert("이름을 입력하세요");
 			name[0].focus();
 			return false;
 		}
 		
 		var id = document.getElementsByName("id");
 		if(id[0].value==""){
 			alert("아이디를 입력하세요");
 			id[0].focus();
 			return false;
 		}
 		
 		var pass1 = document.getElementsByName("pass1");
 		var pass2 = document.getElementsByName("pass2");
 		
		if(pass1[0].value==""){
 			alert("패스워드를 입력하세요");
 			pass1[0].focus();
 			return false;
 		}
		if(pass2[0].value==""){
 			alert("패스워드를 입력하세요");
 			pass2[0].focus();
 			return false;
 		}
		
		var tel1 = document.getElementsByName("tel1");
 		var tel2 = document.getElementsByName("tel2");
 		var tel3 = document.getElementsByName("tel3");
 		
		if(tel1[0].value==""){
 			alert("전화번호를 입력하세요");
 			tel1[0].focus();
 			return false;
 		}
		if(tel2[0].value==""){
 			alert("전화번호를 입력하세요");
 			tel2[0].focus();
 			return false;
 		}
		if(tel3[0].value==""){
 			alert("전화번호를 입력하세요");
 			tel3[0].focus();
 			return false;
 		}
		
		var mobile1 = document.getElementsByName("mobile1");
 		var mobile2 = document.getElementsByName("mobile2");
 		var mobile3 = document.getElementsByName("mobile3");
 		
		if(mobile1[0].value==""){
 			alert("휴대전화번호를 입력하세요");
 			mobile1[0].focus();
 			return false;
 		}
		if(mobile2[0].value==""){
 			alert("휴대전화번호를 입력하세요");
 			mobile2[0].focus();
 			return false;
 		}
		if(mobile3[0].value==""){
 			alert("휴대전화번호를 입력하세요");
 			mobile3[0].focus();
 			return false;
 		}
 		
		var email1 = document.getElementById("email1");
 		var email2 = document.getElementById("email2");
 		
		if(email1.value==""){
 			alert("이메일을 입력하세요");
 			email1.focus();
 			return false;
 		}
		if(email2.value==""){
 			alert("이메일을 입력하세요");
 			email2.focus();
 			return false;
 		}
 		
 		var zip1 = document.getElementsByName("zip1");
		if(zip1[0].value==""){
			alert("주소를 입력하세요");
			zip1[0].focus();
			return false;
		} 
 	}
 	
 	$(function(){
 		//이메일 select선택시 도메인 부분 채워주기
        $('#last_email_check2').change(function(){
            //option태그 사이의 텍스트를 읽어온다.
            var text = $('#last_email_check2 option:selected').text();
            //value속성에 지정된 값을 읽어온다.
            var value = $('#last_email_check2 option:selected').val();
           // alert("선택한 항목의 text:"+text+", value:"+value);
            
           // 

           if(value==""){//선택하세요를 선택
                $('#email2').attr('readonly',true); //attr : 속성을 부여함
                $('#email2').val("");
           }
           else if(value=='direct'){//직접입력을 선택
                $('#email2').attr('readonly',false); //readonly : 읽기만 가능. 수정불가
                $('#email2').val("");
           }
           else{//그외 포털 도메인 선택
                $('#email2').attr('readonly',true); 
                //위에서 읽어온 값을 도메인 부분에 입력한다.
                $('#email2').val(value);
           }
        });
 	});
 </script>
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
					<img src="../images/join_tit.gif" alt="회원가입" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;멤버쉽&nbsp;>&nbsp;회원가입<p>
				</div>

				<p class="join_title"><img src="../images/join_tit03.gif" alt="회원정보입력" /></p>
				<form action="JoinProc.jsp" name="joinFrm" onsubmit="return checkJoin(this);">
				<table cellpadding="0" cellspacing="0" border="0" class="join_box">
					<colgroup>
						<col width="80px;" />
						<col width="*" />
					</colgroup>
					<tr>
						<th><img src="../images/join_tit001.gif" /></th>
						<td><input type="text" name="name" value="" class="join_input" /></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit002.gif" /></th>
						<td><input type="text" name="id"  value="" class="join_input" />&nbsp;<a onclick="id_check_person();" style="cursor:hand;"><img src="../images/btn_idcheck.gif" alt="중복확인"/></a>&nbsp;&nbsp;<span>* 4자 이상 12자 이내의 영문/숫자 조합하여 공백 없이 기입</span></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit003.gif" /></th>
						<td><input type="password" name="pass1" value="" class="join_input" />&nbsp;&nbsp;<span>* 4자 이상 12자 이내의 영문/숫자 조합</span></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit04.gif" /></th>
						<td><input type="password" name="pass2" value="" class="join_input" /></td>
					</tr>
					

					<tr>
						<th><img src="../images/join_tit06.gif" /></th>
						<td>
							<input type="text" name="tel1" value="" maxlength="3" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
							<input type="text" name="tel2" value="" maxlength="4" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
							<input type="text" name="tel3" value="" maxlength="4" class="join_input" style="width:50px;" />
						</td>
					</tr>
					<tr>
						<th><img src="../images/join_tit07.gif" /></th>
						<td>
							<input type="text" name="mobile1" value="" maxlength="3" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
							<input type="text" name="mobile2" value="" maxlength="4" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
							<input type="text" name="mobile3" value="" maxlength="4" class="join_input" style="width:50px;" /></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit08.gif" /></th>
						<td>
 
	<input type="text" name="email1" id="email1" style="width:100px;height:20px;border:solid 1px #dadada;" value="" /> @ 
	<input type="text" name="email2" id="email2" style="width:150px;height:20px;border:solid 1px #dadada;" value="" readonly />
	<select name="last_email_check2" onChange="email_input(this);" class="pass" id="last_email_check2" >
		<option selected="" value="">선택해주세요</option>
		<option value="direct" >직접입력</option>
		<option value="dreamwiz.com" >dreamwiz.com</option>
		<option value="empal.com" >empal.com</option>
		<option value="empas.com" >empas.com</option>
		<option value="freechal.com" >freechal.com</option>
		<option value="hanafos.com" >hanafos.com</option>
		<option value="hanmail.net" >hanmail.net</option>
		<option value="hotmail.com" >hotmail.com</option>
		<option value="intizen.com" >intizen.com</option>
		<option value="korea.com" >korea.com</option>
		<option value="kornet.net" >kornet.net</option>
		<option value="msn.co.kr" >msn.co.kr</option>
		<option value="nate.com" >nate.com</option>
		<option value="naver.com" >naver.com</option>
		<option value="netian.com" >netian.com</option>
		<option value="orgio.co.kr" >orgio.co.kr</option>
		<option value="paran.com" >paran.com</option>
		<option value="sayclub.com" >sayclub.com</option>
		<option value="yahoo.co.kr" >yahoo.co.kr</option>
		<option value="yahoo.com" >yahoo.com</option>
	</select>
	 
						<input type="checkbox" name="open_email" value="1">
						<span>이메일 수신동의</span></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit09.gif" /></th>
						<td>
						<input type="text" name="zip1" value=""  class="join_input" style="width:100px;" />
						<a href="javascript:;" title="새 창으로 열림" onclick="zipFind('zipFind', '<?=$_Common[bbs_path]?>member_zipcode_find.php', 590, 500, 0);" onkeypress="">[우편번호검색]</a>
						<br/>
						
						<input type="text" name="addr1" value=""  class="join_input" style="width:550px; margin-top:5px;" /><br>
						<input type="text" name="addr2" value=""  class="join_input" style="width:550px; margin-top:5px;" />
						
						</td>
					</tr>
				</table>

				<p style="text-align:center; margin-bottom:20px"><button type="submit"><img src="../images/btn01.gif" /></button>&nbsp;&nbsp;<a href="../main/main.jsp"><img src="../images/btn02.gif" /></a></p>
				</form>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>

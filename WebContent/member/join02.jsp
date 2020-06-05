<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>

<body>
<script src="../common/jquery/jquery-3.5.1.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
		
		var deAddr = document.getElementsByName("detailAddress");
		if(deAddr[0].value==""){
			alert("상세주소를 입력하세요");
			deAddr[0].focus();
			return false;
		}
		
		//HTML의 form name="joinFrm"

		 //유효성체크하고 싶은 값의 id, name="pass1"

		  var UserPassword = document.joinFrm.pass1;

		  if(UserPassword.value.length<4 && UserPassword.value.length>12) {

		    alert("비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 4~12자를 입력해주세요.");

		    return false;
		  }

		  if(!UserPassword.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/)) {

		      alert("비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 4~12자를 입력해주세요.");

		    return false;
		  }
		  return true;
		  
		  //아이디 유효성 검사
		  var UserId = document.joinFrm.id;

		  if(UserId.value.length<4 && UserId.value.length>12) {

		    alert("비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 4~12자를 입력해주세요.");

		    return false;
		  }

		  if(!UserId.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/)) {

		      alert("비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 4~12자를 입력해주세요.");

		    return false;
		  }
		  return true;
	}
	
	
	function id_check_person(frm){
		
		var id = document.joinFrm.id.value;
		 if(id.length<1 || id==null){
		  alert("중복체크할 아이디를 입력하십시오");
		  return false;
		 }
		 var url = "idCheck.jsp?id=" + id;
		 window.open(url, "post", "height = 200, width = 600");
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
		<input type="hidden" name="grade" value="1" />
	</tr>
	<tr>
		<th><img src="../images/join_tit002.gif" /></th>
		<td><input type="text" name="id"  value="" class="join_input" />&nbsp;<img style="cursor:hand" src="../images/btn_idcheck.gif" onclick="id_check_person()" alt="중복확인"/>&nbsp;&nbsp;<span>* 4자 이상 12자 이내의 영문/숫자 조합하여 공백 없이 기입</span></td>
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
	<option value="gmail.com" >gmail.com</option>
	<option value="nate.com" >nate.com</option>
	<option value="naver.com" >naver.com</option>
	<option value="daum.net" >daum.net</option>
</select>
<input type="checkbox" name="open_email" value="1">
<span>이메일 수신동의</span></td>
</tr>
<tr>
	<th><img src="../images/join_tit09.gif" /></th>
	<td>
<!-- 다음주소api -->						
<input type="text" id="zip1" name="zip1" placeholder="우편번호" style="width:100px;height:20px;border:solid 1px #dadada; margin-top:2px; margin-bottom:2px;">
<input type="button" onclick="DaumPostcode()" value="우편번호 찾기" style="width:100px;height:20px;border:solid 1px #dadada; margin-top:2px; margin-bottom:2px; cursor:hand;"><br>
<input type="text" id="address" name="address" placeholder="주소" style="width:200px;height:20px;border:solid 1px #dadada; margin-top:2px; margin-bottom:2px;"><br>
<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" style="width:200px;height:20px;border:solid 1px #dadada; margin-top:2px; margin-bottom:2px;">
<input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목" style="width:100px;height:20px;border:solid 1px #dadada; margin-top:2px; margin-bottom:2px;">
</td>

<script>
function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zip1').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}
</script>
						
						
	</tr>
</table>

		<p style="text-align:center; margin-bottom:20px"><input type="image" src="../images/btn01.gif"/>&nbsp;&nbsp;<a href="../main/main.jsp"><img src="../images/btn02.gif" /></a></p>
		</form>
	</div>
</div>
<%@ include file="../include/quick.jsp" %>
</div>
<%@ include file="../include/footer.jsp" %>
</center>
</body>
</html>

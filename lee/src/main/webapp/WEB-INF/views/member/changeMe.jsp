<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
	<style type="text/css">
	</style>
    
	<script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
	<script type="text/javascript"
	src="/lee/resources/sideMenu/sideScript.js"></script>
	
<link rel="stylesheet" href="/lee/resources/sideMenu/css/sideStyle.css">
<style type="text/css">
	.btn-primary{
		background-color:#0BD392;
		border-color: #09BD8D;
	}
	.btn-primary:HOVER{
		background-color:#1AA4AC;
		border-color: #3CDBDE;
	}
	
}
	
	</style>

<script type="text/javascript">
	function checkPw() {
		$('#checkPw').removeClass('in');
		$('body').removeClass('modal-open');
		$('#changeForm').css('display', 'block');
		
		$('#collapseTwo').show('slow');
		$('#collapseTwo').addClass('in');
		
		
	};
	
	</script>
<style>
@media ( min-width :769px) {
	
	#changeForm{
		width: 100%;
		
	}
	#submenulabel{
	width: 675px;
	height: 134px;
	}
	
	
}
@media ( max-width :768px) {
	#cssmenu {
		width: 100%;
	}
	
	#changeForm{
		width: 100%;
		
	}
	#submenulabel{
	width:100%;
	height: 134px;
	margin-bottom:50px;
	}
	
	
}
</style>
</head>
<body class='modal-open'>
	<%@include file="../header.jsp"%>
	<div class="row">
		
		<%@include file="sideMenu.jsp"%>

		<div class="col-md-9" id="changeMeForm">
			<div id="changeForm"
				style="padding: 0p	x; background-color: ">
	<!-- 컨텐츠 입력 -->
				<!-- 커넨츠 상단 바 -->			
				<div id="submenulabel" style="width:675px; height:134px;  background-image:url('/lee/resources/member/img/sul.png')">
					<div style="width:100%; height:100%; margin:0px; padding:50px; background-color: rgba(26, 164, 172, 0.5 );">
						<h2 style="color:white;">회원정보 수정</h2>
					</div>
				</div>							
						<!-- 개인정보 수정 폼  -->
						<div class="panel panel-default row" style="margin-left: 20px;">
    
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body ">
      
      	<!-- 개인정보 입력폼 시작  -->
      	<!-- 아이디 -->
						      	<div>
						      	<label for="sel1">아이디</label>
							        <div class="input-group" style="width: 70%;">
							         	
									 	<span class="col-md-4" style="margin:0;padding:0; width:250px;">
									 		<input type="text" id="idid"class="form-control" placeholder="6~20자 (한글 및 특수문자 금지)" aria-describedby="basic-addon2" style="width:250px;" required>
									 	</span>	
									  	<span class="input-group-addon col-md-1" id="basic-addon1" style="height:34px;padding-right:20px;padding-top:10px;background-color:white; border: 0px;">@</span>
										
										 <div class="col-lg-3" style="padding:0;">
										    <div class="input-group" style="width:20%;">
										      <input id="emailInput" type="text" class="form-control" aria-label="..." style="width:250px;" readonly="readonly" required>
										      <div class="input-group-btn">
										        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">메일선택 <span class="caret"></span></button>
										        	<ul class="dropdown-menu dropdown-menu-right" role="menu">
										          <li onclick="javascript:mailselect('hanmail.net');"><a >hanmail.net</a></li>
										          <li onclick="javascript:mailselect('naver.com');"><a >naver.com</a></li>
										          <li onclick="javascript:mailselect('gmail.com');"><a >gmail.com</a></li>
										          <li onclick="javascript:mailselect('hotmail.com');"><a >hotmail.com</a></li>
										          <li onclick="javascript:mailselect('msn.co.kr');"><a >msn.co.kr</a></li>
										          <li class="divider"></li>
										          <li onclick="javascript:selfinput();"><a >직접입력</a></li>
										        </ul>
										      </div><!-- /btn-group -->
						   					</div><!-- /input-group -->
						   				</div>	
									</div>
									<div><button id="checEmailid" class="btn btn-primary col-md-6" data-toggle="modal" data-target="#checkId" >
							      이메일 중복검사</button></div>
								</div>
						<br><br><br>
								<!-- 비밀번호 -->
								<label for="sel1">비밀번호</label>
								<div class="input-group">
																			<!-- 비밀번호 -->          
								  <input type="password" id="pwpw" class="form-control" placeholder="6~20자 (한글 및 특수문자 금지)" aria-describedby="basic-addon2" style="width:300px;" required>	
								</div>
								 <label for="sel1">비밀번호 확인</label>
								<div class="input-group">
						         
								  <input type="password" id="pwpw2" class="form-control" aria-describedby="basic-addon2" style="width:300px;" required>	
								</div>
						<br>
						        <!-- 이름 -->
						        <label for="sel1">이 름</label>
						        <div class="input-group">
																			<!-- 이름 -->
								  <input type="text" id="memname" class="form-control" placeholder="6~20자 (한글 및 특수문자 금지)" aria-describedby="basic-addon2" style="width:300px;" required>	
								</div>
						<br>
						        <hr>
						        <!-- 연락처 -->
						        <label for="sel1">연락처</label> 
								<div class="input-group" style="width:70%">
																			<!-- 연락처1 -->
									<select class="form-control" id=phph0 style="width:150px;border-top-left-radius:0;border-bottom-left-radius:0;">
										<option>010</option>
										<option>011</option>
										<option>017</option>
										<option>019</option>
									</select>
									<span class="input-group-addon col-md-1" id="basic-addon1" style="height:34px;padding-right:20px;padding-top:10px;border-radius:0;border:0px; background-color:#fff;" >
									<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
									</span>
																			<!-- 연락처 2 -->
									<input type="text" id="phph" class="form-control" aria-describedby="basic-addon2" style="width:150px;" maxlength="4" required>
									<span class="input-group-addon col-md-1" id="basic-addon1" style="height:34px;padding-right:20px;padding-top:10px;border-radius:0;border:0px; background-color:#fff;">
									<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
									</span>
																			<!-- 연락처 3 -->
									<input type="text" id="phph2" class="form-control" aria-describedby="basic-addon2" style="width:150px;" maxlength="4" required>
									<br>
									<br>
								</div>
								<div><button id="checkHp" class="btn btn-primary col-md-6" data-toggle="modal" data-target="#checkHpM" onclick="checkHp.ju">
							      휴대전화 중복검사</button>
							     </div>
						<br><br>
						<br><br>
											<!-- 주소 -->
									<div>
									<label for="sel1">주 소</label>
									
									</div>
						        	<div class="input-group" style="width:500px;">
						        	<button class="btn btn-primary col-md-6" id='addrSearchBt' data-toggle="modal" data-target="#searchAddress">주소검색</button>
									<br><br>
																        	<!-- 우편번호 -->
									<input type="text" class="form-control col-md-6" aria-describedby="sizing-addon2" style="width:150px" id="zipNo" name="zipNo" readonly required>
									
									</div>
									
									
								<br>
								<span class="input-group" id="selfinput" required>
																			<!-- 주소1 -->
									<input type="text" class="form-control" aria-describedby="sizing-addon2"
									id="roadAddrPart1" readonly>
								</span>
								<br>
								<span class="input-group" id="selfinput" >
																			<!-- 주소2 -->
									<input type="text" class="form-control" aria-describedby="sizing-addon2"
									id="addrDetail" value="" readonly>
								</span>
								<br>
								<span class="input-group" id="selfinput" >
																			<!-- 주소3 -->
									<input type="text" class="form-control" aria-describedby="sizing-addon2" placeholder="상세주소"
									id="roadAddrPart2" value="" readonly>
								</span>
						
								<br>
						        <br>
						
						        <!-- 비밀번호 힌트 -->
						        <span class="input-group">
						        	<label for="sel1">비밀번호 힌트</label>
									 
									<select class="form-control" id="pwdhint">
										<option value="0">나의 첫사랑 이름은 ?</option>
										<option value="1">내가 다녔던 초등학교는 ?</option>
										<option value="2">나에게 영감을 주는 사람은 ?</option>
										<option value="3">나에게 가장 소중한 사람은 ?</option>
										<option value="4">가장 여행가보고 싶은 나라는 ?</option>
										<option value="5">내 이상형의 조건은 ?</option>
									</select>
								</span>
						        
						        <!-- 비밀번호 찾기 답 -->
						        <span class="input-group" id="selfinput" required >
						       <label for="sel1">비밀번호 답변</label>
									<input type="text" id="pwdanswer"class="form-control" aria-describedby="sizing-addon2" >
								</span>
						        <br>
						        <br>
						        <!-- 생년월일 -->
						        <span class="input-group" id="birthday" >
						        <label for="sel1">생년월일 / 성별</label> 
						        <div style="width:100%;">
						        <table>
						        	<tr>
										<td><input id="jumin" type="text" class="form-control" aria-describedby="sizing-addon2" maxlength="8" placeholder="예) 19900401" required></td>
										<td><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></td>
										<td><input id="jumin2" type="text" class="form-control" aria-describedby="sizing-addon2" style="width:40px;" maxlength="1" required></td>
										<td>
											<!-- * 기호 -->
											<span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>
											<span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>
											<span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>
											<span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>
											<span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>
											<span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>
										</td>
									<tr>
								</table>
								</div>
								</span>
						        <!-- 관심사 -->
						        <label for="sel1">관심사</label>
						         <div class="input-group">
						         	<div class="checkbox" id="like">
						         	<ul>
						         		<li>
						         			<input type="checkbox" name="like" value="0">나의 첫사랑 이름은 ?
						         		</li>
						         		<li>
						         			<input type="checkbox" name="like" value="1">내가 다녔던 초등학교는 ?
						         		</li>
						         		<li>
						         			<input type="checkbox" name="like"  value="2">나에게 영감을 주는 사람은 ?
						         		</li>
						         		<li>
						         			<input type="checkbox" name="like" value="3">나에게 가장 소중한 사람은 ?
						         		</li>
						         		<li>
						         			<input type="checkbox" name="like" value="4">가장 여행가보고 싶은 나라는 ?
						         		</li>
						         		<li>
						         			<input type="checkbox" name="like" value="5">내 이상형의 조건은 ?
						         		</li>
						         	</ul>
						         	</div>
						         </div>
						        <br>
						        <br>
						         <button id="memberInput" class="collapsed btn btn-primary" data-toggle="collapse" data-parent="#accordion" aria-expanded="false" aria-controls="collapseTwo"  >
							      작성완료</button>
							      
							      <button id="memberInput2" class="collapsed btn btn-primary" data-toggle="collapse" href="#collapseThree" data-parent="#accordion" aria-expanded="false" aria-controls="collapseTwo" style="display:none;" >
							      이메일 인증으로 넘어가기</button>
						        
						      </div>
						    </div>
						  </div>
						</div>
										
									</div>
								<!-- Modal -->
								 <div class="modal fade in" id="checkPw" tabindex="-1" role="dialog"
										aria-labelledby="myModalLabel" aria-hidden="false"
										style="display: block; margin-top: 22%; margin-left:20%;">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
													<h4 class="modal-title" id="myModalLabel">회원정보변경(비밀번호입력)</h4>
												</div>
												<div class="modal-body">
													<input type="password" placeholder="비밀번호">
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-primary"
														onclick="checkPw();">비밀번호 확인</button>
												</div>
											</div>
										</div>
									</div>

		
	
	<div class="col-md-12" style="padding:0px">
	<%@include file="../footer.jsp"%>
	</div>
</div>
</body>
</html>
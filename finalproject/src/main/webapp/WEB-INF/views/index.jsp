<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>index.jsp입니다.</h2>
<ul>
	<li><a href="hello.do">SpringMVC</a></li>
	<li><a href="memoWrite.do">메모작성하기</a></li>
	<li><a href="memberJoin.do">회원가입하기</a></li>
	<li><a href="kakaOrder.do">편의점 물품 발주</a></li>
	
	<li><a href="paramTest.do?str=spring&idx=3">파라미터 테스트</a></li>
	<li><a href="cookieView.do">쿠키값 확인하기</a></li>
	<li><a href="cookieMake.do">쿠기값 저장하기</a></li>
	
	<li><a href="sessionView.do">세션 값 확인하기</a></li>
	<li><a href="sessionMake.do">세션 값 저장하기</a></li>
	
	<li><a href="memberLoginForm.do">로그인 페이지로</a></li>
	
	<li><a href="viewTest.do">명시적 뷰 지정방법</a></li>
	<li><a href="viewTest2.do">명시적 뷰 지정방법2</a></li>
	<li><a href="view/viewOk.do">묵시적 뷰 지정방법</a></li>
	<li><a href="viewTest3.do">다른 명령어 호출하기</a></li>
	<li><a href="modelTest.do">모델 테스트1(Map)</a></li>
	<li><a href="modelTest2.do">모델 테스트2(Model)</a></li>
	<li><a href="modelTest3.do">모델 테스트3(ModelMap)</a></li>
	<li><a href="model/modelResult.do">모델 테스트4(묵시적 뷰 지정방식 사용)</a></li>
	<li><a href="animeA.do">애니메이션 정보 검색</a></li>
	
	<li><a href="fileUploadForm.do">파일업로드</a></li>
	<li><a href="fileDownList.do">파일 다운로드</a></li>
	
	<li><a href="emp.do">마지막 사원관리 프로그램</a></li>
</ul>
</body>
</html>
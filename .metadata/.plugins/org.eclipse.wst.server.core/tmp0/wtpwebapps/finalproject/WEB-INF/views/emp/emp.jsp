<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>사원관리 프로그램</h2>
<form name="empAdd" action="empAdd.do">
<table>
	<tr>
		<th>사원이름</th>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<th>E-mail</th>
		<td><input type="text" name="email"></td>
	</tr>
	<tr>
		<th>부서명</th>
		<td><input type="text" name="dept"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="submit" value="사원등록">
		<input type="reset" value="다시작성">
		</td>
	</tr>
</table>
</form>
<hr>
<h3>사원삭제</h3>
<form name="empDel" action="empDel.do">
<input type="text" name="name"><br>
<input type="submit" value="삭제하기">
</form>
<hr>
<h3><a href="empList.do">모든 사원 내역 보기</a></h3>
<hr>
<h3>사원검색</h3>
<form name="empFind" action="empFind.do">
<input type="text" name="name">
<input type="submit" value="검색하기">
</form>
<hr>
<h3>회원정보수정하기</h3>
<form name="empUpdate" action="empUpdate.do">
<input type="text" name="name">
<input type="submit" value="검색하기">
</form>
</body>
</html>
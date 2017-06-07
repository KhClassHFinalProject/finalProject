<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반도서 등록</title>
</head>
<body onload="mouseLoc()">
<h2>일반도서 등록 페이지</h2>
<form name="bookAddInput" action="bookAddForm.ju">
ISBN : <input type="text" name="query" id="query"><br>
<input type="submit" value="책 등록페이지">
</form>
<script>
function mouseLoc(){
	document.bookAddInput.query.focus();
}
</script>
</body>
</html>
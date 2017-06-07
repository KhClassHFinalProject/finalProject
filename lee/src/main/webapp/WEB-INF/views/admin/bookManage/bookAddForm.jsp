<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>책 등록 페이지</h2>
<form name="bookAddForm" action="bookAdd.ju" method="post">
          	<table border="1" cellspacing="1" style="width: 800px">
          		<tr>
					<td rowspan="8">
						<img src="${image}" width="300px" height="300px">
						<input type="hidden" name="bk_url" value="${image}">
					</td>
					<th>ISBN</th>
					<td>${isbn}<input type="hidden" name="bk_isbn" value="${isbn}"></td>
				</tr>
				<tr>
					<th>도서명</th>
					<td>${title}<input type="hidden" name="bk_subject" value="${title}"></td>
				</tr>
				<tr>
					<th>저자명</th>
					<td>${author}<input type="hidden" name="bk_writer" value="${author}"></td>
				</tr>
				<tr>
					<th>출판사명</th>
					<td>${publisher}<input type="hidden" name="bk_publisher" value="${publisher}"></td>
				</tr>
				<tr>
					<th>출판일</th>
					<td><input type="text" name="bk_writedate"></td>
				</tr>
				<tr>
					<th>분류</th>
					<td>
					<select name="bk_lg" id="lg" class="form-control" onchange="find()">
			            <option selected="selected" value="all">전체</option>
			            <option value="0">철학</option>
			            <option value="1">종교</option>
			            <option value="2">인문과학</option>
			            <option value="3">자연과학</option>
			            <option value="4">예술</option>
			            <option value="5">언어</option>
			            <option value="6">문학</option>
			            <option value="7">역사</option>
			        </select><br>
			        	<div class="md"></div>
			        </td>
				</tr>
          	</table>
          	<table>
          		<tr>
          			<th>책 설명</th>
          			<td>${description}<input type="hidden" name="bk_info" value="${description}"></td>
          		</tr>
          	</table>
			<input type="submit" value="책 등록">
		</form>
<script type="text/javascript" src="resource/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="resource/js/bkList.js"></script>
<script>

</script>
</body>
</html>
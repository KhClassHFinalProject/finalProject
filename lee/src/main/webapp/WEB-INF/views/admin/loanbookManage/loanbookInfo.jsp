<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="check">
         <table>
				<tr>
					<td rowspan="6"><img src="${dto.bk_url}"><input type="hidden" id="mem_idx" name="mem_idx" value="${dto.mem_idx}"></td>
					<th>도서코드</th>
					<td>${dto.bk_idx}<input type="hidden" name="bk_idx" id="bk_idx" value="${dto.bk_idx}"></td>
				</tr>
				<tr>
					<th>도서명</th>
					<td>${dto.bk_subject}</td>
				</tr>
				<tr>
					<th>저자명</th>
					<td>${dto.bk_writer}</td>
				</tr>
				<tr>
					<th>출판사명</th>
					<td>${dto.bk_publisher}</td>
				</tr>
				<tr>
					<th>출판일</th>
					<td>${dto.bk_writedate}</td>
				</tr>
				<tr>
					<th>대출자</th>
					<td>${dto.mem_idx}</td>
				</tr>
			</table>
			<table>
				<tr>
					<th>설명</th>
					<td>${dto.bk_info}</td>
				</tr>
			</table>
			<span id="button"></span>
		 </form>
<script>
var state = ${dto.bk_take};
var bt = document.getElementById('button')
switch(state){
	case 0 : bt.innerHTML = '<input type="button" value="대출" onclick="checkOutGo()">'; break;
	case 1 : bt.innerHTML = '<input type="button" value="반납" onclick="checkInGo()">'; break;
}

function checkOutGo(){
	var memIdx = document.getElementById('mem_idx').value;
	var bkIdx = document.getElementById('bk_idx').value;
	location.href="checkOut2.ju?bk_idx="+bkIdx;
}
function checkInGo(){
	var bkIdx = document.getElementById('bk_idx').value;
	location.href="checkIn2.ju?bk_idx="+bkIdx;
}
</script>
</body>
</html>
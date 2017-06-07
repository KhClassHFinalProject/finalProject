<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>대출중인 도서 리스트</h2>
<table>
	<tr>
		<td><a>대출중인 도서관리</a></td>
		<td><a href="checkOut.ju">대출/반납</a></td>
	</tr>
</table>

<form name="loanList">
<table>
<thead>
	<tr>
		<td>구분</td>
		<th>도서코드</th>
		<th>도서명</th>
		<th>대출자</th>
		<th>대출일</th>
		<th>반납예정일</th>
		<th>연장횟수</th>
		<th>반납여부</th>
		<th>예약자 명단</th>
	</tr>
</thead>
<tbody>
	<c:if test="${empty list}">
		<tr>
			<td colspan="8" align="center">
				등록된 도서가 없습니다.
			</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${list}">
		<tr>
			<td><input type="checkbox" name="cb" id="cb" value="${dto.mem_id}"><input type="hidden" name="mem_id" value="${dto.mem_id}"></td>
			<td>${dto.book_idx}</td>
			<td>${dto.bk_subject}</td>
			<td>${dto.mem_name}</td>
			<td>${dto.lb_sd}</td>
			<td>${dto.lb_ed}</td>
			<td>${dto.lb_delay}</td>
			<td><input type="hidden" id="bk_return" value="${dto.lb_return}">
			<script>
			var re = ${dto.lb_return};
				switch(re){
				case 0 : 
					document.write('반납됨');
					break;
				case 1 :
					document.write('대출중');
					break;
				}
			</script>
			</td>
		</tr>
	</c:forEach>
</tbody>
</table>	
<input type="button" value="메일보내기" onclick="mailSend('${dto.mem_id}')">
</form>

<hr>
<h2>반납 도서 리스트</h2>
<table>
<thead>
	<tr>
		<th>도서코드</th>
		<th>도서명</th>
		<th>대출자</th>
		<th>대출일</th>
		<th>반납일</th>
		<th>연장횟수</th>
		<th>반납여부</th>
	</tr>
</thead>
<tbody>
	<c:if test="${empty list2}">
		<tr>
			<td colspan="7" align="center">
				대출 완료된 도서가 없습니다.
			</td>
		</tr>
	</c:if>
	<c:set var="sdList" value="${sdList}"></c:set>
	<c:set var="edList" value="${edList}"></c:set>
	<c:forEach var="dto" items="${list2}">
		<tr>
			<td>${dto.book_idx}<input type="hidden" name="mem_id" value="${dto.mem_id}"></td>
			<td>${dto.bk_subject}</td>
			<td>${dto.mem_name}</td>
			<td>${sdList}</td>
			<td>${edList}</td>
			<td>${dto.lb_delay}</td>
			<td><input type="hidden" id="bk_return" value="${dto.lb_return}">
			<script>
			var re = ${dto.lb_return};
				switch(re){
				case 0 : 
					document.write('반납됨');
					break;
				case 1 :
					document.write('대출중');
					break;
				}
			</script>
			</td>
		</tr>
	</c:forEach>
</tbody>
</table>
<script src="resource/js/jquery-3.2.1.min.js"></script>
<script>


function mailSend(i){
	
	var cb = $('input[name=cb]');
	var len = cb.length;
	var cbVal = '';
	var cbCnt = 0;
	var cbLast = '';      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
	var rowid = '';             //체크된 체크박스의 모든 value 값을 담는다
	var cnt = 0; 

	for(var i=0; i<len; i++){
		if(cb[i].checked == true){
			cbCnt++;        //체크된 체크박스의 개수
			cbLast = i;     //체크된 체크박스의 인덱스
		}
	} 

	for(var i=0; i<len; i++){

		if(cb[i].checked == true){  //체크가 되어있는 값 구분

			cbVal = cb[i].value;
		
			if(cbCnt == 1){                            //체크된 체크박스의 개수가 한 개 일때,
				rowid += cbVal;        //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
			}else{                                            //체크된 체크박스의 개수가 여러 개 일때,
				if(i == cbLast){                     //체크된 체크박스 중 마지막 체크박스일 때,
					rowid += cbVal;  //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
				}else{
					rowid += cbVal+",";	 //'value',의 형태 (뒤에 ,(콤마)가 붙게)         			
				}				
			}
			cnt++;
			cbRow = '';    //checkRow초기화.
		}
	}
	alert(rowid);
	/* var cb = document.getElementById('cb').value; */
	location.href="mailSend.ju?mem_id="+rowid; 
}
</script>
</body>
</html>
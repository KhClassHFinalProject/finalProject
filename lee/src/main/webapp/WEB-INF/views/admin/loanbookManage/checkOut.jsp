<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="resource/js/jquery-3.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#memberInfo{
	display: none;
}
</style>
</head>
<body id="okletsgo">
<h2>대출 페이지</h2>
<form name="check" action="memBarcode.ju">
<table>
	<tr>
		<td><input type="button" value="대출" onclick="checkOut()"></td>
	<tr>
	<tr>
		<td><input type="text" id="mem_idx"><input type="button" id="memberCheckGo" value="회원 검색"></td>
	</tr>
	<tr>
		<td><input type="button" value="반납" onclick="checkIn()"></td>
	</tr>
</table>
</form>



<div id="memberInfo">
<form name="loanCheck">
<h3>${dto.mem_name}님 회원정보</h3>
<table>
	<tr>
		<th>회원코드</th>
		<td colspan="3">${dto.mem_idx}
		<input type="hidden" name="memIdx" id="memIdx" value="${dto.mem_idx}"></td>
	</tr>
	<tr>
		<th>회원ID</th>
		<td>${dto.mem_id}</td>
		<th>성별</th>
		<td><span id="mem_birth"></span></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td>${dto.mem_hp}</td>
		<th>관심사</th>
		<td>${dto.mem_like}</td>
	</tr>
	<tr>
		<th>주소</th>
		<td colspan="3">${dto.mem_addr}</td>
	</tr>
</table>
<br>

도서 : <input type="text" id="bkIdx">
<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" id="search">도서정보검색</button>
</form>
	<h3>${dto.mem_name}님 대출중인 책</h3>
		<table>
		<thead>
			<tr>
				<th>도서코드</th>
				<th>도서명</th>
				<th>대출일</th>
				<th>반납예정일</th>
				<th>연장횟수</th>
				<th>반납여부</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list}">
				<tr>
					<td colspan="6" align="center">
						대출중인 도서가 없습니다.
					</td>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td>${dto.book_idx}</td>
					<td>${dto.bk_subject}</td>
					<td>${dto.lb_sd}</td>
					<td>${dto.lb_ed}</td>
					<td>${dto.lb_delay}</td>
					<td><span id="return"></span></td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
</div>

<div id="opop"></div>

<div class="container">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">책 정보</h4>
        </div>
        <div class="modal-body">
        
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div> 
<script src="resource/js/httpRequest.js"></script>
<script src="resource/js/jquery-3.2.1.min.js"></script>
<script>
var mem_idx_for_next=new Object();

$("#search").click(function() {
	var params = new Object();
	params.bk_idx = document.getElementById("bkIdx").value;
	params.mem_idx = document.getElementById("memIdx").value;
	$.ajax({
		type : "GET",
		url : "loanbookInfo.ju",
		data : params,
		success : function(args) {
			$(".modal-body").html(args);
		}
	});
});
		
	$(document).ready(function() {
		var birth = "${dto.mem_birth}";
		var str = birth.substring(7);
		switch (str) {
		case "1":
			document.getElementById('mem_birth').innerText = '남';
			break;
		case "2":
			document.getElementById('mem_birth').innerText = '여';
			break;
		}
		document.check.mem_idx.focus();
		$("#memberCheckGo").click(function() {
			
			var params = new Object();
			params.mem_idx = document.getElementById("mem_idx").value;
			$.ajax({
				type : "POST",
				url : "memberInfo.ju",
				data : params,
				success : function(args) {
					$("body").html(args);
					$("#memberInfo").css("display","block");
					mem_idx_for_next=args.mem_idx;
				}
			});
		});
	});
	
function checkIn() {
	location.href = "checkIn.ju";
}
	
function checkOut() {
	location.href = "checkOut.ju";
}
</script>
</body>
</html>
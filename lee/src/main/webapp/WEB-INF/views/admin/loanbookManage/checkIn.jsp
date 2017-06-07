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
<h2>반납 페이지</h2>
<form name="check" action="memBarcode.ju">
<table>
	<tr>
		<td><input type="button" value="대출" onclick="checkOut()"></td>
	<tr>
	<tr>
		<td>
		<input type="text" id="bk_idx">
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" id="search">도서정보검색</button>
		</td>
	</tr>
	<tr>
		<td><input type="button" value="반납" onclick="checkIn()"></td>
	</tr>
</table>
</form>




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
$("#search").click(function() {
	var params = new Object();
	params.bk_idx = document.getElementById("bk_idx").value;
	$.ajax({
		type : "GET",
		url : "loanbookInfo2.ju",
		data : params,
		success : function(args) {
			$(".modal-body").html(args);
		}
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
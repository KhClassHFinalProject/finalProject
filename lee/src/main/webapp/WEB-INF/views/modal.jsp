<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
//seat -> time
	function selectTime() {
		if(document.getElementById("rr_seatno").value){
			if ($("#time").css("display") == "none") {
				jQuery('#seat').hide();
				jQuery('#time').show();
			}
		}else{
			alert("자리를 선택해주세요!");
		}
	
	}

	$(document).ready(function() {
		/* 
		
		//make room1 table
		var rowVal=72;
		var colVal=5;
		var tabName="r1";
		
		for(var i=65-1 ; i<rowVal ; i++){
			var rowName=String.fromCharCode(i+1);
			var tableElement1="<tr><td class=" +rowName+ ">" +rowName+ "</td>";
			for(var j=0 ; j<colVal ; j++){
				tableElement1+="<td class='" +tabName+" "+rowName+"'>" +(j+1)+ "</td>";
			}
			tableElement1+="</tr>";
			$("#r1tab").append(tableElement1);
			$("."+rowName+":gt(0)").css("border", "1px solid #000000");
		}
		$("table td").css("padding", "15px");
						
		//make room2 table
		var rowVal=69;
		var colVal=8;
		var tabName="r2";
		
		for(var i=65-1 ; i<rowVal ; i++){
			var rowName=String.fromCharCode(i+1);
			var tableElement2="<tr><td class=" +rowName+ ">" +rowName+ "</td>";
			for(var j=0 ; j<colVal ; j++){
				tableElement2+="<td class='" +tabName+" "+rowName+"'>" +(j+1)+ "</td>";
			}
			tableElement2+="</tr>";
			$("#r2tab").append(tableElement2);
			$("."+rowName+":gt(0)").css("border", "1px solid #000000");
		}
		$("table td").css("padding", "15px");
		
		 */

		//room1 selected
		$("input:radio[id=r1]").click(function() {
			if ($("#r1div").css("display") == "none") {
				jQuery('#r2div').hide();
				jQuery('#r1div').show();
			}
		}

		);
		//room2 selected
		$("input:radio[id=r2]").click(function() {
			if ($("#r2div").css("display") == "none") {
				jQuery('#r1div').hide();
				jQuery('#r2div').show();
			}
		}

		);
		//select seat 
		$(".tab").on("click", function() {
			var seatno = document.getElementById("rr_seatno").value;
			var rowName = event.target.className;
			var colName = $(event.target).text();
			if (colName < 1) {
				return;
			}
			if(seatno){
				$("." + seatno).css("background-color", "#FFFFFF");				
			}
			$("." + rowName).css("background-color", "skyblue");
			$("#rr_seatno").val(rowName);
			seatno = document.getElementById("rr_seatno").value;
			alert(seatno);
			
			$("#rdiv2name").text("김홍길동길홍김");
			$("#rdiv2cate").text(document.rr_form.rr_cate.value);
			$("#rdiv2seatno").text(seatno);
		});
		
		//select time
		$(".timetab").on("click", function() {
			var rr_time = document.getElementById("rr_time").value;
			var rowName = event.target.className;
			var colName = $(event.target).text();
			if (colName < 1) {
				return;
			}
			if(rr_time){
				$("." + rr_time).css("background-color", "#FFFFFF");				
			}
			$("." + rowName).css("background-color", "skyblue");
			$("#rr_time").val(rowName);
			rr_time = document.getElementById("rr_time").value;
			alert(rr_time);
		});
	});
</script>
<style type="text/css">
/* 
rrbook
 */
 
.modal-body{
	width: 400px;
	height: 300px;
}

.rdiv{
	float: left;
	border: 2px solid blue;
}

.timetab,
.tab{
	width: 200px;
	height: 200px;
}


/* 
rrbook
 */
 
</style>
</head>
<body>
<form action="rrBook.ju" name="rr_form">
<input type="hidden" name="rr_seatno" id="rr_seatno">
<input type="hidden" name="rr_time" id="rr_time">
	<div class="container">
		<h2>열람실 예약</h2>
		<!-- Trigger the modal with a button -->
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
			data-target="#myModal">예약하기</button>
		<button type="button" class="btn btn-info btn-lg" onclick="javascript:window.open('rrCheck.jsp','rrCheck','width:400,height:300')">예약확인</button>
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content" id="seat">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<input type="radio" name="rr_cate" id="r1" checked value="1">room1
						<input type="radio" name="rr_cate" id="r2" value="2">room2
						<h4 class="modal-title" id="modal-title">열람실 예약하기</h4>
					</div>
					<div class="modal-body">
						<div id="r1div" class="rdiv">
							<table class="tab" id="r1tab" border="1">
							
								<c:forEach var="row" begin="1" step="1" end="8">`
									<tr>
										<c:forEach var="col" begin="1" step="1" end="5">
											<td class="r1${row }${col}">${row}${col }</td>
										</c:forEach>
									</tr>
								</c:forEach>
							</table>
						</div>
						<div id="r2div" style="display: none;" class="rdiv">
							<table class="tab" id="r2tab" border="1">
								<c:forEach var="row" begin="1" step="1" end="5">
									<tr>
										<c:forEach var="col" begin="1" step="1" end="8">
											<td class="r2${row }${col}">${row}${col }</td>
										</c:forEach>
									</tr>
								</c:forEach>
							</table>
						</div>
						<div class="rdiv2">
							이름 : <div id="rdiv2name"></div><br>
							열람실 : <div id="rdiv2cate"></div><br>
							좌석번호 : <div id="rdiv2seatno"></div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default"
							onclick="selectTime()">예약하기</button>
						<button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:location.reload();">취소하기</button>
					</div>
				</div>
				<div class="modal-content" id="time" style="display:none;">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" id="modal-title">열람실 예약하기(시간선택)</h4>
					</div>
					<div class="modal-body">
						<table class="timetab" id="timetab" border="1">
							<c:forEach var="time" begin="1" step="1" end="8">
								<tr><td class="time${time}">${time }</td></tr>
							</c:forEach>
						</table>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-default">예약하기</button>
						<button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:location.reload();">취소하기</button>
					</div>
				</div>
			</div>
		</div>

	</div>
</form>
</body>
</html>

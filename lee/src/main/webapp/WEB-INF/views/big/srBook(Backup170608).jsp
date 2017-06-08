<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
<script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
<link href="/lee/resources/mj/css/fullcalendar.min.css" rel="stylesheet">
<script src='/lee/resources/mj/js/moment.min.js'></script>
<script src='/lee/resources/mj/js/fullcalendar.min.js'></script>
<script type="text/javascript">
	$(document).ready(function() {
		var now = new Date();
		var nowDate = now.getFullYear();
		nowDate += (now.getMonth() + 1)>9?"-"+(now.getMonth() + 1):"-0"+(now.getMonth() + 1);
		nowDate += now.getDate()>9?"-"+now.getDate():"-0"+now.getDate();

		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
		        center: 'title',
		        right: 'month,agendaWeek,agendaDay'
			},
		    defaultDate: moment().format('YYYY-MM-DD'),
		    selectable: true,
		    selectHelper: true,
		    select: function(start) {
				var eventData = {start:start.format('YYYY-MM-DD')};
				var startDate = start.format("YYYY-MM-DD");
		        
            	$("#resdate").val(startDate); 
            	
				if(startDate.substr(8,2)<=nowDate.substr(8,2)||startDate.substr(8,2)>(parseInt(nowDate.substr(8,2))+14)){
					$(".btn-book").attr("disabled",true);
					jQuery('#roomStatus').hide();
					return;
				}
				
				$(".btn-book").attr("disabled",false);
		        $.ajax({
					url:"srCal.ju",
					type:"POST",
					data:eventData,
					dataType:"json",
					success:function(cal){
						jQuery('#roomStatus').show();
			           	for(var i = 1; i<=4;i++){
	            			for(var j = 1; j<=4;j++){
	            				$(".rt_check>.time"+i+">.room"+j).css("background","#0BD392");
								$(".rt_check>.time"+i+">.room"+j).text("empty");	
	            			}
	            		}
			           	
		            	for(var i = 0; i<cal.srarr.length;i++){
							var rn = cal.srarr[i].sr_roomno;
							var tn = cal.srarr[i].sr_time;
							$(".rt_check>.time"+tn+">.room"+rn).css("background","red");
							$(".rt_check>.time"+tn+">.room"+rn).text("using");
		            	}
		            	
		            }
		        })
				$('#calendar').fullCalendar('unselect');
			},
		    editable: true,
		    eventLimit: true, // allow "more" link when too many events
		    events: []
		});
		
		$("#room").click(function(){
			$("#srNext").attr("disabled",false);
		});
		
		$("#srNext").click(function(){
			jQuery("#s1div").hide();
			jQuery("#s2div").show();
			jQuery("#sf1div").hide();
			jQuery("#sf2div").show();
		});
		
		$("#srPrevious").click(function(){
			jQuery("#s2div").hide();
			jQuery("#s1div").show();
			jQuery("#sf2div").hide();
			jQuery("#sf1div").show();
		});
		
		$(".btn-book").click(function(){
			$(".modal-title").text(document.getElementById("resdate").value);
		});
		
		
		
		
		/**change color of selecting time td*/
		$("#timetable>tbody>tr>td>.sr_time").on("click",function() {
			$("#timetable>tbody>tr").removeClass("info");
			$("#time"+document.sr_form.sr_time.value).addClass("info");
			$("#srBooking").attr("disabled",false);
		});
		
		$(".room").click(function(){
			var roomno=$(event.target).attr("id");
			$(".room").css("background-color","#0BD392");
			$(this).css("background-color","#1AA4AC");
			$("#srNext").attr("disabled", false);
			$("#sr_roomno").val(roomno);
			alert("방 번호 : " + roomno);
		});
		
	});

</script>
<style type="text/css">
.modal-body {
	width: 350px;
	height: 400px;
}

.room{
	background-color: #0BD392; 
}

.roomtab{
	width: 300px;
	height: 200px;
	text-align: center;
	margin: 20px auto;
}
.rdiv {
	float: left;
}

.rdiv2 {
	float: right;
	width: 100px;
	height: 200px;
}

.tab {
	width: 200px;
	height: 200px;
}

.rt_check>tr>td{
	background-color: #0BD392;
}

.roompath{
	background-color: black;
}
</style>
</head>
<body>
	<div id='calendar' style></div>
	<div>
		<table class="table" border="1" id="roomStatus" style="display:none;">
			<thead>
				<tr>
					<th>&nbsp;</th>
					<th>1번방</th>
					<th>2번방</th>
					<th>3번방</th>
					<th>4번방</th>
				</tr>
			</thead>
			<tbody class="rt_check">
				<tr class="time1">
					<th>09~12시</th>
					<td class="room1">empty</td>
					<td class="room2">empty</td>
					<td class="room3">empty</td>
					<td class="room4">empty</td>
				</tr>
				<tr class="time2">
					<th>12~15시</th>
					<td class="room1">empty</td>
					<td class="room2">empty</td>
					<td class="room3">empty</td>
					<td class="room4">empty</td>
				</tr>
				<tr class="time3">
					<th>15~18시</th>
					<td class="room1">empty</td>
					<td class="room2">empty</td>
					<td class="room3">empty</td>
					<td class="room4">empty</td>
				</tr>
				<tr class="time4">
					<th>18~21시</th>
					<td class="room1">empty</td>
					<td class="room2">empty</td>
					<td class="room3">empty</td>
					<td class="room4">empty</td>
				</tr>
			</tbody>
		</table>
	</div>
	<form name="sr_form" action="srBook.ju" method="post">
		<div class="container">
		<input type="hidden" name="sr_roomno" id="sr_roomno">
		<!-- <input type="hidden" name="mem_idx" id="mem_idx" value="test"> -->
		<input type="hidden" name="resdate" id="resdate" value="">
			<!-- Trigger the modal with a button -->
			<button type="button" class="btn btn-info btn-lg btn-book" data-toggle="modal"
				data-target="#srBook" style="text-align:right;" disabled="disabled">예약하기</button>
			<!-- Modal -->
			<div class="modal fade" id="srBook" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content" id="roommodal">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title" id="modal-title">스터디룸 예약하기</h4>
						</div>
						<div class="modal-body">
							<div id="s1div" class="sdiv">
								<table class="roomtab">
									<tr>
										<td colspan="2" rowspan="7" class="room" id="1">행복</td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td colspan="4" rowspan="2" class="room" id="2">Happy</td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td colspan="4" class="roompath">25</td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td rowspan="4" class="roompath">32</td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td colspan="2" rowspan="7" class="room"id="4">행ㅋ벜</td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td colspan="4" class="roompath">57</td>
										<td></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td colspan="4" rowspan="2" class="room" id="3">해피</td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
								</table>
							</div>
							<div id="s2div" style="display: none;" class="sdiv">
								<div id="s2div_1">
									<table class="table table-hover" id="timetable">
										<tr id="time1">
											<td><input type="radio" name="sr_time" value="1" class="sr_time">09시 ~ 12시</td>
										</tr>
										<tr id="time2">
											<td><input type="radio" name="sr_time" value="2" class="sr_time">12시 ~ 15시</td>
										</tr>
										<tr id="time3">
											<td><input type="radio" name="sr_time" value="3" class="sr_time">15시 ~ 18시</td>
										</tr>
										<tr id="time4">
											<td><input type="radio" name="sr_time" value="4" class="sr_time">18시 ~ 21시</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<div id="sf1div">
								<button type="button" class="btn btn-success" id="srNext"
									disabled="disabled">시간 선택하기</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal" onclick="javascript:location.reload();">닫기</button>
							</div>
							<div id="sf2div" style="display:none;">
								<button type="button" class="btn btn-warning" id="srPrevious">이전으로</button>
								<button type="submit" class="btn btn-success" id="srBooking"
									disabled="disabled">예약하기</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal" onclick="javascript:location.reload();">닫기</button>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</form>
</body>
</html>

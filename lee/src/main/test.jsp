<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
	<style type="text/css">
	</style>
    
	<script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
	
	<!-- /* 캘린더 부분 시작*/ -->
	<link rel='stylesheet' href='/lee/resources/fullcalendar/fullcalendar.css' />
	<link href='/lee/resources/fullcalendar/scheduler.css' rel='stylesheet' />
	
	<script src='/lee/resources/fullcalendar/lib/moment.min.js'></script>
	<script src='/lee/resources/fullcalendar/scheduler.js'></script>
	<script src='/lee/resources/fullcalendar/fullcalendar.js'>
	
	</script>
	<!-- /* 캘린더 부분 끝*/ -->
	
	<script type="text/javascript">
	
$(document).ready(function() {
		
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
		var calendar = $('#calendar').fullCalendar({
			
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			
			selectable: true,
			selectHelper: true,
			select: function(start, end, allDay) {
				
				var title = prompt('일정을 입력하세요.');
				if (title) {
				
					calendar.fullCalendar('renderEvent',
						{
							title: title,
							start: start,
							end: end,
							allDay: allDay
						},
						true // make the event "stick"
					);
				}
				calendar.fullCalendar('unselect');
				
			},
			editable: true,
			events: [
				{
					title: '01 All Day Event',
					start: new Date(y, m, 1)
				},
				{
					title: '02 Long Event',
					start: new Date(y, m, d-5),
					end: new Date(y, m, d-2)
				},
				{
					id: 999,
					title: '03 Repeating Event',
					start: new Date(y, m, d-3, 16, 0),
					allDay: false
				},
				{
					id: 999,
					title: '04 Repeating Event',
					start: new Date(y, m, d+4, 16, 0),
					allDay: false
				},
				{
					title: '05 Meeting',
					start: new Date(y, m, d, 10, 30),
					allDay: false
				},
				{
					title: '06 Lunch',
					start: new Date(y, m, d, 12, 0),
					end: new Date(y, m, d, 14, 0),
					allDay: false
				},
				{
					title: '07 Birthday Party',
					start: new Date(y, m, d+1, 19, 0),
					end: new Date(y, m, d+1, 22, 30),
					allDay: false // 주간의 나타남, true 나타나지않음
				},
				{
					title: '08 Click for Google',
					start: new Date(y, m, 28),
					end: new Date(y, m, 29),
					url: 'http://google.com/'
				}
			]
		});
		
		
	});
</script>

<style type='text/css'>

	body {
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		}

	#calendar {
		width: 900px;
		margin: 0 auto;
		}

</style>
</head>
<body>
<div id='calendar'></div>
</body>
</html>
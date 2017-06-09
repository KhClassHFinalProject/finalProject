<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
<script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
<link href='/lee/resources/mj/css/fullcalendar.min.css' rel='stylesheet' />
<script src='/lee/resources/mj/js/moment.min.js'></script>
<script src='/lee/resources/mj/js/fullcalendar.min.js'></script>
<script>
	$(document).ready(function() {
		
		$('#calendar').fullCalendar({
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,agendaWeek,agendaDay'
			},
			defaultDate : moment().format('YYYY-MM-DD'),
			navLinks : true, // can click day/week names to navigate views
			selectable : true,
			selectHelper : true,
			select : function(start, end) {
				var title = prompt('휴일 이름을 지정해보세yong');
				console.log('뿅');
				var eventData = {
					title : title,
					start : start.format(),
					end : end.format()
				};
				$.ajax({
					url : "calex.ju",
					type : "POST",
					data : eventData,
					success : function() {
						var startdate = start.format();
						console.log(startdate);
						alert("yong");
					}
				})
				$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
				$('#calendar').fullCalendar('unselect');
			},
			editable : true,
			eventLimit : true, // allow "more" link when too many events
			events : []
		});
		
	});
</script>
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}
</style>
</head>
<body>

	<div id='calendar'></div>

</body>
</html>
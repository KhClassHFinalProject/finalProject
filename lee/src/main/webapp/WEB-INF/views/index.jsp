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
	<script type="text/javascript">
	</script>
	
	<link rel="stylesheet" href="/lee/resources/index/index.css">

  <script>
  $(function(){
	  $("#search-input").focus( function() {
		  
	      $("#search-status").css("display","none");
	  });
	  $("#search-input").blur( function() {
		  
	      $("#search-status").css("display","inline");
	  });
  });
  </script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  
  <style>
  body {
	font-family: Arial, Helvetica, sans-serif;
}
table {
	font-size: 1em;
}
.ui-draggable, .ui-droppable {
	background-position: top;
}
/* 캘린더관련 css */
  
  </style>
</head>
<body>
<%@include file="header.jsp" %>
<!-- 검색 컨테이너 -->
<div class="jumbotron">
 <img id="imgg" src="/lee/resources/index/main.png" >
 <div class="container text-center">
		 <div id="searchbar" style="position: relative 50%;">   
			    <div class="input-group input-group-lg">
				 	 <span class="input-group-addon" id="sizing-addon1">
					 	 <span class="glyphicon glyphicon-book" aria-hidden="true"></span>
					 	 </span>
				 	 <input id="search-input" type="text" class="form-control" placeholder="Username" aria-describedby="sizing-addon1">
				 	 <span id="search-statusBar">
				 	 	<span id="search-status" class="glyphicon glyphicon-search btn-lg"></span>
				 	 </span> 
				</div> 
		 </div>
 </div>
</div>
  
  <!-- 첫번째줄 -->
<div class="container-fluid bg-3 text-center" style="margin-top: 10%;">    
  <!-- <h3>Some of my Work</h3><br> -->
  
  <div class="row">
  
    <div id="notice-bbs" class="col-sm-9" style="height:400px;">
      <p>공지사항</p>
      <img src="/lee/resources/index/bbs.png" class="img-responsive" style="width:100%; height:100%;" alt="Image">
    </div>
    
    <div id="calen" class="col-sm-3 sidenav" style="height:400px; ">
      <p>캘린더</p>
      <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
      
      <script>
      
     var datedata;
  	
      
        $( function() {
        	
   		 $( "#datepicker" ).datepicker({
   			monthNames: [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" ],
   			onSelect: function(dateText) {
   				
			   				var day_s = dateText.split("/");
			   				var day = parseInt(day_s[1])-1;
			   				document.getElementById("datepickerdetail").innerText =day_s[2]+"년"+day_s[0]+"월"+day_s[1]+"일\n";
			   				
			   				for(var k = 0 ; k < datedata.length ; k++){
			   					
			   					var bb = datedata[k].solar_Date.split('-');
				            	var dd = parseInt(bb[2])-1; 
				            	if(dd==day){
				            		if(datedata[k].memo){
				            			document.getElementById("datepickerdetail").innerText = document.getElementById("datepickerdetail").innerText +"\n"+ datedata[k].memo;
				            		}else{
					   					
					   					document.getElementById("datepickerdetail").innerText =day_s[2]+"년"+day_s[0]+"월"+day_s[1]+"일\n일정이 없습니다.";
					   					return false;
					   				}
				            		
				            	}
			   				}
			   				
			   				
			   				
   			  			}
   		 });
   		 
   		$( "#datepicker" ).on("DOMSubtreeModified",function() {
   					for(var k = 0 ; k < datedata.length ; k++){
	   					
   						if(datedata[k].memo){
			            		
			            		var bb = datedata[k].solar_Date.split('-');
				            	var dd = parseInt(bb[2])-1; 
				            	var change = document.getElementsByClassName('ui-datepicker-calendar')[0].getElementsByClassName('ui-state-default')[dd];
				            	$(change).css('border-color','red');
			            		
			            	}else{
			            		var change = document.getElementsByClassName('ui-datepicker-calendar')[0].getElementsByClassName('ui-state-default')[k];
				            	$(change).css('border-color','');
			            	}
		            }
   					return;
   					
   		});
   		
   		/*  $("table").on('click','.ui-state-hover',function(){
   			 alert('날짜 버튼 눌림');
	   				for(var i = 0 ; i < datedata.length ; i++){
		            	if(datedata[i].memo){
		            	var change = document.getElementsByClassName('ui-datepicker-calendar')[0].getElementsByClassName('ui-state-default')[i];
		            	$(change).css('border-color','red');
		            	}
		            }
   			 
   		 }); */
   		 
   		 $(document).on('click','.ui-datepicker-prev, .ui-datepicker-next',function(){
   				
	   	        	
	   	        	var yr = document.getElementsByClassName('ui-datepicker-year')[0].innerText;
	   	        	var mon = document.getElementsByClassName('ui-datepicker-month')[0].innerText;
	   	        	
	   	        	document.getElementById("datepickerdetail").innerHTML = "";
	   	        	console.log(yr+'/'+mon);
	   	        	$.ajax({
	   			        url : "getHoliday.ju",
	   			        type: "get",
	   			        data : {"yr":yr,"mon":mon},
	   			        dataType:"json",
	   			        
	   			        success : function(responseData){
	   			        	$("#ajax").remove();
	   			            
	   			            datedata = responseData.hdto;
	   			            
	   			            if(!datedata){
	   			            	alert("데이터를 받지 못함");
	   			            }else{
	   			            	
	   				            for(var i = 0 ; i < datedata.length ; i++){
	   				            	
	   				            	if(datedata[i].memo){
	   				            		
	   				            		var bb = datedata[i].solar_Date.split('-');
		   				            	var dd = parseInt(bb[2])-1; 
		   				            	var change = document.getElementsByClassName('ui-datepicker-calendar')[0].getElementsByClassName('ui-state-default')[dd];
		   				            	$(change).css('border-color','red');
	   				            		
	   				            	}else{
	   				            		var change = document.getElementsByClassName('ui-datepicker-calendar')[0].getElementsByClassName('ui-state-default')[i];
		   				            	$(change).css('border-color','');
	   				            	}
	   				            }
	   			            }
	   			           	
	   			        },
	   			        error: function(request,status,error){
	   			        	
	   			        	 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
	   			        }
	   		   		 });
   	        
   		 });
   		 
   		
   		
        });
        
        
        $("body").ready(function(){
        	
        	var yr = document.getElementsByClassName('ui-datepicker-year')[0].innerText;
        	var mon = document.getElementsByClassName('ui-datepicker-month')[0].innerText;
        	
        	console.log(yr+'/'+mon);
        	$.ajax({
		        url : "getHoliday.ju",
		        type: "get",
		        data : {"yr":yr,"mon":mon},
		        dataType:"json",
		        
		        success : function(responseData){
		            
		        	$("#ajax").remove();
		            datedata = responseData.hdto;
		            
		            if(!datedata){
		            	alert("데이터를 받지 못함");
		            }else{
			            for(var i = 0 ; i < datedata.length ; i++){
			            	if(datedata[i].memo){
				            		
				            		var bb = datedata[i].solar_Date.split('-');
   				            	var dd = parseInt(bb[2])-1; 
   				            	var change = document.getElementsByClassName('ui-datepicker-calendar')[0].getElementsByClassName('ui-state-default')[dd];
   				            	$(change).css('border-color','red');
				            		
				            	}
			            }
		            }
		           	
		        },
		        error: function(request,status,error){
		        	
		        	 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        	 
		        }
	   		 });
        	
        	
        	
        });
   
        </script>
        
      <div id="datepicker"></div>
      <p>세부일정</p>
      <div id="datepickerdetail" style="margin:auto;border:1px solid; border-radius: 10%; width:250px;height:150px;font-size:large;">
     
     
      
      </div>
    </div>
  </div>
</div><br>


<!-- 두번째줄 -->
<div id="allbutton" class="container-fluid bg-3 text-center">

  <div class="row" style="width:100%;">
  <div class="indexbt1row">
	    <div class="col-sm-3">
	      <p>마이페이지</p>
	      <a href="changeMe.ju">
	      <img src="/lee/resources/index/button.gif" class="img-responsive" style="width:100%" alt="Image">
	      </a>
	    </div>
	    <div class="col-sm-3"> 
	      <p>버튼2</p>
	      <img src="/lee/resources/index/button.gif" class="img-responsive" style="width:100%" alt="Image">
	    </div>
   </div>
   <div class="indexbt2row">
	    <div class="col-sm-3"> 
	      <p>버튼3</p>
	      <img src="/lee/resources/index/button.gif" class="img-responsive" style="width:100%" alt="Image">
	    </div>
	    <div class="col-sm-3">
	      <p>버튼4</p>
	      <img src="/lee/resources/index/button.gif" class="img-responsive" style="width:100%" alt="Image">
	    </div>
	</div>
  </div>
</div><br><br>

<!-- <footer class="container-fluid text-center">
  
</footer> -->
<%@include file="footer.jsp" %>
</body>

</html>
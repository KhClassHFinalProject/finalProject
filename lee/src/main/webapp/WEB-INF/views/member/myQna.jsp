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
	<script type="text/javascript"
	src="/lee/resources/sideMenu/sideScript.js"></script>
	
<link rel="stylesheet" href="/lee/resources/sideMenu/css/sideStyle.css">
<style type="text/css">
	.btn-primary{
		background-color:#0BD392;
		border-color: #09BD8D;
	}
	.btn-primary:HOVER{
		background-color:#1AA4AC;
		border-color: #3CDBDE;
	}
	hr{
		margin:0px;
	}
	
	h4{
		text-align: center;
	}
	p{
		margin-left: 30px;
	}
	</style>

<script type="text/javascript">
	
	
	</script>
<style>
@media ( min-width :769px) {
	
	#changeForm{
		width: 100%;
		
	}
	#submenulabel{
	width: 675px;
	height: 134px;
	}
	
	
}
@media ( max-width :768px) {
	#cssmenu {
		width: 100%;
	}
	
	#changeForm{
		width: 100%;
		
	}
	#submenulabel{
	width:100%;
	height: 134px;
	margin-bottom:50px;
	}
	
	
}
</style>
</head>
<body>
	<%@include file="../header.jsp"%>
	<div class="row">
	
		<%@include file="sideMenu.jsp"%>

		<div class="col-md-9" id="changeMeForm">
			<div id="changeForm"
				style="padding: 0; background-color: ">
						
				<!-- 컨텐츠 입력 -->
					<div id="submenulabel" style="width:675px; height:134px;  background-image:url('/lee/resources/member/img/sul.png')">
					<div style="width:100%; height:100%; margin:0px; padding:50px; background-color: rgba(26, 164, 172, 0.5 );">
						<h2 style="color:white;">나의 문의</h2>
					</div>
				</div>
				<!-- 컨텐츠 실영역 -->
				<div>
				<script>
				    $(document).ready(function(){
				
				        $("#report tr:odd").addClass("odd");
				        $("#report tr:not(.odd)").hide(); 
				        $("#report tr:first-child").show('slow'); //열머리글 보여주기
				
				        $("#report tr.odd").click(function(){
				            $(this).next("tr").toggle();
				            $(this).find(".arrow").toggleClass("up");
				
				        });
				       
				
				    });

				</script>
				<table class="table table-hover" id="report">
					<thead>
						<tr>
						 	<th style="width:10%">번호</th>
						 	<th style="width:40%">제목</th>
						 	<th style="width:15%">공개여부</th>
						 	<th style="width:20%">작성날짜</th>
						 	<th style="width:15%">답변여부</th>
						 	
						</tr>
					</thead>
					<tbody>
					 <tr>
					 	<td>1</td>
					 	<td>제목입니다</td>
					 	<td>비공개</td>
					 	<td>2017/06/03</td>
					 	<td>미답변</td>
					 </tr>
					 <tr>
			            <td colspan="5">
			              
			            <hr>
	           			    <h4>내용</h4>
           			    <hr>
			                <p>내용입니당~~~<br>
			                하하하<br>
			                호혽뎌</p>
			            <hr>
	           			    <h4>답변</h4>
	           			<hr>
	           			    <p>
	           			    답변이 없습니다.
	           			    </p>
           			    </td>
        			</tr>
					 <tr class="success">
					 	<td>2</td>
					 	<td>제목입니다2</td>
					 	<td>공개</td>
					 	<td>2017/06/03</td>
					 	<td>답변</td>
					 </tr>
					 <tr>
			            <td colspan="5">
			              
			            <hr>
	           			    <h4>내용</h4>
           			    <hr>
			                <p>내용입니당~~~<br>
			                하하하<br>
			                호혽뎌</p>
			            <hr>
	           			    <h4>답변</h4>
	           			<hr>
	           			    <p>
	           			    죄송합니당...
	           			    </p>
           			    </td>
        			</tr>
        			 <tr class="success">
					 	<td>2</td>
					 	<td>제목입니다2</td>
					 	<td>공개</td>
					 	<td>2017/06/03</td>
					 	<td>답변</td>
					 </tr>
					 <tr>
			            <td colspan="5">
			              
			            <hr>
	           			    <h4>내용</h4>
           			    <hr>
			                <p>내용입니당~~~<br>
			                하하하<br>
			                호혽뎌</p>
			            <hr>
	           			    <h4>답변</h4>
	           			<hr>
	           			    <p>
	           			    죄송합니당...
	           			    </p>
           			    </td>
        			</tr>
        			 <tr>
					 	<td>2</td>
					 	<td>제목입니다2</td>
					 	<td>공개</td>
					 	<td>2017/06/03</td>
					 	<td>미답변</td>
					 </tr>
					 <tr>
			            <td colspan="5">
			              
			            <hr>
	           			    <h4>내용</h4>
           			    <hr>
			                <p>내용입니당~~~<br>
			                하하하<br>
			                호혽뎌</p>
			            <hr>
	           			    <h4>답변</h4>
	           			<hr>
	           			    <p>
	           			    답변이 없습니다.
	           			    </p>
           			    </td>
        			</tr>
					 </tbody>
				</table>
				
				
				</div>
						

		</div>
	</div>
	<div class="col-md-12">
	<%@include file="../footer.jsp"%>
	</div>

</body>
</html>
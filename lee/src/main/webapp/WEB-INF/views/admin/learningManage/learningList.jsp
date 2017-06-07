<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="resource/js/jquery-3.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container" id="modalForm">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">수강신청 현황</h4>
        </div>
        <div class="modal-body">
        <form name="registMember">
    		<table id="memberData">
    			<thead>
    				<tr>
    					<th>이름</th>
    					<th>생년월일</th>
    					<th>ID</th>
    					<th>연락처</th>
    				</tr>
    			</thead>
    		</table>      	
		</form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>

<h2>수업 리스트</h2>
<ul>
	<li><a href="learningList.ju">수업 리스트</a></li>
	<li><a href="learningTeacherList.ju">강사 관리</a></li>
</ul>
<form name="classList" action="learningClassAdd.ju" method="get">
<table>
<thead>
	<tr>
		<th>수업명</th>
		<th>강사이름</th>
		<th>강의실</th>
		<th>개강날짜</th>
		<th>종강날짜</th>
		<th>시작시간</th>
		<th>끝나는시간</th>
		<th>수강인원</th>
		<th>수강인원 명단</th>
	</tr>
</thead>
<tbody>
	<c:if test="${empty list}">
		<tr>
			<td colspan="9" align="center">
				등록된 강사가 없습니다.
			</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${list}">
		<tr>
			<td>${dto.sj_name}</td>
			<td>${dto.tc_name}</td>
			<td>${dto.sj_loc}</td>
			<td>${dto.sj_sd}</td>
			<td>${dto.sj_ed}</td>
			<td>${dto.sj_st}</td>
			<td>${dto.sj_et}</td>
			<td>${dto.sj_num} / ${dto.sj_max}</td>
			<td><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" onclick="modalOpen('${dto.sj_idx}')">명단확인</button></td>
		</tr>
	</c:forEach>
</tbody>
</table>
<input type="button" value="수업 등록" onclick="classAdd()">
</form>
<hr>
<script src="resource/js/httpRequest.js"></script>
<script src="resource/js/jquery-3.2.1.min.js"></script>
<script>
function classAdd(){
	location.href="learningClassAdd.ju";
}

function modalOpen(idx){
	var subjectIdx = idx;
	var params = 'sj_idx='+subjectIdx;
	sendRequest('memberCheck.ju',params,showResult,'POST');
}

function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==201){
			var data= JSON.parse(XHR.responseText);
			var list=data.list;
			if(tbodyID=document.getElementById('memberInfo'))tbodyID.remove();
			var tbodyID=document.createElement('tbody');
			tbodyID.setAttribute('id','memberInfo');
			for(var i=0;i<list.length;i++){
				var tableID=document.getElementById('memberData');
				var tr=document.createElement('tr');
				var tdOne=document.createElement('td');
				var tdTwo=document.createElement('td');
				var tdThree=document.createElement('td');
				var tdFour=document.createElement('td');
				var spanOne=document.createElement('span');
				var spanTwo=document.createElement('span');
				var spanThree=document.createElement('span');
				var spanFour=document.createElement('span');
				spanOne.setAttribute("id","mem_name"+i);
				spanTwo.setAttribute("id","mem_birth"+i);
				spanThree.setAttribute("id","mem_id"+i);
				spanFour.setAttribute("id","mem_hp"+i);
				tdOne.appendChild(spanOne);
				tdTwo.appendChild(spanTwo);
				tdThree.appendChild(spanThree);
				tdFour.appendChild(spanFour);
				tr.appendChild(tdOne);
				tr.appendChild(tdTwo);
				tr.appendChild(tdThree);
				tr.appendChild(tdFour);
				tbodyID.appendChild(tr);
				tableID.appendChild(tbodyID);
				document.getElementById('mem_name'+i).innerText=data.list[i].mem_name;
				document.getElementById('mem_birth'+i).innerText=data.list[i].mem_birth;
				document.getElementById('mem_id'+i).innerText=data.list[i].mem_id;
				document.getElementById('mem_hp'+i).innerText=data.list[i].mem_hp;
			}
		}	
	}
}
</script>
</body>
</html>
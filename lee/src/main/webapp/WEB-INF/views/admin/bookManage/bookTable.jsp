<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<table border="1" cellspacing="0">
<thead>
	<tr>
		<th>도서코드</th>
		<th>도서명</th>
		<th>저자명</th>
		<th>출판사</th>
		<th>출간일</th>
		<th>파손상태</th>
	</tr>
</thead>
<tbody>
	<c:if test="${empty list}">
			<tr>
				<td colspan="6" align="center">
					등록된 도서가 없습니다.
				</td>
			</tr>
	</c:if>
	<c:forEach var="dto" items="${list}">
		<tr>
			<td>${dto.bk_idx}</td>
			<td><a href="bookInfo.ju?bk_idx=${dto.bk_idx}">${dto.bk_subject}</a></td>
			<td>${dto.bk_writer}</td>
			<td>${dto.bk_publisher}</td>
			<td>${dto.bk_writedate}</td>
			<td class="bk_break">${dto.bk_break}
			
			</td>
		</tr>
	</c:forEach>
</tbody>
<tfoot>
	<tr>
		<td colspan="6">
		<nav>
		  <ul class="pagination">
		    <li>
		      <a href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    ${pageStr}
		    <li>
		      <a href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
	</td>
	</tr>
</tfoot>
</table>
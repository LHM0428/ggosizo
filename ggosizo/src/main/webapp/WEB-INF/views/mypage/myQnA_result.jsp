<%@page import="com.ggosizo.domain.jm.QnaVO"%>
<%@page import="com.ggosizo.domain.yj.PageMaker"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tr><th width='8%'>번호</th><th width='55%'>제목</th>
<th style='width: 12%'>작성자</th><th style='width: 12%'>작성일</th>
<th style='width: 13%'>조회수</th></tr>    
<% 
	
	List<QnaVO> list = (List<QnaVO>) request.getAttribute("list");
	for(int i=0; i<list.size(); i++){
			QnaVO vo = list.get(i);
			String table="";
			
		 	table += "<tr><td>"+vo.getQna_no()+"</td>"
			+"<td><a href='/mypage/searchMyQnA?no="+vo.getQna_no()+"'>"
			+vo.getQna_title()+"[ "+vo.getQna_replycnt()+" ]"
			+"<td>"+vo.getQna_writer()+"</td>"
			+"<td>"+(vo.getQna_regdate().getYear()-100)+"-"+(vo.getQna_regdate().getMonth()+1)
			+"-"+vo.getQna_regdate().getDate()+"</td>"
			+"<td>"+vo.getQna_viewcnt()+"</td></tr>";
			out.print(table);
		}
	out.print("@paging");
%> 
<c:if test="${pageMaker.prev}">
		<li><a href="javascript:myQnA('${u_id}',${(pageMaker.startPage-1)})"
		class="w3-hover-theme">&laquo;</a></li>
</c:if>
	<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
		<li
			<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
			<a href="javascript:myQnA('${u_id}',${idx})" class="w3-hover-theme">${idx}</a>
		</li>
	</c:forEach>
<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		<li><a href="javascript:myQnA('${u_id}',${(pageMaker.endPage+1)})"
		class="w3-hover-theme">&raquo;</a></li>
</c:if>

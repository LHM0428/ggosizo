<%@page import="com.ggosizo.domain.yj.PageMaker"%>
<%@page import="com.ggosizo.domain.DateCourse"%>
<%@page import="com.ggosizo.domain.ss.DateCourseDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tr><th width='8%'>번호</th><th width='55%'>제목</th>
<th style='width: 12%'>작성자</th><th style='width: 12%'>작성일</th>
<th style='width: 13%'>조회수</th></tr>    
<% 
	
	List<Object> list = (List<Object>) request.getAttribute("list");
	for(int i=0; i<list.size(); i++){
		String[] dtArr = list.get(i).getClass().getTypeName().split("\\.");
		String dtClass = dtArr[dtArr.length-1];
		String table="";
		if(dtClass.equals("DateCourseDTO")){
			DateCourseDTO dto = ((DateCourseDTO)list.get(i));
		 	table += "<tr><td>"+dto.getCourse_no()+"</td>"
			+"<td><a href='/userCourse/read?&no="+dto.getCourse_no()+"'>"
			+dto.getCourse_title()+"[ "+dto.getCourse_replycnt()+" ]";
			if(dto.getCourse_thema()!=null)
			{table+=" 테마 : "+dto.getCourse_thema()+"</a></td>";}
			table+="<td>"+dto.getCourse_writer()+"</td>"
			+"<td>"+(dto.getCourse_regdate().getYear()-100)+"-"+(dto.getCourse_regdate().getMonth()+1)
			+"-"+dto.getCourse_regdate().getDate()+"</td>"
			+"<td>"+dto.getCourse_viewcnt()+"</td></tr>";
		}else{
			DateCourse dc = (DateCourse)list.get(i);
			table += "<tr><td>"+dc.getNo()+"</td><td>"
			+"<a href='/mypage/searchLikeCourse?keyword="+dc.getName()+"&no="+dc.getNo()+"'>"
			+dc.getName()+"[ "+ dc.getReplycnt()+" ]</a></td>"
			+"<td>"+dc.getWriter()+"</td>"
			+"<td>"+(dc.getRegdate().getYear()-100)+"-"+(dc.getRegdate().getMonth()+1)+"-"
			+dc.getRegdate().getDate()+"</td>"
			+"<td>"+dc.getViewcnt()+"</td></tr>";
		}
		out.print(table+"");
	}
	out.print("@paging");
%> 
<c:if test="${pageMaker.prev}">
		<li><a href="javascript:myLike('${u_id}',${(pageMaker.startPage-1)})"
		class="w3-hover-theme">&laquo;</a></li>
</c:if>
	<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
		<li
			<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
			<a href="javascript:myLike('${u_id}',${idx})" class="w3-hover-theme">${idx}</a>
		</li>
	</c:forEach>
<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		<li><a href="javascript:myLike('${u_id}',${(pageMaker.endPage+1)})"
		class="w3-hover-theme">&raquo;</a></li>
</c:if>

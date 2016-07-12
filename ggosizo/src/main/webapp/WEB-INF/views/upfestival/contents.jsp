<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<center>
		<table width="65%" cellpadding="10">
			<tr bgcolor="darkgray">
				<th width="25%"><font color="white">행사</font></th>
				<th width="75%"><font color="white">contents</font></th>
			</tr>
			
			<c:forEach var="festival" items="${list }" varStatus="stat">
 			  <tr bgcolor="white">
    			 <td><img src=${festival.img} style="height:100px; width:200px"></td>
    			 <td><a href="festival.do?action=select&name=${festival.name}">${festival.name}<br>${festival.addr}</a></td>
 	 		 </tr>
			</c:forEach>
			
		</table>
		<c:forEach var="i" begin="1" end="${totalPage }" step="1">
		[<a href="festival.do?page=${ i}">${ i}</a>]
		</c:forEach>
	</center>

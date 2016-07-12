<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- response4.jsp --%>
 
 <%
     String delimiter="sido"; 
     List<String> list = (List<String>)request.getAttribute("sido");
 
     if(list==null){
    	 list = (List<String>)request.getAttribute("gugun");
    	 delimiter="criGugun";
     }
     
     if(list==null){
    	 list = (List<String>)request.getAttribute("dong");
    	 delimiter="criDong";
     }
     
     out.print("<select name="+delimiter+"><option value='==선택=='>==선택==</option>");
     for(int i=0; i<list.size(); i++){
    	 out.print("<option value='"+list.get(i)+"'>"+list.get(i)+"</option>");
     }
     out.print("</select>");
 %>
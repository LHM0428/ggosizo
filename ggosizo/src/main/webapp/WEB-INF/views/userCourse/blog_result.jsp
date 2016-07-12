<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@page import="java.util.*"
 %><%request.setCharacterEncoding("UTF-8");
 List<HashMap<String, String>> list =(List<HashMap<String, String>>) request.getAttribute("list");
%><%
HashMap<String, String> resultMap = new HashMap<String, String>();
String query = (String) request.getAttribute("query");
query = query.replace("-", " ");
String navbar = "<li><a class='tablink'  onclick=\"openCity(event,'"+query+"')\">"+query+"</a></li>";
String searchResult ="";
searchResult +="<div id='"+query+"' class='w3-border w3-white tab'>";
 //title, link, description, bloggername, bloggerlink
 for(int i=0; i<list.size(); i++){
	 HashMap<String, String> map = list.get(i);
	 String title = map.get("title");
	 String link = map.get("link");
	 String description = map.get("description");
	 String bloggername = map.get("bloggername");
	 String bloggerlink = map.get("bloggerlink");
	 System.out.println(title);
	searchResult+="<div class='w3-container'><h4><b>"+title+"</b></h4>";
	searchResult+="<a href='"+bloggerlink+"' class='w3-opacity'>"+bloggername+"</a></div>";
	searchResult+="<div class='w3-container'><p>"+description+"</p>"+
	 			"<div class='w3-row'><div class='w3-col m8 s12'>"+
       			"<br><button class='w3-btn w3-white w3-border w3-border-blue w3-hover-blue'"+
   				"onclick='javascript:void(window.open(\""+link+"\"))'>"+
   				"READ MORE »</button><br></div></div></div>";
 }
searchResult +="</div>";
resultMap.put("navbar", navbar);
resultMap.put("searchResult", searchResult);
%>navbar|<%=resultMap.get("navbar")%>|searchResult|<%=resultMap.get("searchResult")%>
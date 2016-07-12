<%@page import="java.util.List"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
		String delimiter="u_addr1";
		List<String> list = (List<String>)request.getAttribute("sido");
		String selectGugun = (String)request.getAttribute("selectGugun");
		String selectSido = (String)request.getAttribute("selectSido");
		System.out.println("selectGugun: " +selectGugun+" selectSido : "+selectSido);
		if(list==null){
			list = (List<String>)request.getAttribute("gugun");
			delimiter="u_addr2";
		}
		out.print("<select class='w3-btn w3-theme w3-hover-white w3-round-large' name="+delimiter+"><option value='선택'>선택</option>");
		for(int i=0; i <list.size();i++){
			if(selectGugun!=null && selectGugun.equals(list.get(i))){
				out.print("<option value='"+list.get(i)+"' selected>"+list.get(i)+"</option>");
			}else if(selectSido!=null && selectSido.equals(list.get(i))){
				out.print("<option value='"+list.get(i)+"' selected>"+list.get(i)+"</option>");
			}else{
				out.print("<option value='"+list.get(i)+"'>"+list.get(i)+"</option>");
			}
		}
		out.print("</select>");
%>
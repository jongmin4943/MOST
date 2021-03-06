<%@page import="org.json.JSONObject"%>
<%@page import="api.server.NaverAPIreader"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String movieNm = request.getParameter("name");
JSONObject jObj = NaverAPIreader.getInfos(movieNm);

out.print(jObj);
%>
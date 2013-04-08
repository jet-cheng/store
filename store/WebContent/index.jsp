<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/common/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${ctxPath}/css/head.css" rel="stylesheet" type="text/css">
<link href="${ctxPath}/css/main.css" rel="stylesheet" type="text/css">
<title>小神 商城</title>
</head>
<body>
	<jsp:include page="${basePath}/head.jsp"/>
	
	<%
		Map<Integer,String> map = new HashMap<Integer,String>();
		map.put(1,"123");
	
		//Map<Long,String> map = new HashMap<Long,String>();
	 	//map.put(1L, "a");
	 	//map.put(2L, "b");
	 	
	 	//List<String> list = new ArrayList<String>();
	 	//list.add("yes");
	 	
	 	request.setAttribute("map", map);
	%>
	<c:out value="${map[1]}"/>
</body>
</html>
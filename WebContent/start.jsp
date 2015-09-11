<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Seriousity</title>
</head>
<% 
	String mainUrl = "game/hello.jsp";
	if(request.getAttribute("mainUrl") != null && ((String)request.getAttribute("mainUrl")).length() > 0)
	{
		mainUrl = (String)request.getAttribute("mainUrl");
	}

	session.setAttribute("aaa", "session test");
	String aaa = (String)(session.getAttribute("aaa"));
	System.out.println(aaa);      
%>

<body>
		<jsp:include page="top.jsp" flush="true"/>				
		<jsp:include page="<%=mainUrl%>" flush="true"/>
		<%-- <jsp:include page="bottom.jsp" flush="true"/> --%>
</body>
</html>
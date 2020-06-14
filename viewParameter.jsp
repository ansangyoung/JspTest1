<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %>
<%
	// 요청 파라미터의 캐릭터 인코딩을 utf-8로 지정.
	request.setCharacterEncoding("utf-8");
%>
<html>
<head>
	<title>요청 파라미터 출력</title>
</head>

<body>
	name 파라미터 = <%=request.getParameter("name") %><br>
	address 파라미터 = <%=request.getParameter("address") %><br><br>
<%
	String[] values = request.getParameterValues("pet");
	if(values != null) {
		for(int i = 0; i < values.length; i++) {
%>
			<%=values[i] %><br>
<%
		}
	}
%>
	<br>
<%
	Enumeration paramEnum = request.getParameterNames();
	while(paramEnum.hasMoreElements()) {
		String name = (String)paramEnum.nextElement();
%>
		<%= name%><br>
<%
	}
%>
	<br>
<%
	Map parameterMap = request.getParameterMap();
	String[] nameParam = (String[])parameterMap.get("name");
	if(nameParam != null) {
%>
		name = <%=nameParam[0] %>
<%
	}
%>

</body>
</html>
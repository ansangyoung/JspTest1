<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.util.*"%>
<%
	System.out.println("\nsample.jsp start");
%>
<!DOCTYPE html>
<html>
<head>
</head>

<body>
	<div id="debugConsole">
	</div>
	
	<script type="text/javascript" src="log.js"></script>
	<script>
		function test(value1, value2) {
console.log('func test() start');
		    var result = 0;
		    result = value1 + value2;
			logln('result:' + result);
			
		    return result;
		}
		test(1, 2);
	</script>
</body>
</html>
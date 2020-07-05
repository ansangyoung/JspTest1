<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.util.*"%>
<%
	System.out.println("\njavaScriptScope.jsp start");
%>
<!DOCTYPE html>
<html>
<head>
</head>

<body>
	<div id="debugConsole">
	1
	</div>
	
	<script type="text/javascript" src="./log.js"></script>
	<script>
		/*
		    scope test
		    http://www.nextree.co.kr/p7363/ ����
		    1. �ٸ� ���α׷��� ������ ��ȿ������ ������ ��� ���� -> �߰�ȣ ���� �������� ���� ��� x
		    2. JavaScript�� ��ȿ������ �Լ� �����̱⿡ �Ʒ� ���� a, b, c ��� ���� ��ȿ����
		    3. ���� �������� ������ �ִ� ������ ������ ��, ���� ����� ������ ������ ����.
		    4. var ������ ���� ������ ����.
		*/
		function scopeTest() {
		    var a = 0;
		    if (true) {
		        var b = 0;
		        for (var c = 0; c < 2; c++) {
		        	logIn('inner c:' + c.toString());
		         }
		         logIn('outer c:' + c.toString());
		    }
		    logIn('b:' + b.toString());
		    var b = 1;
		    logIn('b:' + b.toString());
		    d = 0;
		}
		scopeTest();
		//logIn('b:' + b.toString());
		logIn('d:' + d.toString());
		logIn('');
		/*
			ȣ�̽���
			���� ������ ��ȿ���� ���� ���� ��ܺη� ����÷� ���� �ǰ�,
			������ �ִ� �ڸ����� �ʱ�ȭ�� �̷������.
		*/
		function scopeTest2() {
			logIn("value:" + value);
			var value = 10;
			logIn("value:" + value);
		}
		scopeTest2();
		logIn('');
		
		/*
			ȣ�̽������� ���ؼ� ����ΰ� �Լ� �ֻ�ܿ��� ����÷������� ���������� ����
		*/
		value = 20;
		function scopeTest3() {
			logIn("value:" + value);
			var value = 10;
			logIn("value:" + value);
		}
		scopeTest3();
		logIn('');
		
		/*
			Ŭ���� JavaScript�� ��ȿ���� ü���� �̿��Ͽ� �̹� �����ֱⰡ ���� �ܺ� �Լ��� ������ �����ϴ� ���
			�ܺ� �Լ��� ����Ǵ��� �����Լ��� ����Ǵ� ���¸�,
			�����Լ����� �����ϴ� �ܺ��Լ��� ������ ���ϰ�, �����Լ��� ���ؼ� ������ �ȴ�.
			���� �ܺο��� ���� ������ ������ �� �ֵ��� �ϴ� �Լ�
		*/
		function outerFunc(){  
		    var a= 0;
		    return {
		        innerFunc1 : function(){
		            a+=1;
		            logIn("a:" + a);
		        },
		        innerFunc2 : function(){
		            a+=2;
		            logIn("a:" + a);
		        }
		    };
		}
		var out = outerFunc();  
		out.innerFunc1();  
		out.innerFunc2();  
		out.innerFunc2();  
		out.innerFunc1();
	</script>
</body>
</html>
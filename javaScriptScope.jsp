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
		    http://www.nextree.co.kr/p7363/ 참조
		    1. 다른 프로그래밍 언어들은 유효범위의 단위가 블록 단위 -> 중괄호 밖의 범위에서 변수 사용 x
		    2. JavaScript의 유효범위는 함수 단위이기에 아래 예제 a, b, c 모두 같은 유효범위
		    3. 같은 변수명이 여러개 있는 변수를 참조할 때, 가장 가까운 범위의 변수를 참조.
		    4. var 생략시 전역 변수로 선언.
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
			호이스팅
			변수 선언문이 유효범위 안의 제일 상단부로 끌어올려 지게 되고,
			선언문이 있던 자리에서 초기화가 이루어진다.
		*/
		function scopeTest2() {
			logIn("value:" + value);
			var value = 10;
			logIn("value:" + value);
		}
		scopeTest2();
		logIn('');
		
		/*
			호이스팅으로 인해서 선언부가 함수 최상단에서 끌어올려짐으로 지역변수를 참조
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
			클로저 JavaScript의 유효범위 체인을 이용하여 이미 생명주기가 끝난 외부 함수의 변수를 참조하는 방법
			외부 함수가 종료되더라도 내부함수가 실행되는 상태면,
			내부함수에서 참조하는 외부함수는 닫히지 못하고, 내부함수에 의해서 닫히게 된다.
			따라서 외부에서 내부 변수에 접근할 수 있도록 하는 함수
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
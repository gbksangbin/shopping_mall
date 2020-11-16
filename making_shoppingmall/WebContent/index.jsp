<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<body>
<%
char a = '*';
for (int i = 0; i <= 10; i++){
	for(int j = 0; j <= i; j++){
		%><a><%=a%></a><%
	}
	%><br/><%
}
 %>
</body>
</html>
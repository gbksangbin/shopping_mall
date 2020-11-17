<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border=1>
<%-- <%
int a = 0;
int b = 1;
int j = 0;
 while(j < 11){
	int i=0;
	%><tr><%
	while(i<3){
		int temp = a + b;
		a = b;
		b = temp;
		%><td><%=a%></td><%
		i++;
	}
	%></tr> <%
	j++;
}%>  --%>
<tr>
<%
int a = 0;
int b = 1;
for(int i=1;i<= 33; i++){
	%><td><%=b%></td><%
	int temp = a + b;
	a = b;
	b = temp;
		
	if(i%3 == 0){
		%><tr></tr><%
	}
}
%>
</tr>
</table>

</body>
</html> 
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
<%
for (int i = 0; i < 5; i++){
	%><tr><%
	for(int j = 0; j <= i; j++){
		%><td>*</td><%
	}
	for(int k = 4 - i; k > 0; k--){
		%><td></td><%
	}
	%><tr/><%
}
 %>
 </table>
 <table border=1>
 <%
 for(int i=1;i<=5;i++){
	 %><tr><%
	 for(int j=5;j>i;j--){
     	%><td></td><%
     }
	 for(int k=1;k<=i;k++){
		 %><td>*</td><%
	 }
	 %></tr><%
 }
 %>
 </table>
 
 
 <table border=1>
 <%
 for (int i=0;i<5;i++){
	 %><tr><%
	 for (int j=0; j<5;j++){
		 if (i<=5/2){
	        if (i+j<=5/2-1){
	        	%><td></td><%
	        }
	        else if (j-i>=5/2+1){
	        	%><td></td><%
	        }
	        else{
	        	%><td>*</td><%
	        }
    	 }
		 else if (i>5/2) 
	     {
	        if (i-j>=5/2+1)
	        	%><td></td><%
	        else if (i+j>=5/2*3+1)
	        	%><td></td><%
	        else
	        	%><td>*</td><% 
	     }
	 }
 }
 
 %>
 </table>
 
</body>
</html>
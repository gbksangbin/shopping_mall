<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

try
{  

	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	Statement stmt=con.createStatement();  
	int a = 1, b = 1;
	for(int i = 0; i < 20; i++){
		String query = " INSERT INTO EXAMPLE(id, A, B) VALUES(" +i+","+ a + "," + b + ") ";
		System.out.println(query);
		
		stmt.executeQuery(query);
		
		int temp = a + b;
		a = b;
		b = temp;
		
		
	}
	con.commit();
	con.close();  
	  
}
catch(Exception e)
{ 
	System.out.println(e);
}  
%>

</body>
</html>
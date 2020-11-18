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
	Statement insert_stmt=con.createStatement();
	Statement select_stmt=con.createStatement();
	Statement update_stmt=con.createStatement();  
	
	for(int i = 0; i < 100; i++){
		int a = (int)(Math.random() * 100);
		int a1 = (int)(Math.random() * 100);
		int a2 = (int)(Math.random() * 100);
		int a3 = (int)(Math.random() * 100);
		String query = " INSERT INTO MO(ID,COL1, COL2, COL3, COL4) VALUES("+ i + "," + a + "," + a1 + "," + a2 + "," + a3 + ") ";
		insert_stmt.executeQuery(query);	
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
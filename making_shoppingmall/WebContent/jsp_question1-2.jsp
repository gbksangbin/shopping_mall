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
	Statement select_stmt=con.createStatement();  
	Statement update_stmt=con.createStatement();  
	
	String select_query = "SELECT ID, col1, col2, col3, col4 FROM MO WHERE AVG_COL IS NULL ";
	
	ResultSet rs = select_stmt.executeQuery(select_query);
	while(rs.next()) {
		int col1 = rs.getInt("COL1");
		int col2 = rs.getInt("COL2");
		int col3 = rs.getInt("COL3");
		int col4 = rs.getInt("COL4");
		int ID = rs.getInt("ID");		
		
		String update_query = "UPDATE MO SET AVG_COL = %d WHERE ID = %d";
		//System.out.println(String.format(update_query, (col1+col2+col3+col4)/4, ID));
		update_stmt.executeQuery(String.format(update_query, (col1+col2+col3+col4)/4, ID));
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
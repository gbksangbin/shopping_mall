<table border = "1">
	<tr>
		<td>ID</td>
		<td>카테고리ID</td>
		<td>이름</td>
		<td>가격</td>
		<td>재고</td>
		<td>설명</td>
		<td>원산지</td>
	</tr>
<%
try
{  
	//step1 load the driver class  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	  
	//step2 create  the connection object  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	  
	//step3 create the statement object  
	Statement stmt=con.createStatement();  
	  
	//step4 execute query  
	String query = "SELECT " +
					"ID, CATEGORY_ID, NAME, PRICE, STOCK, DESCRIPTION, ORIGIN " +
					"FROM " +
					"PRODUCT ";
	
	
	ResultSet rs=stmt.executeQuery(query);  
	while(rs.next()) {
		%><tr><%
		
		%><td><%=rs.getInt("ID")%></td><%
		%><td><%=rs.getInt("CATEGORY_ID")%></td><%
		%><td><%=rs.getString("NAME")%></td><%
		%><td><%=rs.getInt("PRICE")%></td><%
		%><td><%=rs.getInt("STOCK")%></td><%
		%><td><%=rs.getString("DESCRIPTION")%></td><%
		%><td><%=rs.getString("ORIGIN")%></td><%
														
		
		%><tr><%
	}
	
	  
	//step5 close the connection object  
	con.close();  
	  
}
catch(Exception e)
{ 
	System.out.println(e);
}  
%>
</table>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>구매 등록</h3>
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
String phone_number = request.getParameter("test"); // != null ? request.getParameter("test") : "";
try
{  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	Statement stmt=con.createStatement();  
	String query = "SELECT ID, CATEGORY_ID, NAME, PRICE, STOCK, DESCRIPTION, ORIGIN FROM product";
	
	if (phone_number != null) {
		query += " WHERE PHONE like '%" + phone_number + "'";
	}
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
	
	con.commit();
	//step5 close the connection object  
	con.close();  
	  
}
catch(Exception e)
{ 
	System.out.println(e);
}  
%>
</table>
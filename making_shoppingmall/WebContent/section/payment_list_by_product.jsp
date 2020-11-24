<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
<h3>상품별 판매 목록</h3>
<table border = "1">
<tr>
	<td>상품명</td>
	<td>구매 액수</td>
	<td>구매 개수</td>
</tr>
<%
try
{  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	Statement stmt=con.createStatement();  
	String query = " SELECT " + 
					" PRODUCT.name AS PRODUCT_NAME, SUM(ORDER_COUNT) AS ORDER_COUNT, SUM(ORDER_PRICE) AS ORDER_PRICE" + 
					" FROM " + 
					" PRODUCT, PAYMENT_HISTORY " +
					" WHERE " + 
					"  PAYMENT_HISTORY.PRODUCT_ID = PRODUCT.id " + 
					" GROUP BY PRODUCT.NAME " ;
	
	ResultSet rs=stmt.executeQuery(query);  
	while(rs.next()) {
		%><tr><%
			%><td><%=rs.getString("PRODUCT_NAME")%></td><%
			%><td><%=rs.getInt("ORDER_PRICE")%></td><%
			%><td><%=rs.getInt("ORDER_COUNT")%></td><%
			
		
		%></tr><%
	}
	
	con.commit();
	con.close();  
	  
}
catch(Exception e)
{ 
	System.out.println(e);
}  
%>
</table>

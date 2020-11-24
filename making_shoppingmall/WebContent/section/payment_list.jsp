<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<h3>구매 목록</h3>
<table border = "1">
<tr>
	<td>ID</td>
	<td>구매날짜</td>
	<td>주문 상태</td>
	<td>구매 개수</td>
	<td>구매 액수</td>
	<td>상품명</td>
	<td>맴버</td>
	<td>주소</td>
</tr>
<%
try
{  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	Statement stmt=con.createStatement();  
	String query = " SELECT " + 
					" PAYMENT_HISTORY.ID AS PAYMENT_ID, ORDER_DATE, ORDER_STATUS, ORDER_COUNT, ORDER_PRICE, " + 
					" PRODUCT.NAME AS PRODUCT_NAME, MEMBER.NAME AS MEMBER_NAME, PAYMENT_HISTORY.ADDRESS AS ADDRESS " + 
					" FROM " + 
					" PRODUCT, PAYMENT_HISTORY, MEMBER " +
					" WHERE " + 
					" PRODUCT_ID = PRODUCT.ID AND MEMBER_ID = MEMBER.ID ";
	
	ResultSet rs=stmt.executeQuery(query);  
	while(rs.next()) {
		%><tr><%
			%><td><%=rs.getInt("PAYMENT_ID")%></td><%
			%><td><%=rs.getString("ORDER_DATE")%></td><%
			%><td><%=rs.getString("ORDER_STATUS")%></td><%
			%><td><%=rs.getInt("ORDER_COUNT")%></td><%
			%><td><%=rs.getInt("ORDER_PRICE")%></td><%
			%><td><%=rs.getString("PRODUCT_NAME")%></td><%
			%><td><%=rs.getString("MEMBER_NAME")%></td><%
			%><td><%=rs.getString("ADDRESS")%></td><%
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<%
int product_id = Integer.parseInt(request.getParameter("product_id"));
int member_id = Integer.parseInt(request.getParameter("member_id"));
String order_date = request.getParameter("order_date");
int order_count = Integer.parseInt(request.getParameter("order_count"));
String address = request.getParameter("address");


String query = "INSERT INTO PAYMENT_HISTORY(ID, ORDER_DATE, ORDER_STATUS, ORDER_COUNT, ORDER_PRICE, PRODUCT_ID, MEMBER_ID, ADDRESS) " +
			   "VALUES(SEQ_PAYMENT.NEXTVAL, '%s','PAYMENT_WAITING', %d, %d, %d, %d, '%s')";
String query1 = " SELECT price  FROM product where id= " + product_id;

try
{  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	Statement stmt=con.createStatement();
	Statement stmt2=con.createStatement();
	ResultSet rs = stmt2.executeQuery(query1);
	
	rs.next();
	int product_price = rs.getInt(1);
	rs.close();

	stmt.executeQuery(String.format(query, order_date, order_count, product_price * order_count, product_id, member_id, address));

	con.commit();
	con.close();
}
catch(Exception e)
{ 
	System.out.println(e);
}  
%>
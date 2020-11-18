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
<table class="문제1" border = "1">
	<tr>
		<td>구매자명</td>
		<td>구매금액</td>

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
					" order_price, name " +
					"FROM " +
					"member, payment_history  "+
					"WHERE " +
					"member.ID = payment_history.member_id ";
	
	
	ResultSet rs=stmt.executeQuery(query);  
	while(rs.next()) {
		%><tr><%
		
		
		%><td><%=rs.getString("name")%></td><%
		%><td><%=rs.getString("order_price")%></td><%
		
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
<a class="문제 2">
CREATE TABLE PURCHASE_LOG (
    ID NUMBER NOT NULL,
    LOG VARCHAR2(300),
    CONSTRAINT PURCHASE_LOG_PK PRIMARY KEY (id)
)
</a>
<a>
<%

try
{  

	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	Statement select_stmt=con.createStatement();  
	Statement insert_stmt=con.createStatement();  
	
	String select_query = "SELECT payment_history.ID as ID, member.name as member_name, product.name as product_name, product.stock as stock, order_price as price FROM " + 
						"payment_history,product,member " +
						"WHERE  member.id = member_id and product.ID=payment_history.product_id ";
	
	ResultSet rs = select_stmt.executeQuery(select_query);
	while(rs.next()) {
		String member_name = rs.getString("member_name");
		String product_name = rs.getString("product_name");
		int stock = rs.getInt("stock");
		int order_price = rs.getInt("price");
		int id = rs.getInt("ID");
		
		
		String insert_query = " INSERT INTO purchase_log(ID,LOG) VALUES("+ id + ",'"+member_name+"님이 "+product_name+" 상품 "+stock+"개를 "+order_price+"원에 구매하셨습니다') ";
		//System.out.println(insert_query);
		System.out.println(id);
		insert_stmt.executeQuery(insert_query);
	}
	
	con.commit();
	con.close();  
	  
}
catch(Exception e)
{ 
	System.out.println(e);
}  
%>
</a>
</body>
</html>
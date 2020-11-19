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
<table border = "1">
<tr>
	<td>유저 이름</td>
	<td>유저 핸드폰 번호</td>
	<td>유저 이메일</td>
	<td>구매 금액</td>
	<td>구매 상품ID</td>
	<td>구매 개수</td>
</tr>
<%
String phone_number = request.getParameter("phone_number");// != null ? request.getParameter("test") : "";
String email = request.getParameter("email");

try
{  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	Statement stmt=con.createStatement();  
	String query = "SELECT EMAIL, member.NAME as name, member.PHONE as phone, order_price, product_id, order_count FROM MEMBER, payment_history WHERE MEMBER.ID = MEMBER_ID";
	if (phone_number != null) {
		query += " AND phone like '%" + phone_number + "'";
	}
	if (email != null) {
		query += " AND email like '%" + email + "%'";
	}
	
	ResultSet rs=stmt.executeQuery(query);  
	while(rs.next()) {
		%><tr><%
			%><td><%=rs.getString("name")%></td><%
			%><td><%=rs.getString("phone")%></td><%
			%><td><%=rs.getString("EMAIL")%></td><%
			%><td><%=rs.getInt("order_price")%></td><%
			%><td><%=rs.getString("product_id")%></td><%
			%><td><%=rs.getString("order_count")%></td><%
		%><tr><%
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

<p>전화번호 뒷 4자리를 입력하여 주세요</p>
<input type="text" id="phone_number">
<p>이메일을 입력하세요</p>
<input type="text" id="email">
<input type="button" onclick="click_search()" value="search">

<script>
	function click_search() {
		const email = document.getElementById("email").value;
		const phone_number = document.getElementById("phone_number").value;
		
		redirect_with_get_params(phone_number,email);
	}
	
	function redirect_with_get_params(phone_number,email) {
		window.location.href = 'parameter_query2.jsp?phone_number=' + phone_number + '&email='+ email;
	}
</script>
</body>
</html>
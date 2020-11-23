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
	<td>상품명</td>
	<td>상품 가격</td>
	<td>상품 재고</td>
	<td>상품 설명</td>
	<td>원산지</td>
</tr>
<%
String moreThanPrice = request.getParameter("moreThanPrice");// != null ? request.getParameter("test") : "";
String lessThanPrice = request.getParameter("lessThanPrice");
String moreThanStock = request.getParameter("moreThanStock");
String lessThanStock = request.getParameter("lessThanStock");

System.out.println(moreThanStock);
try
{  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	Statement stmt=con.createStatement();  
	String query = "SELECT name, price, stock, description, origin " + 
					" FROM " +
					" product " +
					" where " + 
					" 1 = 1 ";
	
	
	
	if(moreThanPrice != null && moreThanPrice.length() !=0 ){
		query += " AND PRICE >= " + moreThanPrice;
	}
	if(lessThanPrice !=null && lessThanPrice.length() !=0 ){
		query += " AND PRICE <= " + lessThanPrice;
	}
	if(moreThanStock !=null && moreThanStock.length() !=0 ){
		query += " AND STOCK >= " + moreThanStock;
	}
	if(lessThanStock !=null && lessThanStock.length() !=0 ){
		query += " AND STOCK <= " + lessThanStock;
	}
	
	
	System.out.println(query);
	ResultSet rs=stmt.executeQuery(query);  
	while(rs.next()) {
		%><tr><%
			%><td><%=rs.getString("name")%></td><%
			%><td><%=rs.getInt("price")%></td><%
			%><td><%=rs.getInt("stock")%></td><%
			%><td><%=rs.getString("description")%></td><%
			%><td><%=rs.getString("origin")%></td><% 
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

<p>가격</p>


<input type="text" id="moreThanPrice" placeholder="이상 조건">-
<input type="text" id="lessThanPrice" placeholder="이하 조건">

<p>재고</p>
<input type="text" id="moreThanStock" placeholder="이상 조건">-
<input type="text" id="lessThanStock" placeholder="이하 조건">
<input type="button" onclick="click_search()" value="search">

<script>
	function click_search() {
		const moreThanPrice = document.getElementById("moreThanPrice").value;
		const lessThanPrice = document.getElementById("lessThanPrice").value;
		const moreThanStock = document.getElementById("moreThanStock").value;
		const lessThanStock = document.getElementById("lessThanStock").value;
		
		redirect_with_get_params(moreThanPrice,lessThanPrice,moreThanStock,lessThanStock);
	}
	
	function redirect_with_get_params(moreThanPrice,lessThanPrice,moreThanStock,lessThanStock) {
		window.location.href = "jsp_question2.jsp?moreThanPrice=" + moreThanPrice + 
								"&lessThanPrice=" + lessThanPrice + "&moreThanStock=" + moreThanStock + 
								"&lessThanStock=" + lessThanStock;
	}
</script>
</body>
</html>
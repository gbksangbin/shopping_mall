<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>구매 등록</h3>
<form action="action/payment_insert.jsp">
	<table border=1>
		<tr>
			<td><p>상품</p></td>
			<td><select name="product_id">
				<%
				try
				{  
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con=DriverManager.getConnection(  
					"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
					Statement stmt=con.createStatement();  
					
					String query = "SELECT ID, NAME FROM product";
					
					ResultSet rs=stmt.executeQuery(query);  
					while(rs.next()) {
						%><option value="<%=rs.getInt(1) %>"><%=rs.getString(2) %></option><%
					}
					con.close();  
				}
				catch(Exception e)
				{ 
					System.out.println(e);
				}  
				%>
				</select>
			</td>
		</tr>
		<tr>
			<td><p>맴버</p></td>
			<td><select name="member_id">
				<%
				try
				{  
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con=DriverManager.getConnection(  
					"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
					Statement stmt=con.createStatement();  
					
					String query = "SELECT ID, NAME FROM member";
					
					ResultSet rs=stmt.executeQuery(query);  
					while(rs.next()) {
						%><option value="<%=rs.getInt(1) %>"><%=rs.getString(2) %></option><%
					}
					con.close();  
				}
				catch(Exception e)
				{ 
					System.out.println(e);
				}  
				%>
				</select>
			</td>
		</tr>
		<tr>
			<td><p>구매날짜</p></td>
			<td><input type="text" name="order_date"></td>
		</tr>
		<tr>	
			<td><p>구매 개수</p></td>
			<td><input type="number" name="order_count"></td>
		</tr>
		<tr>	
			<td><p>주소</p></td>
			<td><input type="number" name="address"></td>
		</tr>
		<tr>	
			<td colspan="2">
				<input type="submit" value="제출">
				<input type="button" value="다시쓰기">
			</td>
		</tr>
	</table>
</form>
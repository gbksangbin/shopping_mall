<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/css.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%@include file="page/header.jsp"%>
		<%@include file="page/nav.jsp"%>
		
		<%
		String section = request.getParameter("section") != null ? request.getParameter("section") : "";
		
		switch(section) {
		case "product_list":
			%><%@include file="section/product_list.jsp"%><%
			break;
		case "payment_list":
			%><%@include file="section/payment_list.jsp"%><%
			break;
		case "payment_list_by_product":
			%><%@include file="section/payment_list_by_product.jsp"%><%
			break;
		case "payment_list_by_category":
			%><%@include file="section/payment_list_by_category.jsp"%><%
			break;
		case "product_create":
			%><%@include file="section/product_create.jsp"%><%
			break;
		case "payment_create":
			%><%@include file="section/payment_create.jsp"%><%
			break;
		default:
			%><pre>
			이프로그램은 쇼핑을 관리해주는 프로그램입니다.
			</pre><%
			break;
		}
		%>
		<%@include file="page/footer.jsp"%>
</body>
</html>
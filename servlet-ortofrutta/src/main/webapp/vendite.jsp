<%@page import="it.dstech.ortofrutta.Vendite"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
body {
	font-size: 150%;
	font-family: Arial;
	letter-spacing: 0.1em;
	line-height: 25px;
}

input.home {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 10px 20px;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin-right: 50px;
	margin-top: 20px;
}

table, th, td {
	border: 0.5px solid black;
	text-align: center;
	margin-top: 180px;
}
.header {
	background-color: #ff7063;
	padding: 5px 0px 10px 80px;
	margin: 0px 0px 20px -10px;
	height: 100px;
	position: fixed;
	top: 0px;
	width: 100%;
	z-index: 50;
}
</style>

<body>
	<div class="header">
		<div class="titolo">
			<h1>Ortofrutta.</h1>
		</div>
	</div>
	<%
		List<Vendite> elencoVendite = (List<Vendite>) request.getAttribute("vendite");
	%>
	<table style="text-align: center;">
		<tr>
			<th>Nome</th>
			<th>Quantita</th>
		</tr>
		<%
			for (Vendite lista : elencoVendite) {
		%>
		<tr>
			<td><%=lista.getNome()%></td>
			<td><%=lista.getQuantita()%></td>
		</tr>
		<%
			}
		%>
	</table>
	<form action="home">
		<input type="submit" value="Torna Indietro" class="home">

	</form>
</body>
</html>
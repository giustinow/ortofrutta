<%@page import="it.dstech.ortofrutta.Vendite"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Acquisto.</title>
</head>
<style>
body{
background-color: #f2fff3;
	font-size: 150%;
	font-family: Arial;
	letter-spacing: 0.1em;
	line-height: 25px;
	text-align: center;
}
input.home {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin-right: 100px;
}
table, th, td {

	border: 0.5px solid black;
}
</style>

<body>
	<%
		List<Vendite> elencoVendite = (List<Vendite>) request.getAttribute("acquisto");
	%>
	<table>
		<tr>
			<th>Nome</th>
			<th>Quantita</th>
		</tr>
		<%for (Vendite lista : elencoVendite) {%>
		<tr>
			<td><%=lista.getNome()%></td>
			<td><%=lista.getQuantita()%></td>
		</tr>
		<%
			}
		%>
	</table>

	<h4>Acquisto Effettuato!</h4>
	<form action="home">
		<input type="submit" value="Torna Indietro" class="home">

	</form>
</body>
</html>
<%@page import="it.dstech.ortofrutta.Magazzino"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Magazzino.</title>
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
}

table.center {
	margin-left: auto;
	margin-right: auto;
}

table, th, td {
	border: 0.5px solid black;
		margin-top: 180px;
}
.header {
	background-color: #ff7063;
	padding: 5px 0px 10px 80px;
	margin: 0px 0px 0px -10px;
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
		List<Magazzino> elencoMagazzino = (List<Magazzino>) request.getAttribute("magazzino");
	%>
	<table class="centro">
		<tr>
			<th>Nome</th>
			<th>Quantita</th>
			<th>Prezzo</th>
			<th>Descrizione</th>
		</tr>
		<%
			for (Magazzino lista : elencoMagazzino) {
		%>
		<tr>
			<td><%=lista.getNome()%></td>
			<td><%=lista.getQuantita()%></td>
			<td><%=lista.getPrezzo()%></td>
			<td><%=lista.getDescrizione()%></td>
		</tr>
		<%
			}
		%>
	</table>
	<br>
	<br>
	<form action="home">
		<input type="submit" value="Torna Indietro" class="home">

	</form>
</body>
</html>
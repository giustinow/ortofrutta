<%@page import="it.dstech.ortofrutta.Utente"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Utenti.</title>
</head>
<style>
body {
	background-color: #f2fff3;
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

table, th, td {
	margin-top: 180px;
	margin-left: 50px;
}

li {
	display: inline;
	font-family: Arial;
	letter-spacing: 0.1em;
	line-height: 25px;
}

.navigazione {
	margin: -45px 50px 50px 800px;
	word-spacing: 20px;
	font-family: Arial;
	letter-spacing: 0.1em;
	line-height: 25px;
}

.header {
	background-color: #4CAF50;
	padding: 5px 0px 10px 80px;
	margin: 0px 0px 0px -10px;
	height: 100px;
	position: fixed;
	top: 0px;
	width: 100%;
	z-index: 50;
}

table {
	border-spacing: 0px;
}

th, td {
	padding: 5px 30px 5px 10px;
	border-spacing: 0px;
	font-size: 90%;
	margin: 0px;
}

th, td {
	color: #737476;
	text-align: left;
	background-color: #e0e9f0;
	border-top: 1px solid #f1f8fe;
	border-bottom: 1px solid #cbd2d8;
	border-right: 1px solid #cbd2d8;
}

tr.head th {
	color: #fff;
	background-color: #4CAF50;
	border-bottom: 2px solid #547ca0;
	border-right: 1px solid #749abe;
	border-top: 1px solid #90b4d6;
	text-align: center;
	text-shadow: -1px -1px 1px #666;
	letter-spacing: 0.15em;
}

tr.head th:first-child {
	-webkit-border-top-left-radius: 5px;
	-moz-border-radius-topleft: 5px;
	border-top-left-radius: 5px;
}

tr.head th:last-child {
	-webkit-border-top-right-radius: 5px;
	-moz-border-radius-topright: 5px;
	border-top-right-radius: 5px;
}

td {
	text-shadow: 1px 1px 1px #fff;
}

tr.even td, tr.even th {
	background-color: #e8eff5;
}
</style>

<body>
		<div class="header">
			<div class="titolo">
				<h1>Ortofrutta.</h1>
			</div>
			<div class="navigazione">
				<ul>
					<li><a href="http://localhost:8080/servlet-ortofrutta/admin.jsp">Home</a></li>
					<li><a
						href="http://localhost:8080/servlet-ortofrutta/magazzino?magazzino=Magazzino">Magazzino</a></li>
					<li><a
						href="http://localhost:8080/servlet-ortofrutta/vendite?">Vendite</a></li>
							<li><a
						href="http://localhost:8080/servlet-ortofrutta/lista-utenti">Utenti</a></li>
						<li class="esci"><a
						href="http://localhost:8080/servlet-ortofrutta/">LogOut</a></li>
				</ul>
			</div>
		</div>
		<%
			List<Utente> elencoUtenti = (List<Utente>) request.getAttribute("utenti");
		%>
		<table class="centro">
			<tr class="head">
				<th>Nome</th>
				<th>Eta</th>
			</tr>
			<%
				for (Utente lista : elencoUtenti) {
			%>
			<tr>
				<td><%=lista.getUsername()%></td>
				<td><%=lista.getEta()%></td>
				<td><a href="http://localhost:8080/servlet-ortofrutta/elimina-utente?username=<%=lista.getUsername()%>">Rimuovi</a></td>
			</tr>
			<%
				}
			%>
		</table>
		<br> <br>
		<form action="admin.jsp">
			<input type="submit" value="Home" class="home">

		</form>
</body>
</html>
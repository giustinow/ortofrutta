<%@page import="it.dstech.ortofrutta.ScontrinoRetrieve"%>
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

.navigazione {
	margin: -45px 50px 50px 800px;
	word-spacing: 20px;
	text-align: left;
}

li {
	display: inline;
}

.titolo {
	text-align: left;
}

.contenuto {
	margin-top: 200px;
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
	<%
		List<ScontrinoRetrieve> elencoScontrini = (List<ScontrinoRetrieve>) request.getAttribute("scontrini");
	String username = (String)request.getAttribute("username");
	%>
	<div class="header">
		<div class="titolo">
			<h1>Ortofrutta.</h1>
		</div>
		<div class="header">
			<div class="titolo">
				<h1>Ortofrutta.</h1>
			</div>
			<div class="navigazione">
			<ul>
				<li><a href="http://localhost:8080/servlet-ortofrutta/accesso?username=<%=username%>&accedi=Accedi">Profilo</a></li>
				<li><a href="http://localhost:8080/servlet-ortofrutta/storico-acquisti?username=<%=username%>&accedi=Accedi">Acquisti</a></li>
				<li><a href="http://localhost:8080/servlet-ortofrutta/compra?username=<%=username%>&accedi=Accedi">Ordina</a></li>
				<li><a
					href="http://localhost:8080/servlet-ortofrutta/about.jsp">About</a></li>
				<li><a href="http://localhost:8080/servlet-ortofrutta/">LogOut</a></li>
			</ul>
		</div>
		</div>
	</div>
	<div class="contenuto">
		<table class="centro">
			<tr>
				<th>Fattura N.</th>
				<th>Data</th>
				<th>Prodotti</th>
				<th>Totale</th>
				<th>Username</th>
			</tr>

			<%
				for (ScontrinoRetrieve lista : elencoScontrini) {
			%>

			<tr>
				<td><%=lista.getIdScontrino()%></td>
				<td><%=lista.getData()%></td>
				<td><a
					href="http://localhost:8080/servlet-ortofrutta/storico-carrello?idScontrino=<%=lista.getIdScontrino()%>">Dettagli</a></td>
				<td><%=lista.getTotale()%></td>
				<td><%=lista.getUsername()%></td>
			</tr>
			<%
				}
			%>
		</table>
		<br> <br>
		<form action="accesso">
		<input type="hidden" value=<%=username %> name="username">
			<input type="submit" value="Home" class="home">
		</form>
	</div>
</body>
</html>
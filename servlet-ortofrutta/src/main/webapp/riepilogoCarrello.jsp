<%@page import="it.dstech.ortofrutta.Carrello"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Carrello.</title>
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
</head>

<body>
	<div class="header">
		<div class="titolo">
			<h1>Ortofrutta.</h1>
		</div>
		<div class="navigazione">
			<ul>
				<li><a href="http://localhost:8080/servlet-ortofrutta/home?">Home</a></li>
				<li><a href="">About</a></li>
				<li><a href="">Contact</a></li>
				<li><a href="">More</a></li>
			</ul>
		</div>
	</div>
	<%
		List<Carrello> elencoCarrello = (List<Carrello>) request.getAttribute("carrello");
		Double totale = (Double) request.getAttribute("totale");
		String username = (String) request.getAttribute("username");
	%>
	<div class="contenuto">
		<div class="header">
			<div class="titolo">
				<h1>Ortofrutta.</h1>
			</div>
		</div>
		<table class="centro">
			<tr>
				<th>Nome Prodotto</th>
				<th>Quantita</th>
				<th>Prezzo</th>
				<th>Totale</th>
			</tr>
			<%
				for (Carrello lista : elencoCarrello) {
			%>
			<tr>
				<td><%=lista.getNome()%></td>
				<td><%=lista.getQuantita()%></td>
				<td><%=lista.getPrezzo()%></td>
				<td><%=lista.getTotale()%></td>
			</tr>
			<%
				}
			%>
		</table>
		<h4>Totale da pagare:</h4>
		<%=totale%>
		<br> <br>
		<form action="acquisto">
			<input type="hidden" name="username" value=<%=username%>> <input
				type="hidden" name="totale" value=<%=totale%>> <input
				type="submit" value="Conferma" class="home">
		</form>
	</div>
</body>
</html>
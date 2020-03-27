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
	font-size: 120%;
	margin-left: 80px;
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
		<div class="navigazione">
			<ul>
				<li><a href="http://localhost:8080/servlet-ortofrutta/home?">Home</a></li>
				<li><a href="">About</a></li>
				<li><a href="">Contact</a></li>
				<li><a href="">More</a></li>
			</ul>
		</div>
	</div>
	<div class="contenuto">
		<%
			List<String> lista = (List<String>) request.getAttribute("magazzino");
			String username = (String) request.getAttribute("username");
		%>
		<div id="Acquista">
			<h3 class="Acquista">
				Acquista un prodotto
				<%=username%>!
			</h3>
			<form action="continua-shopping">
				<label for="nomeParametro" class="">Scegli il prodotto:</label><br> <select
					name="nomeParametro" class="label">
					<%
						for (String cc : lista) {
					%>
					<option value="<%=cc%>"><%=cc%></option>
					<%
						}
					%>
				</select><br /> <br> <label for="limit">Inserisci quantità:</label><br> <input
					type="number" id="limit" min="1" name="limit"> <br> <br>
				<input type="hidden" id="username" name="username"
					value=<%=username%>> <input type="submit"
					value="Aggiungi Al Carrello" class="home">
			</form>
			<br>
			<form action="riepilogo">
				<input type="hidden" id="username" name="username"
					value=<%=username%>> <input type="submit"
					value="Procedi all'acquisto" class="home">
			</form>
		</div>

	</div>
</body>
</html>
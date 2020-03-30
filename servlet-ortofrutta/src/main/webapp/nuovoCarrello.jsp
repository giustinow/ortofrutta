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
input.carrello {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 5px 10px;
	text-decoration: none;
	display: inline-block;
	font-size: 10px;
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
	background-color: #ffb963;
	width: 100%;
	height: 500px;
	margin-top: 110px;
	margin-left: -20px;
	padding: 50px 0px 200px 200px;
	font-size: 120%;
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
		List<String> lista = (List<String>) request.getAttribute("magazzino");
		String username = (String) request.getAttribute("username");
	%>
	<div class="header">
		<div class="titolo">
			<h1>Ortofrutta.</h1>
		</div>
		<div class="navigazione">
			<ul>
				<li><a
					href="http://localhost:8080/servlet-ortofrutta/accesso?username=<%=username%>&accedi=Accedi">Profilo</a></li>
				<li><a
					href="http://localhost:8080/servlet-ortofrutta/storico-acquisti?username=<%=username%>&accedi=Accedi">Acquisti</a></li>
				<li><a
					href="http://localhost:8080/servlet-ortofrutta/compra?username=<%=username%>&accedi=Accedi">Ordina</a></li>
				<li><a
					href="http://localhost:8080/servlet-ortofrutta/about.jsp">About</a></li>
				<li><a href="http://localhost:8080/servlet-ortofrutta/">LogOut</a></li>
			</ul>
		</div>
	</div>
	<div class="contenuto">
		<div id="Acquista">
			<h3 class="Acquista">
				Acquista un prodotto
				<%=username%>!
			</h3>
			<form action="continua-shopping">
				<label for="nomeParametro" class="">Scegli il prodotto:</label><br>
				<select name="nomeParametro" class="label">
					<%
						for (String cc : lista) {
					%>
					<option value="<%=cc%>"><%=cc%></option>
					<%
						}
					%>
				</select><br /> <br> <label for="limit">Inserisci quantità:</label><br>
				<br>
				<input type="number" id="limit" min="1" name="limit"> <input
					type="hidden" id="username" name="username" value=<%=username%>>
				<input type="submit" value="Aggiungi Al Carrello" class="carrello">
			</form>
			<br>
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
<%@page import="it.dstech.ortofrutta.Scontrino"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Acquisto Riuscito</title>
</head>
<style>
body {
background-color: #f2fff3;
	font-size: 150%;
	font-family: Arial;
	letter-spacing: 0.1em;
	line-height: 25px;
	text-align: center;
}

.contenuto {
	margin-top: 180px;
	
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
				<li><a href="http://localhost:8080/servlet-ortofrutta/about.jsp">About</a></li>
				<li><a href="">Contact</a></li>
				<li><a href="">More</a></li>
			</ul>
		</div>
	</div>
	<%
		Scontrino scontrino = (Scontrino) request.getAttribute("scontrino");
		int idScontrino = (int) request.getAttribute("idScontrino");
		String username = (String) request.getAttribute("username");
	%>
	<div class="contenuto">
		<h1>Acquisto Riuscito.</h1>
		<br>
		<table class="centro">
			<tr>
				<th>Fattura N.</th>
				<th>Data</th>
				<th>Prezzo Totale</th>
				<th>Username</th>
			</tr>
			<tr>
				<td><%=idScontrino%></td>
				<td><%=scontrino.getData()%></td>
				<td><%=scontrino.getTotale()%></td>
				<td><%=scontrino.getUsername()%></td>
			</tr>
		</table>
		<h4>Torna alla Home</h4>
		<form action="home">
			<input type="submit" value="Home" class="home">
		</form>
		<br>
		<h4>Profilo</h4>
		<form action="accesso">
			<input type="hidden" id="username" name="username"
				value=<%=username%>> <input type="submit" value="Profilo"
				class="home">
		</form>
	</div>
</body>
</html>
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
h4{
text-align: center;
margin-right: 100px;
}
.contenuto {
	margin-top: 180px;
}

.acquisto {
	margin: auto;
	width: 50%;
	padding-left: 100px;
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

* {
	box-sizing: border-box;
}
/* Create two equal columns that floats next to each other */
.column {
	float: left;
	width: 49%;
	padding: 200px 100px 310px 0px;
}

.column1 {
	background-color: #ffb963;
	float: right;
	width: 51%;
	padding: 200px 0px 310px 200px;
}

.row {
	width: 102.5%;
}
/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

@media screen and (max-width: 600px) {
	.column {
		width: 100%;
	}
}

.welcome {
	width: 103%;
	height: 150px;
	background-color: #89f090;
	margin: 100px 20px 0px -10px;
	padding-top: 25px;
}
</style>

<body>
	<%
		Scontrino scontrino = (Scontrino) request.getAttribute("scontrino");
		int idScontrino = (int) request.getAttribute("idScontrino");
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
		<h1>Acquisto Riuscito.</h1>
		<br>
		<div class="acquisto">
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
		</div>
		<div class="row">
			<div class="column">
				<h4>Esci dal tuo profilo</h4>
				<form action="home">
					<input type="submit" value="Log Out" class="home">
				</form>
			</div>
			<br>
			<div class="column1">
				<h4>Profilo</h4>
				<form action="accesso">
					<input type="hidden" id="username" name="username"
						value=<%=username%>> <input type="submit" value="Profilo"
						class="home">
				</form>
			</div>
		</div>
	</div>
</body>
</html>
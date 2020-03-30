<%@page import="it.dstech.ortofrutta.Utente"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profilo Utente</title>
</head>
<style>
body {
background-color: #ffffff; /* Green */
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
}

.navigazione {
	margin: -45px 50px 50px 600px;
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
	width: 101%;
	z-index: 50;
}

* {
	box-sizing: border-box;
}
/* Create two equal columns that floats next to each other */
.column {
	background-color: #ffffff;
	float: left;
	width: 49%;
	padding: 300px 100px 310px 0px;
}

.column1 {
	background-color: #ffb963;
	float: right;
	width: 51%;
	padding: 300px 0px 310px 200px;
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
	height: 100px;
	background-color: #89f090;
	margin: 100px 20px 0px -10px;
	padding-top: 2px;
	}
</style>

<body>
	<%
		String username = (String) request.getAttribute("username");
	%>
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
	<div class="welcome">
		<h1>
			Benvenuto
			<%=username%>!
		</h1>
	</div>
	<div class="row">
		<div class="column">
			<h3>I tuoi acquisti</h3>
			<form action="storico-acquisti">
				<input type="hidden" id="username" name="username"
					value=<%=username%>> <input type="submit"
					value="I Miei Acquisti" class="home">
			</form>
		</div>
		<div class="column1">
			<h3>Acquista un prodotto</h3>
			<form action="compra">
				<input type="hidden" id="username" name="username"
					value=<%=username%>> <input type="submit" value="Acquista"
					class="home">
			</form>
		</div>
	</div>
</body>
</html>
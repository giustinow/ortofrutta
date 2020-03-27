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
		String username = (String) request.getAttribute("username");
	%>
	<div class="contenuto">
		<h1>
			Ciao
			<%=username%>!
		</h1>
		<h3>I tuoi acquisti</h3>
		<form action="storico-acquisti">
			<input type="hidden" id="username" name="username"
				value=<%=username%>> <input type="submit"
				value="I Miei Acquisti" class="home">
		</form>
		<h3>Acquista un prodotto</h3>
		<form action="compra">
			<input type="hidden" id="username" name="username"
				value=<%=username%>> <input type="submit" value="Acquista"
				class="home">
		</form>
		<h3>Torna alla home</h3>
		<form action="home">
			<input type="submit" value="home" class="home">
		</form>
	</div>
</body>
</html>
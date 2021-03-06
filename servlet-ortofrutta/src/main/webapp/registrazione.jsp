
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="it.dstech.ortofrutta.Magazzino"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<title>Ortofrutta.</title>
<style type="text/css">
body {
	background-color: #f2fff3;
	font-size: 150%;
	font-family: Arial;
	letter-spacing: 0.1em;
	line-height: 25px;
}

.aggiungi {
	padding: 20px 80px 50px 80px;
	margin: 100px -20px 100px -20px;
	text-align: center;
	background-color: #ffb963;
	padding
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
	background-color: #ff7063;
	padding: 5px 0px 10px 80px;
	margin: 0px 0px 0px -10px;
	height: 100px;
	position: fixed;
	top: 0px;
	width: 100%;
	z-index: 50;
}

h3 {
	text-align: center;
	margin-top: 50px;
	margin-bottom: 50px;
}

h4.Acquista {
	margin-top: -40px;
}

#Acquista {
	background-color: #ffb963;
	text-align: center;
	padding: 80px 0px 0px 0px;
	margin: 110px -10px 0px -10px;
	height: 250px;
}

#Magazzino {
	text-align: left;
	padding: 10px 90px 10px 250px;
	margin: 0px 750px 0px -70px;
	height: 260px;
	text-align: left;
}

input.Magazzino {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin-left: 50px;
}

#Vendite {
	text-align: right;
	padding: 10px 200px 10px 50px;
	margin: -280px -10px 0px 700px;
	height: 260px;
	text-align: right;
}

input.Vendite, input.Aggiunta, input.Acquista {
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

.registrazione {
	text-align: center;
	margin: -250px 0px 0px 0px;
	padding: 0px 0px 0px 700px;
}

.accedi {
	text-align: left;
	margin: 250px 0px 100px 100px;
}

.registrati {
background-color: #ffb963;
	margin-top: 00px;
	text-align: center;
	width: 50%;
	margin: 0 auto;
}

fieldset {

	width: 550px;
	height: 350px; border : 1px solid #dcdcdc;
	border-radius: 10px;
	padding: 50px;
	text-align: center;
	border: 1px solid #dcdcdc;
}

legend {
	background-color: #4CAF50;
	color: white;
	border: 1px solid #dcdcdc;
	border-radius: 10px;
	padding: 10px 10px;
	text-align: center;
}
</style>
</head>

<body>
	<div class="contenuto">
		<div class="header">
			<div class="titolo">
				<h1>Ortofrutta.</h1>
			</div>
			<div class="navigazione">
				<ul>
					<li><a href="http://localhost:8080/servlet-ortofrutta/home?">Home</a></li>
					<li><a
						href="http://localhost:8080/servlet-ortofrutta/magazzino?magazzino=Magazzino">Prodotti</a></li>
					<li><a
						href="http://localhost:8080/servlet-ortofrutta/about.jsp">About</a></li>
				</ul>
			</div>
		</div>
		<%
			String messaggio = (String) request.getAttribute("messaggio");
			if (messaggio != null) {
		%>
		<h1>ERRORE</h1>
		<%=messaggio%>

		<%
			} else {
		%>
		<div class="accedi">
			<form action="accesso" class="accedi">
				<h4>Accedi al tuo account</h4>
				Username: <input type="text" name="username" required="required" />
				<br> <br> <input type="submit" name="accedi"
					value="Accedi" class="Magazzino" />
			</form>
		</div>

		<div class="registrazione">
			<h4 class="">Registrati!</h4>
			<form action="registrazione">
				Username: <input type="text" name="username" required="required" /><br>
				<br> Et�: <input type="number" name="eta" min="18" max="120"
					required="required" /> <br> <br> <input type="submit"
					name="registrati" value="Registrati" class="Magazzino" />
			</form>
		</div>
		<div class="aggiungi">
			<h4>Aggiungi un prodotto al magazzino</h4>
			<form action="aggiunta" method="post">
				Nome: <input type="text" name="nome" /><br> <br>
				Quantit�: <input type="number" name="quantita" min="1" /><br>
				<br> Prezzo: <input type="number" name="prezzo" min="0" /><br>
				<br> Descrizione: <input type="text" name="descrizione" /> <br>
				<br> <input type="submit" name="aggiunta" value="Aggiungi"
					class="Aggiunta" />
			</form>

		</div>
		<%
			}
		%>
		<%
			String messaggio1 = (String) request.getAttribute("messaggio");
			if (messaggio1 != null) {
		%>
		<h1>ERRORE</h1>
		<%=messaggio1%>

		<%
			} else {
		%>

		<%
			}
		%>

	</div>
</body>
</html>

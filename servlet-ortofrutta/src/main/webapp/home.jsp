<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="it.dstech.ortofrutta.Magazzino"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<title>Gestione Ortofrutta</title>
<style type="text/css">
body {
	font-size: 150%;
	font-family: Arial;
	letter-spacing: 0.1em;
	line-height: 25px;
}

.aggiungi {
	margin-top: 200px;
	text-align: center;
}

li {
	display: inline;
}

.navigazione {
	margin: -45px 50px 50px 800px;
	word-spacing: 20px;
}

.header {
	background-color: #70de66;
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
	background-color: #ff7063;
	text-align: left;
	padding: 10px 90px 10px 250px;
	margin: 0px 750px 0px -70px;
	height: 260px;
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
	background-color: #ff6363;
	text-align: right;
	padding: 10px 200px 10px 50px;
	margin: -280px -10px 0px 700px;
	height: 260px;
}

input.Vendite {
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
</style>
</head>

<body>
	<div class="contenuto">
		<div class="header">
			<div class="titolo">
				<h1>Ortofrutta.</h1>
			</div>
		</div>
		<div class="aggiungi">
			<h4>Aggiungi un prodotto al magazzino</h4>
			<form action="aggiunta">
				Nome: <input type="text" name="nome" /><br> <br>
				Quantità: <input type="number" name="quantita" /><br> <br>
				Prezzo: <input type="number" name="prezzo" /><br> <br>
				Descrizione: <input type="text" name="descrizione" /> <input
					type="submit" name="aggiunta" value="aggiunta" />
			</form>
		</div>
		<div id="Acquista">
			<h4 class="Acquista">Acquista un prodotto</h4>

			<form action="acquisto">

				<label for="nomeParametro">Scegli il prodotto:</label> <input
					type="text" name="nomeParametro"> <br><br/> <label
					for="limit">Inserisci quantità:</label> <input type="number"
					id="limit" min="1" max="100" name="limit"> <br> <br>
				<input type="submit" value="Acquista">
			</form>
		</div>
		<div id="Magazzino">
			<h4>Vedi il Magazzino</h4>
			<form action="magazzino">
				<input type="submit" name="magazzino" value="Magazzino"
					class="Magazzino">
			</form>
		</div>
		<div id="Vendite">
			<h4>Vedi le vendite totali</h4>
			<form action="vendite">
				<input type="submit" name="" value="Vendite" class="Vendite">
			</form>
		</div>
	</div>
</body>
</html>

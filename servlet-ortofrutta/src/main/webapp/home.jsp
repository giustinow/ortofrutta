<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<title>Gestione Ortofrutta</title>
</head>
<body>
	<h1>Gestione Ortofrutta</h1>
	<h3>Benvenuti nel nostro sito di Ortofrutta</h3>
	<h4>Vedi il Magazzino</h4>
	<form action="magazzino">
		<input type="submit" name="magazzino" value="Magazzino">
	</form>
	<br>
	<h4>Vedi le vendite totali</h4>
	<form action="vendite">
		<input type="submit" name="vendite" value="Vendite">
	</form>
	<h4>Acquista un prodotto</h4>
	<form action="acquista">
		<input type="submit" name="acquista" value="Acquista">
	</form>
</body>
</html>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Errore</title>
</head>
<style>
body{
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
	margin-right: 100px;
}
.contenuto{
margin-top: 200px;
}
</style>

<body>
	<div class="contenuto">
		<h1>Eh... Volevi!</h1>
		<h3>E che dire, sembra che da qui non puoi vedere la pagina.</h3>
		<form action="home">
			<input type="submit" value="Home" class="home">

		</form>
	</div>
</body>
</html>
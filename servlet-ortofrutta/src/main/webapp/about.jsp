<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About.</title>
</head>
<style>
body{
background-color: #f2fff3;
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
.contenuto{
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
a.home {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 10px 20px;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin-right: 50px;
}
</style>

<body>
<div class="header">
		<div class="titolo">
			<h1>Ortofrutta.</h1>
		</div>
	</div>
	<div class="contenuto">
	<h1>Salve!</h1>
	<h4>Noi siamo l'ortofrutta più piccola al mondo!</h4>
	<h5>Il team è formato da:</h5>
	<p>Justine: il proprietario</p>
	<p>Guillermo: il commesso</p>
	<p>Daniele: il muratore (extra)</p>
	<br> <br>
		<div>
			<a href="javascript:history.back()" class="home">Torna Indietro</a>
		</div>
	</div>
</body>
</html>
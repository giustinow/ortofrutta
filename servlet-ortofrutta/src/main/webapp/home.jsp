
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
	background-color: #ffffff;
	font-size: 150%;
	font-family: Arial;
	letter-spacing: 0.1em;
	line-height: 25px;
	width: 102%;
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
	margin: -45px 50px 50px 700px;
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

* {
  box-sizing: border-box;
}
/* Create two equal columns that floats next to each other */
.column {
background-color: #ffffff;
  float: left;
  width: 50%;
  padding: 135px 0px 208px 150px;

}
.column1{
background-color: #ffb963;
  float: right;
  width: 50%;
  padding: 300px 0px 310px 300px;
}
.row{
width:100%;
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
					<li><a href="http://localhost:8080/servlet-ortofrutta/">Home</a></li>
					<li><a
						href="http://localhost:8080/servlet-ortofrutta/prodotti?">Prodotti</a></li>
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
		<div class="row">
			<div class="column">
					<form action="accesso" class="accedi" method="get">
						<h4>Accedi al tuo account</h4>
						Username: <input type="text" name="username" required="required" />
						<br> <br> <input type="submit" name="accedi"
							value="Accedi" class="Magazzino" />
					</form>
			</div>
		
			<div class="column1">
					<h4 class="">Registrati!</h4>
					<form action="registrazione" method="post">
						Username: <input type="text" name="username" required="required" /><br>
						<br> Et�: <input type="number" name="eta" min="18" max="120"
							required="required" /> <br> <br> <input type="submit"
							name="registrati" value="Registrati" class="Magazzino" />
					</form>
			</div>
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

<%@page import="it.dstech.ortofrutta.Vendite"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Acquisto.</title>
</head>
<style>
table, th, td {
	border: 0.5px solid black;
}
</style>

<body>
	<%
		List<Vendite> elencoVendite = (List<Vendite>) request.getAttribute("acquisto");
	%>
	<table>
		<tr>
			<th>Nome</th>
			<th>Quantita</th>
		</tr>
		<%for (Vendite lista : elencoVendite) {%>
		<tr>
			<td><%=lista.getNome()%></td>
			<td><%=lista.getQuantita()%></td>
		</tr>
		<%
			}
		%>
	</table>

	<h4>Acquisto Effettuato!</h4>
	<form action="home">
		<input type="submit" value="Torna Indietro">

	</form>
</body>
</html>
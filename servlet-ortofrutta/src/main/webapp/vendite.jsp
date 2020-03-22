<%@page import="it.dstech.ortofrutta.Vendite"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
table, th, td {
	border: 0.5px solid black;
}
</style>

<body>

	<%
		List<Vendite> elencoVendite = (List<Vendite>)request.getAttribute("vendite");
	%>
	<table>
		<tr>
			<th>Nome</th>
			<th>Quantita</th>
		</tr>
		<%for (Vendite lista : elencoVendite) {	%>
		<tr>
			<td><%=lista.getNome()%></td>
			<td><%=lista.getQuantita()%></td>
		</tr>
		<%}%>
	</table>
	<form action="home">
		<input type="submit" value="Torna Indietro">

	</form>
</body>
</html>
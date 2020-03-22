<%@page import="it.dstech.ortofrutta.Magazzino"%>
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
		List<Magazzino> elencoMagazzino = (List<Magazzino>)request.getAttribute("magazzino");
	%>
	<table>
		<tr>
			<th>Id</th>
			<th>Nome</th>
			<th>Quantita</th>
			<th>Prezzo</th>
			<th>Descrizione</th>
		</tr>
		<%for (Magazzino lista : elencoMagazzino) {	%>
		<tr>
			<td><%=lista.getId()%></td>
			<td><%=lista.getNome()%></td>
			<td><%=lista.getQuantita()%></td>
			<td><%=lista.getPrezzo()%></td>
			<td><%=lista.getDescrizione()%></td>
		</tr>
		<%}%>
	</table>
	<form action="home.jsp">
		<input type="submit" value="Torna Indietro">

	</form>
</body>
</html>
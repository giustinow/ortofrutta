package it.dstech.ortofrutta.owner;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.dstech.ortofrutta.gestionedb.GestioneDB;

public class ServletEliminaProdotto extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nome = req.getParameter("nome");
		try {
			GestioneDB gestione = new GestioneDB();
			gestione.deleteProdotto(nome);
			gestione.deleteProdottoVendite(nome);
			gestione.closeConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}req.getRequestDispatcher("magazzino").forward(req, resp);
	}
}

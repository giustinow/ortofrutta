package it.dstech.ortofrutta.owner;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.dstech.ortofrutta.gestionedb.GestioneDB;

public class ServletEliminaUtente extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		try {
			GestioneDB gestione = new GestioneDB();
			gestione.deleteUtente(username);
			gestione.closeConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}req.getRequestDispatcher("lista-utenti").forward(req, resp);
	}
}

package it.dstech.ortofrutta.costumer;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.dstech.ortofrutta.Scontrino;
import it.dstech.ortofrutta.Utente;
import it.dstech.ortofrutta.gestionedb.GestioneDB;

public class ServletRegistrazioneUtente extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("messaggio", "hai provato a fare l'accesso all'acquisto di un prodotto dalla get");
		req.getRequestDispatcher("errore.jsp").forward(req, resp);

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		int eta = Integer.parseInt(req.getParameter("eta"));
		Utente utente = new Utente(username, eta, 0);
		try {
			GestioneDB gestioneDB = new GestioneDB();
			if (gestioneDB.checkEsistenzaUtente(username)) {
				gestioneDB.aggiungiNuovoUtente(utente);
				req.setAttribute("username", utente.getUsername());
				req.getRequestDispatcher("profiloUtente.jsp").forward(req, resp);
				gestioneDB.closeConnection();
			} else {
				req.getRequestDispatcher("erroreRegistrazione.jsp").forward(req, resp);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}
}

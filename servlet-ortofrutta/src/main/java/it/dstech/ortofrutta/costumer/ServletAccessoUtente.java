package it.dstech.ortofrutta.costumer;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.dstech.ortofrutta.gestionedb.GestioneDB;

public class ServletAccessoUtente extends HttpServlet {
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.setAttribute("messaggio", "hai provato a fare l'accesso all'acquisto di un prodotto dalla get");
//		req.getRequestDispatcher("errore.jsp").forward(req, resp);
//
//	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		try {
			GestioneDB gestioneDB = new GestioneDB();
			if (gestioneDB.checkCredenzialiProprietario(username)) {
				req.getRequestDispatcher("admin.jsp").forward(req, resp);
			} else {
				if (!gestioneDB.checkEsistenzaUtente(username)) {
					req.setAttribute("username", username);
					req.getRequestDispatcher("profiloUtente.jsp").forward(req, resp);
				} else {
					req.getRequestDispatcher("utenteNonEsistente.jsp").forward(req, resp);
				}
			}
			gestioneDB.closeConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}

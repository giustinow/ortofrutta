package it.dstech.ortofrutta.home;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.dstech.ortofrutta.gestionedb.GestioneDB;

public class ServletRiepilogoCarrello extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		try {
			GestioneDB gestioneDB = new GestioneDB();
			req.setAttribute("username", username);
			req.setAttribute("totale", gestioneDB.totaleDaPagare());
			req.setAttribute("carrello", gestioneDB.stampaCarrello());
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		req.getRequestDispatcher("riepilogoCarrello.jsp").forward(req, resp);
	}
}

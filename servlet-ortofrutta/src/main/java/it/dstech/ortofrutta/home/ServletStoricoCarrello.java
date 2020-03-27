package it.dstech.ortofrutta.home;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.dstech.ortofrutta.Carrello;
import it.dstech.ortofrutta.gestionedb.GestioneDB;

public class ServletStoricoCarrello extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("idScontrino"));
		try {
			GestioneDB gestioneDB = new GestioneDB();
			List<Carrello> stampaStoricoProdotti = gestioneDB.stampaStoricoProdotti(id);
			req.setAttribute("carrello", stampaStoricoProdotti);
			req.setAttribute("idScontrino", id);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		req.getRequestDispatcher("listaProdottiScontrini.jsp").forward(req, resp);
	}
}

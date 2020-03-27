package it.dstech.ortofrutta.home;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.dstech.ortofrutta.Scontrino;
import it.dstech.ortofrutta.ScontrinoRetrieve;
import it.dstech.ortofrutta.gestionedb.GestioneDB;

public class ServletStoricoAcquisti extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		try {
			GestioneDB gestioneDB = new GestioneDB();
			List<ScontrinoRetrieve> stampaScontriniUtente = gestioneDB.stampaScontriniUtente(username);
			List<Integer>stampaIdScontrino = gestioneDB.stampaIdScontrino(username);
			req.setAttribute("scontrini", stampaScontriniUtente);
			req.setAttribute("idScontrini", stampaIdScontrino);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		req.getRequestDispatcher("listaScontrini.jsp").forward(req, resp);	
	}
}

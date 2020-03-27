package it.dstech.ortofrutta.home;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.dstech.ortofrutta.gestionedb.GestioneDB;

public class ServletAccessoUtente extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		try {
			GestioneDB gestioneDB = new GestioneDB();
			if(!gestioneDB.checkEsistenzaUtente(username)) {
				req.setAttribute("username", username);
				req.getRequestDispatcher("profiloUtente.jsp").forward(req, resp);
			}else {
				req.getRequestDispatcher("utenteNonEsistente.jsp").forward(req, resp);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}

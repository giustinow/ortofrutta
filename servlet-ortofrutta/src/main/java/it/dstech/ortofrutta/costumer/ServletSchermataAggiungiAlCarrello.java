package it.dstech.ortofrutta.costumer;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.dstech.ortofrutta.Scontrino;
import it.dstech.ortofrutta.Utente;
import it.dstech.ortofrutta.gestionedb.GestioneDB;

public class ServletSchermataAggiungiAlCarrello extends HttpServlet {
	@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String username = req.getParameter("username");
			try {
				GestioneDB gestioneDB = new GestioneDB();
				List<String> lista = gestioneDB.getListaMagazzino();
				req.setAttribute("magazzino", lista);
				req.setAttribute("username", username);
				gestioneDB.closeConnection();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			req.getRequestDispatcher("nuovoCarrello.jsp").forward(req, resp);
	}

}

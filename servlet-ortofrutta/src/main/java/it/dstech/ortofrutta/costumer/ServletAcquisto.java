package it.dstech.ortofrutta.costumer;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.dstech.ortofrutta.Scontrino;
import it.dstech.ortofrutta.gestionedb.GestioneDB;

public class ServletAcquisto extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		double totale = Double.parseDouble(req.getParameter("totale"));
		String username = req.getParameter("username");
		Scontrino scontrino = new Scontrino(currentDate(), 0, totale, username);
		try {
			GestioneDB gestioneDB = new GestioneDB();
			gestioneDB.nuovoScontrino(scontrino);
			gestioneDB.updateIdProdottoScontrino(username);
			gestioneDB.updateIdScontrinoCarrello(gestioneDB.idScontrino());
			req.setAttribute("idScontrino", gestioneDB.idScontrino());
			req.setAttribute("scontrino", scontrino);
			req.setAttribute("username", username);
			req.getRequestDispatcher("acquistoRiuscito.jsp").forward(req, resp);
			gestioneDB.closeConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	public static String currentDate() {
		Date todaysDate = new Date();
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		return df.format(todaysDate);
	}
}

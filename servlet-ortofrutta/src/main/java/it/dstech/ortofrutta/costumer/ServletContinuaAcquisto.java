package it.dstech.ortofrutta.costumer;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.dstech.ortofrutta.Scontrino;
import it.dstech.ortofrutta.gestionedb.GestioneDB;

public class ServletContinuaAcquisto extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nome = req.getParameter("nomeParametro");
		int quantita = Integer.parseInt(req.getParameter("limit"));
		try {
			GestioneDB gestioneDB = new GestioneDB();
			if (gestioneDB.checkQuantitaProdotto(quantita, nome)) {
				double prezzoProdotto = gestioneDB.prezzoProdotto(nome);
				double totale = gestioneDB.prezzoProdotto(nome) * quantita;
				gestioneDB.aggiungiAlCarrello(nome, quantita, prezzoProdotto, totale, 0);
				gestioneDB.sottraiProdottoDalMagazzino(nome, quantita);
				req.getRequestDispatcher("compra").forward(req, resp);
			} else {
				req.getRequestDispatcher("erroreAcquisto.jsp").forward(req, resp);
			}
			gestioneDB.closeConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}

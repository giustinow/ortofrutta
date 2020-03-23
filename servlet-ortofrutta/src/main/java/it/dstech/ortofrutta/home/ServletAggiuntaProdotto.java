package it.dstech.ortofrutta.home;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.dstech.ortofrutta.Magazzino;
import it.dstech.ortofrutta.Vendite;
import it.dstech.ortofrutta.gestionedb.GestioneDB;

public class ServletAggiuntaProdotto extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nome = req.getParameter("nome");
		int quantita = Integer.parseInt(req.getParameter("quantita"));
		double prezzo = Double.parseDouble(req.getParameter("prezzo"));
		String descrizione = req.getParameter("descrizione");
		Magazzino magazzino = new Magazzino(nome, quantita, prezzo, descrizione);
		Vendite vendite = new Vendite(nome, quantita);
		try {
			GestioneDB gestioneDB = new GestioneDB();
			boolean checkEsistenzaProdotto = gestioneDB.checkEsistenzaProdotto(nome);
			if (checkEsistenzaProdotto) {
				gestioneDB.aggiungiProdottoVendite(vendite);
				gestioneDB.aggiungiProdottoMagazzino(magazzino);
				req.getRequestDispatcher("home").forward(req, resp);
			}else {
				req.getRequestDispatcher("erroreAcquisto.jsp").forward(req, resp);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}


	}

}

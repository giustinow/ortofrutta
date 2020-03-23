package it.dstech.ortofrutta.home;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.dstech.ortofrutta.Vendite;
import it.dstech.ortofrutta.gestionedb.GestioneDB;

public class ServletAcquisto extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("messaggio", "hai provato a fare l'accesso all'aggiunta di un prodotto dalla get");
		req.getRequestDispatcher("home").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nome = req.getParameter("nomeParametro");
		int quantita = Integer.parseInt(req.getParameter("limit"));
		try {
			GestioneDB gestioneDB = new GestioneDB();
			if (gestioneDB.checkQuantitaProdotto(quantita, nome)) {
				gestioneDB.acquistaProdotto(nome, quantita);
				req.getRequestDispatcher("acquistoRiuscito.jsp").forward(req, resp);
			} else {
				req.getRequestDispatcher("erroreAcquisto.jsp").forward(req, resp);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}

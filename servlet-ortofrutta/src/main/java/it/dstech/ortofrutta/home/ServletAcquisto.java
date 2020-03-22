package it.dstech.ortofrutta.home;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ServletAcquisto extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nome = req.getParameter("nomeParametro");
		int quantita = Integer.parseInt(req.getParameter("limit"));
		try {
		getAcquisto(quantita, nome);
			req.setAttribute("acquisto", "Acquisto effettuato");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		req.getRequestDispatcher("acquisto.jsp").forward(req, resp);
	}

	public static void getAcquisto(int quantita, String nome) throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String password = "pavillion";
		String username = "root";
		String url = "jdbc:mysql://localhost:3306/Ortofrutta?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=UTC&createDatabaseIfNotExist=true&allowPublicKeyRetrieval=true&useSSL=false";
		Connection connessione = DriverManager.getConnection(url, username, password);
		String queryUpdateVendite = "UPDATE Ortofrutta.Vendite SET quantita = quantita + ? WHERE nome = ?"; 
		PreparedStatement statementVendite = connessione.prepareStatement(queryUpdateVendite);
		statementVendite.setInt(1, quantita);
		statementVendite.setString(2, nome);
		statementVendite.executeQuery();
		String queryUpdateMagazzino = "UPDATE Ortofrutta.Magazzino SET quantita = quantita - ? WHERE nome = ?";
		PreparedStatement statementMagazzino = connessione.prepareStatement(queryUpdateMagazzino);
		statementMagazzino.setInt(1, quantita);
		statementMagazzino.setString(2, nome);
		statementMagazzino.executeQuery();
		connessione.close();
	}
}

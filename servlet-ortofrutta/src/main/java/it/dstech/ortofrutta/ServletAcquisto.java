package it.dstech.ortofrutta;

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

public class ServletAcquisto extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		int quantita = Integer.parseInt(req.getParameter("quantita"));
		try {
			req.setAttribute("acquisto", getAcquisto(quantita, id));
			getAcquisto(quantita, id);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		req.getRequestDispatcher("acquisto.jsp").forward(req, resp);
	}
	public static boolean getAcquisto(int quantita, int id) throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String password = "pavillion";
		String username = "root";
		String url = "jdbc:mysql://localhost:3306/Ortofrutta?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=UTC&createDatabaseIfNotExist=true&allowPublicKeyRetrieval=true&useSSL=false";
		Connection connessione = DriverManager.getConnection(url, username, password);
		String queryUpdateMagazzino = "update Ortofrutta.Magazzino set quantità = quantità - ? where id = ?";
		String queryUpdateVendite = "update Ortofrutta.Vendite set quantità = quantità + ? where id = ?";
		PreparedStatement statementVendite = connessione.prepareStatement(queryUpdateVendite);
		PreparedStatement statementMagazzino = connessione.prepareStatement(queryUpdateMagazzino);
		statementVendite.setInt(1, quantita);
		statementVendite.setInt(2, id);
		statementMagazzino.setInt(1, quantita);
		statementMagazzino.setInt(2, id);
		statementMagazzino.executeQuery();
		statementVendite.executeQuery();
		connessione.close();
		return true;
	}
}

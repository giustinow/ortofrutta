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

import it.dstech.ortofrutta.Magazzino;

public class ServletMagazzino extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setAttribute("magazzino", getMagazzino());
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		req.getRequestDispatcher("magazzino.jsp").forward(req, resp);	
		super.doGet(req, resp);
	}

	public static List<Magazzino> getMagazzino() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String password = "melascordosempredal1993";
		String username = "root";
		String url = "jdbc:mysql://localhost:3306/Ortofrutta?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=UTC&createDatabaseIfNotExist=true&allowPublicKeyRetrieval=true&useSSL=false";
		Connection connessione = DriverManager.getConnection(url, username, password);
		PreparedStatement statement = connessione.prepareStatement("select * from Ortofrutta.Magazzino");

		List<Magazzino> elencoMagazzino = new ArrayList<>();
		ResultSet risultatoQuery = statement.executeQuery();
		while (risultatoQuery.next()) {
			int id = risultatoQuery.getInt("id");
			String nome = risultatoQuery.getString("nome");
			int quantita = risultatoQuery.getInt("quantita");
			double prezzo = risultatoQuery.getInt("prezzo");
			String descrizione = risultatoQuery.getString("descrizione");
			Magazzino magazzino = new Magazzino(id, nome, quantita, prezzo, descrizione);
			elencoMagazzino.add(magazzino);
		}
		connessione.close();
		return elencoMagazzino;
	}

}

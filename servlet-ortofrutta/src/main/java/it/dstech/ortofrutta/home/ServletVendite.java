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



public class ServletVendite extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			req.setAttribute("vendite", getVendite());
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		req.getRequestDispatcher("vendite.jsp").forward(req, resp);
	}

	public static List<Vendite> getVendite() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String password = "pavillion";
		String username = "root";
		String url = "jdbc:mysql://localhost:3306/Ortofrutta?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=UTC&createDatabaseIfNotExist=true&allowPublicKeyRetrieval=true&useSSL=false";
		Connection connessione = DriverManager.getConnection(url, username, password);
		PreparedStatement statement = connessione.prepareStatement("select * from Ortofrutta.Vendite");

		List<Vendite> elencoVendite = new ArrayList<>();
		ResultSet risultatoQuery = statement.executeQuery();
		while (risultatoQuery.next()) {
			String nome = risultatoQuery.getString("nome");
			int quantita = risultatoQuery.getInt("quantita");
			Vendite vendite = new Vendite(nome, quantita);
			elencoVendite.add(vendite);
		}
		connessione.close();
		return elencoVendite;
	}

}

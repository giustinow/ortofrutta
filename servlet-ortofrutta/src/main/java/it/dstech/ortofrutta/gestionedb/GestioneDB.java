package it.dstech.ortofrutta.gestionedb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import it.dstech.ortofrutta.Magazzino;
import it.dstech.ortofrutta.Vendite;

public class GestioneDB {
	private String username;
	private String password;
	private String url;
	private Connection connessione;
	private Statement statement;

	public GestioneDB() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		this.username = "NyyghtS5aZ";
		this.password = "TmAHe7mWCl";
		this.url = "jdbc:mysql://remotemysql.com:3306/NyyghtS5aZ?useUnicode=true&useLegacyDatetime"
				+ "Code=false&serverTimezone=UTC&createDatabaseIfNotExist=true&allowPublicKeyRetrieval=true&useSSL=false";
		this.connessione = DriverManager.getConnection(url, username, password);
		this.statement = connessione.createStatement();
	}

	public void aggiungiProdottoMagazzino(Magazzino magazzino) throws SQLException {
		String queryInserimento = "INSERT INTO NyyghtS5aZ.Magazzino (`nome`, `quantita`, `prezzo`, `descrizione`) VALUES (?, ?, ?, ?)";
		PreparedStatement statement = connessione.prepareStatement(queryInserimento);
		statement.setString(1, magazzino.getNome());
		statement.setInt(2, magazzino.getQuantita());
		statement.setDouble(3, magazzino.getPrezzo());
		statement.setString(4, magazzino.getDescrizione());
		statement.execute();
	}

	public void aggiungiProdottoVendite(Vendite vendite) throws SQLException {
		String queryInserimento = "INSERT INTO NyyghtS5aZ.Vendite (`nome`, `quantita`) VALUES (?, ?)";
		PreparedStatement statement = connessione.prepareStatement(queryInserimento);
		statement.setString(1, vendite.getNome());
		statement.setInt(2, 0);
		statement.execute();
	}

	public void acquistaProdotto(String nome, int quantita) throws SQLException {
		String queryUpdateVendite = "UPDATE NyyghtS5aZ.Vendite SET quantita = quantita + ? WHERE nome = ?";
		PreparedStatement statementVendite = connessione.prepareStatement(queryUpdateVendite);
		statementVendite.setInt(1, quantita);
		statementVendite.setString(2, nome);
		statementVendite.execute();
		String queryUpdateMagazzino = "UPDATE NyyghtS5aZ.Magazzino SET quantita = quantita - ? WHERE nome = ?";
		PreparedStatement statementMagazzino = connessione.prepareStatement(queryUpdateMagazzino);
		statementMagazzino.setInt(1, quantita);
		statementMagazzino.setString(2, nome);
		statementMagazzino.execute();
	}

	public List<Magazzino> getMagazzino() throws ClassNotFoundException, SQLException {
		PreparedStatement statement = connessione.prepareStatement("select * from NyyghtS5aZ.Magazzino");
		List<Magazzino> elencoMagazzino = new ArrayList<>();
		ResultSet risultatoQuery = statement.executeQuery();
		while (risultatoQuery.next()) {
			String nome = risultatoQuery.getString("nome");
			int quantita = risultatoQuery.getInt("quantita");
			double prezzo = risultatoQuery.getInt("prezzo");
			String descrizione = risultatoQuery.getString("descrizione");
			Magazzino magazzino = new Magazzino(nome, quantita, prezzo, descrizione);
			elencoMagazzino.add(magazzino);
		}
		connessione.close();
		return elencoMagazzino;
	}
	public List<String> getProdottiMagazzino() throws ClassNotFoundException, SQLException {
		PreparedStatement statement = connessione.prepareStatement("select * from NyyghtS5aZ.Magazzino");
		List<String> elencoMagazzino = new ArrayList<>();
		ResultSet risultatoQuery = statement.executeQuery();
		while (risultatoQuery.next()) {
			String nome = risultatoQuery.getString("nome");
			int quantita = risultatoQuery.getInt("quantita");
			double prezzo = risultatoQuery.getInt("prezzo");
			String descrizione = risultatoQuery.getString("descrizione");
			Magazzino magazzino = new Magazzino(nome, quantita, prezzo, descrizione);
			elencoMagazzino.add(magazzino.getNome());
		}
		connessione.close();
		return elencoMagazzino;
	}
}

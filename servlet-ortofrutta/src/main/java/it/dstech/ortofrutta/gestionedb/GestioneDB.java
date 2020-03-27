package it.dstech.ortofrutta.gestionedb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import it.dstech.ortofrutta.Carrello;
import it.dstech.ortofrutta.Magazzino;
import it.dstech.ortofrutta.Scontrino;
import it.dstech.ortofrutta.ScontrinoRetrieve;
import it.dstech.ortofrutta.Utente;
import it.dstech.ortofrutta.Vendite;

public class GestioneDB {
	private String username;
	private String password;
	private String url;
	private Connection connessione;
	private Statement statement;

	public GestioneDB() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		this.username = "root";
		this.password = "pavillion";
		this.url = "jdbc:mysql://localhost:3306/Ortofrutta?useUnicode=true&useLegacyDatetime"
				+ "Code=false&serverTimezone=UTC&createDatabaseIfNotExist=true&allowPublicKeyRetrieval=true&useSSL=false";
		this.connessione = DriverManager.getConnection(url, username, password);
		this.statement = connessione.createStatement();
	}

	public void aggiungiProdottoMagazzino(Magazzino magazzino) throws SQLException {
		String queryInserimento = "INSERT INTO Ortofrutta.Magazzino (`nome`, `quantita`, `prezzo`, `descrizione`) VALUES (?, ?, ?, ?)";
		PreparedStatement statement = connessione.prepareStatement(queryInserimento);
		statement.setString(1, magazzino.getNome());
		statement.setInt(2, magazzino.getQuantita());
		statement.setDouble(3, magazzino.getPrezzo());
		statement.setString(4, magazzino.getDescrizione());
		statement.execute();
	}

	public void aggiungiProdottoVendite(Vendite vendite) throws SQLException {
		String queryInserimento = "INSERT INTO Ortofrutta.Vendite (`nome`, `quantita`) VALUES (?, ?)";
		PreparedStatement statement = connessione.prepareStatement(queryInserimento);
		statement.setString(1, vendite.getNome());
		statement.setInt(2, 0);
		statement.execute();
	}

	public List<Vendite> getVendite() throws SQLException, ClassNotFoundException {
		PreparedStatement statement = connessione.prepareStatement("select * from Ortofrutta.Vendite");
		List<Vendite> elencoVendite = new ArrayList<>();
		ResultSet risultatoQuery = statement.executeQuery();
		while (risultatoQuery.next()) {
			String nome = risultatoQuery.getString("nome");
			int quantita = risultatoQuery.getInt("quantita");
			Vendite vendite = new Vendite(nome, quantita);
			elencoVendite.add(vendite);
		}
		return elencoVendite;
	}

	public List<Magazzino> getMagazzino() throws ClassNotFoundException, SQLException {
		PreparedStatement statement = connessione.prepareStatement("select * from Ortofrutta.Magazzino");
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

		return elencoMagazzino;
	}

	public List<String> getListaMagazzino() throws SQLException {
		PreparedStatement statement = connessione.prepareStatement("select nome from Ortofrutta.Magazzino");
		ResultSet risultatoQuery = statement.executeQuery();
		List<String> elenco = new ArrayList<>();
		while (risultatoQuery.next()) {
			String nome = risultatoQuery.getString("nome");
			elenco.add(nome);
		}
		return elenco;
	}

	public boolean checkEsistenzaProdotto(String nome) throws SQLException {
		PreparedStatement prepareStatement = connessione
				.prepareStatement("select nome from Ortofrutta.Magazzino where nome = ?");
		prepareStatement.setString(1, nome);
		ResultSet risultato = prepareStatement.executeQuery();
		while (risultato.next()) {
			if (nome.equals(risultato.getString("nome"))) {
				connessione.close();
				return false;
			}
		}
		return true;
	}

	public boolean checkQuantitaProdotto(int quantita, String nome) throws SQLException {
		PreparedStatement prepareStatement = connessione
				.prepareStatement("select quantita from Ortofrutta.Magazzino where nome = ?");
		prepareStatement.setString(1, nome);
		ResultSet risultato = prepareStatement.executeQuery();
		while (risultato.next()) {
			if (quantita > risultato.getInt("quantita")) {
				return false;
			}
		}
		return true;
	}

	public void aggiungiNuovoUtente(Utente utente) throws SQLException {
		String queryInserimento = "INSERT INTO Ortofrutta.Utente (`username`, `eta`, `idScontrino`) VALUES (?, ?, ?)";
		PreparedStatement statement = connessione.prepareStatement(queryInserimento);
		statement.setString(1, utente.getUsername());
		statement.setInt(2, utente.getEta());
		statement.setInt(3, utente.getIdScontrino());
		statement.execute();
	}

	public boolean checkEsistenzaUtente(String username) throws SQLException {
		PreparedStatement prepareStatement = connessione.prepareStatement("select username from Ortofrutta.Utente");
		ResultSet risultato = prepareStatement.executeQuery();
		while (risultato.next()) {
			if (username.equals(risultato.getString("username"))) {
				return false;
			}
		}
		return true;
	}

	public void aggiungiAlCarrello(String nome, int quantita, double prezzo, double totale, int idScontrino)
			throws SQLException {
		String queryInserimento = "INSERT INTO Ortofrutta.Carrello (`nome`, `quantita`, `prezzo`,`totale` , `idScontrino`) VALUES (?, ?, ?, ?, ?)";
		PreparedStatement statement = connessione.prepareStatement(queryInserimento);
		statement.setString(1, nome);
		statement.setInt(2, quantita);
		statement.setDouble(3, prezzo);
		statement.setDouble(4, totale);
		statement.setInt(5, idScontrino);
		statement.execute();
	}

	public void nuovoScontrino(Scontrino scontrino) throws SQLException {
		String queryInserimento = "INSERT INTO Ortofrutta.Scontrino (`data`, `idProdotto`, `totale`, `username`) VALUES (?, ?, ?, ?)";
		PreparedStatement statement = connessione.prepareStatement(queryInserimento);
		statement.setString(1, scontrino.getData());
		statement.setInt(2, scontrino.getIdProdotto());
		statement.setDouble(3, scontrino.getTotale());
		statement.setString(4, scontrino.getUsername());
		statement.execute();
	}

	public void sottraiProdottoDalMagazzino(String nome, int quantita) throws SQLException {
		String queryUpdateVendite = "UPDATE Ortofrutta.Vendite SET quantita = quantita + ? WHERE nome = ?";
		PreparedStatement statementVendite = connessione.prepareStatement(queryUpdateVendite);
		statementVendite.setInt(1, quantita);
		statementVendite.setString(2, nome);
		statementVendite.execute();
		String queryUpdateMagazzino = "UPDATE Ortofrutta.Magazzino SET quantita = quantita - ? WHERE nome = ?";
		PreparedStatement statementMagazzino = connessione.prepareStatement(queryUpdateMagazzino);
		statementMagazzino.setInt(1, quantita);
		statementMagazzino.setString(2, nome);
		statementMagazzino.execute();
	}

	public int retrieveIdScontrino(String username) throws SQLException {
		PreparedStatement prepareStatement = connessione.prepareStatement(
				"select idScontrino from Ortofrutta.Scontrino where username = ? order by idScontrino desc");
		prepareStatement.setString(1, username);
		ResultSet risultato = prepareStatement.executeQuery();
		int idScontrino = 0;
		while (risultato.next()) {
			idScontrino = risultato.getInt("idScontrino");
		}
		return idScontrino;
	}

	public double prezzoProdotto(String nome) throws SQLException {
		PreparedStatement prepareStatement = connessione
				.prepareStatement("select prezzo from Ortofrutta.Magazzino where nome = ?");
		prepareStatement.setString(1, nome);
		ResultSet risultato = prepareStatement.executeQuery();
		double prezzo = 0;
		while (risultato.next()) {
			prezzo = risultato.getDouble("prezzo");
		}

		return prezzo;
	}

	public void costoTotaleScontrino(int totale, int idScontrino) throws SQLException {
		String queryUpdateVendite = "UPDATE Ortofrutta.Scontrino SET totale = totale + ? WHERE nome = ?";
		PreparedStatement statementVendite = connessione.prepareStatement(queryUpdateVendite);
		statementVendite.setInt(1, totale);
		statementVendite.setInt(2, idScontrino);
		statementVendite.execute();
	}

	public List<Carrello> stampaCarrello() throws SQLException {
		PreparedStatement statement = connessione
				.prepareStatement("select * from Ortofrutta.Carrello where idScontrino = 0");
		ResultSet risultatoQuery = statement.executeQuery();
		List<Carrello> elencoCarrello = new ArrayList<>();
		while (risultatoQuery.next()) {
			int idProdotto = risultatoQuery.getInt("idProdotto");
			String nome = risultatoQuery.getString("nome");
			int quantita = risultatoQuery.getInt("quantita");
			double prezzo = risultatoQuery.getDouble("prezzo");
			double totale = risultatoQuery.getDouble("totale");
			int idScontrino = risultatoQuery.getInt("idScontrino");
			Carrello carrello = new Carrello(idProdotto, nome, quantita, prezzo, totale, idScontrino);
			elencoCarrello.add(carrello);
		}
		return elencoCarrello;
	}

	public double totaleDaPagare() throws SQLException {
		PreparedStatement statement = connessione
				.prepareStatement("select totale from Ortofrutta.Carrello where idScontrino = 0");
		ResultSet risultatoQuery = statement.executeQuery();
		double totale = 0;
		while (risultatoQuery.next()) {
			totale = totale + risultatoQuery.getDouble("totale");
		}
		return totale;
	}

	public int idScontrino() throws SQLException {
		PreparedStatement statement = connessione.prepareStatement(
				"select idScontrino from Ortofrutta.Scontrino where idScontrino order by idScontrino desc limit 1");
		ResultSet risultatoQuery = statement.executeQuery();
		int idScontrino = 0;
		while (risultatoQuery.next()) {
			idScontrino = risultatoQuery.getInt("idScontrino");
		}
		return idScontrino;
	}

	public void updateIdProdottoScontrino(String username) throws SQLException {
		String queryUpdateVendite = "UPDATE `Ortofrutta`.`Scontrino` SET `idProdotto` = idScontrino WHERE (`idScontrino` = ?) and (`username` = ?) and (`idProdotto` = '0');";
		PreparedStatement statementVendite = connessione.prepareStatement(queryUpdateVendite);
		statementVendite.setInt(1, idScontrino());
		statementVendite.setString(2, username);
		statementVendite.execute();
	}
	public void updateIdScontrinoCarrello(int idScontrino) throws SQLException {
		String queryUpdateVendite = "UPDATE `Ortofrutta`.`Carrello` SET Carrello.idScontrino = ? WHERE idScontrino = 0;";
		PreparedStatement statementVendite = connessione.prepareStatement(queryUpdateVendite);
		statementVendite.setInt(1, idScontrino());
		statementVendite.execute();
	}

	public List<ScontrinoRetrieve> stampaScontriniUtente(String username) throws SQLException {
		PreparedStatement statement = connessione
				.prepareStatement("select * from Ortofrutta.Scontrino where username = ?");
		statement.setString(1, username);
		ResultSet risultatoQuery = statement.executeQuery();
		List<ScontrinoRetrieve> elencoCarrello = new ArrayList<>();
		while (risultatoQuery.next()) {
			int id = risultatoQuery.getInt("idScontrino");
			String data = risultatoQuery.getString("data");
			int idProdotto = risultatoQuery.getInt("idProdotto");
			double prezzo = risultatoQuery.getDouble("totale");
			String usernameScontrino = risultatoQuery.getString("username");
			ScontrinoRetrieve scontrino = new ScontrinoRetrieve(id, data, idProdotto, prezzo, usernameScontrino);
			elencoCarrello.add(scontrino);
		}
		return elencoCarrello;
	}

	public List<Integer> stampaIdScontrino(String username) throws SQLException {
		PreparedStatement statement = connessione
				.prepareStatement("select idScontrino from Ortofrutta.Scontrino where username = ?");
		statement.setString(1, username);
		ResultSet risultatoQuery = statement.executeQuery();
		List<Integer> elencoCarrello = new ArrayList<>();
		while (risultatoQuery.next()) {
			int idProdotto = risultatoQuery.getInt("idScontrino");
			elencoCarrello.add(idProdotto);
		}
		return elencoCarrello;
	}

	
	public List<Carrello> stampaStoricoProdotti(int idScontrino) throws SQLException {
		PreparedStatement statement = connessione
				.prepareStatement("select * from Ortofrutta.Carrello where idScontrino = ?");
		statement.setInt(1, idScontrino);
		ResultSet risultatoQuery = statement.executeQuery();
		List<Carrello> elencoCarrello = new ArrayList<>();
		while (risultatoQuery.next()) {
			int idProdotto = risultatoQuery.getInt("idProdotto");
			String nome = risultatoQuery.getString("nome");
			int quantita = risultatoQuery.getInt("quantita");
			double prezzo = risultatoQuery.getDouble("prezzo");
			double totale = risultatoQuery.getDouble("totale");
			int scontrino = risultatoQuery.getInt("idScontrino");
			Carrello carrello = new Carrello(idProdotto, nome, quantita, prezzo, totale, scontrino);
			elencoCarrello.add(carrello);
		}
		return elencoCarrello;
	}

}

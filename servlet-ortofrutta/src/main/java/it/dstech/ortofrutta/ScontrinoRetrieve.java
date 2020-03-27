package it.dstech.ortofrutta;

public class ScontrinoRetrieve {
	private int idScontrino;
	private String data;
	private int idProdotto;
	private double totale;
	private String username;

	public ScontrinoRetrieve(int idScontrino, String data, int idProdotto, double totale, String username) {
		this.idScontrino = idScontrino;
		this.data = data;
		this.idProdotto = idProdotto;
		this.totale = totale;
		this.username = username;
	}

	
	public int getIdScontrino() {
		return idScontrino;
	}


	public void setIdScontrino(int idScontrino) {
		this.idScontrino = idScontrino;
	}


	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public int getIdProdotto() {
		return idProdotto;
	}

	public void setIdProdotto(int idProdotto) {
		this.idProdotto = idProdotto;
	}

	public double getTotale() {
		return totale;
	}

	public void setTotale(double totale) {
		this.totale = totale;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}



}

package it.dstech.ortofrutta;

public class Carrello {
	private int idProdotto;
	private String nome;
	private int quantita;
	private double prezzo;
	private double totale;
	private int idScontrino;

	public Carrello(int idProdotto, String nome, int quantita, double prezzo, double totale, int idScontrino) {
		super();
		this.idProdotto = idProdotto;
		this.nome = nome;
		this.quantita = quantita;
		this.prezzo = prezzo;
		this.totale = totale;
		this.idScontrino = idScontrino;
	}

	public int getIdProdotto() {
		return idProdotto;
	}

	public void setIdProdotto(int idProdotto) {
		this.idProdotto = idProdotto;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getQuantita() {
		return quantita;
	}

	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public double getTotale() {
		return totale;
	}

	public void setTotale(double totale) {
		this.totale = totale;
	}

	public int getIdScontrino() {
		return idScontrino;
	}

	public void setIdScontrino(int idScontrino) {
		this.idScontrino = idScontrino;
	}

}

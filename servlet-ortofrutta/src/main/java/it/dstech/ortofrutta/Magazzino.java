package it.dstech.ortofrutta;

public class Magazzino {
	private int id;
	private String nome;
	private int quantita;
	private double prezzo;
	private String descrizione;
	
	public Magazzino(int id, String nome, int quantita, double prezzo, String descrizione) {
		super();
		this.id = id;
		this.nome = nome;
		this.quantita = quantita;
		this.prezzo = prezzo;
		this.descrizione = descrizione;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	

}

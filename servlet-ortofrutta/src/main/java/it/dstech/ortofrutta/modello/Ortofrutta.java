package it.dstech.ortofrutta.modello;

public class Ortofrutta {
	private String nome;
	private int quantita;
	private double prezzo;
	public String descrizione;

	public Ortofrutta(String nome, int quantita, double prezzo, String descrizione) {
		super();
		this.nome = nome;
		this.quantita = quantita;
		this.prezzo = prezzo;
		this.descrizione = descrizione;
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Ortofrutta other = (Ortofrutta) obj;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Ortofrutta [nome=" + nome + ", quantita=" + quantita + ", prezzo=" + prezzo + ", descrizione="
				+ descrizione + "]";
	}

}

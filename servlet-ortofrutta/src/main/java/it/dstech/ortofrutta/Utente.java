package it.dstech.ortofrutta;

public class Utente {
	private String username;
	private int eta;
	private int idScontrino;
	public Utente(String username, int eta, int idScontrino) {
		super();
		this.username = username;
		this.eta = eta;
		this.idScontrino = idScontrino;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getEta() {
		return eta;
	}
	public void setEta(int eta) {
		this.eta = eta;
	}
	public int getIdScontrino() {
		return idScontrino;
	}
	public void setIdScontrino(int idScontrino) {
		this.idScontrino = idScontrino;
	}
	@Override
	public String toString() {
		return "Utente [username=" + username + ", eta=" + eta + ", idScontrino=" + idScontrino + "]";
	}
	
	
	
}


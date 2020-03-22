package it.dstech.ortofrutta;

public class Vendite {
private int id;
private String nome;
private int quantita;
public Vendite(int id, String nome, int quantita) {
	super();
	this.id = id;
	this.nome = nome;
	this.quantita = quantita;
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
@Override
public String toString() {
	return "Vendite [id=" + id + ", nome=" + nome + ", quantita=" + quantita + "]";
}

}

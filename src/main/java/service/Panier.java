package service;

public class Panier 
{
	  private int idproduit;
	  private String nomproduit;
	  private Double prix;
	  private int quantite;

	  public Panier(){}
	  
	  public Panier(int idproduit,String nomproduit,Double prix,int quantite) 
	  {
		  this.setidproduit(idproduit);
	      this.setnomproduit(nomproduit);
	      this.setprix(prix);
	      this.setquantite(quantite);
	  }

	public int getidproduit() {
		return idproduit;
	}

	public void setidproduit(int idproduit) {
		this.idproduit = idproduit;
	}

	public String getnomproduit() {
		return nomproduit;
	}

	public void setnomproduit(String nomproduit) {
		this.nomproduit = nomproduit;
	}

	public Double getprix() {
		return prix;
	}

	public void setprix(Double prix) {
		this.prix = prix;
	}

	public int getquantite() {
		return quantite;
	}

	public void setquantite(int quantite) {
		this.quantite = quantite;
	}

	
}

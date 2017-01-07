package service;
import java.sql.*;

public class HistoriquePrix 
{
	 private int idhistorique;
	 private int idproduit;
	 private double montant;
	 private Date datehisto;
	  
	 public HistoriquePrix(){}
	 public HistoriquePrix(int idhistorique,int idproduit, double montant, Date datehisto)
	 {
		  this.setidhistorique(idhistorique);
	      this.setidproduit(idproduit);
	      this.setmontant(montant);
	      this.setdatehisto(datehisto);
	 }
	public int getidhistorique() {
		return idhistorique;
	}

	public void setidhistorique(int idhistorique) {
		this.idhistorique = idhistorique;
	}

	public int getidproduit() {
		return idproduit;
	}

	public void setidproduit(int idproduit) {
		this.idproduit = idproduit;
	}

	public Date getdatehisto() {
		return datehisto;
	}

	public void setdatehisto(Date datehisto) {
		this.datehisto = datehisto;
	}

	public double getmontant() {
		return montant;
	}

	public void setmontant(double montant) {
		this.montant = montant;
	}
}

package service;
import java.sql.*;

public class Facture 
{
   private int idFacture;
   private Date dateFacture;
   private double montant;
   private double payer;
   private double resteApayer;
   
   public Facture(){}
   
   public Facture(int idFacture,Date dateFacture, double montant, double payer, double resteApayer) 
   {
      this.setidFacture(idFacture);
      this.setdateFacture(dateFacture);
      this.setMontant(montant);
      this.setPayer(payer);
      this.setResteApayer(resteApayer);
   }

   public int getidFacture() 
   {
      return this.idFacture;
   }

   public void setidFacture(int idFacture) 
   {
      this.idFacture = idFacture;
   }

   public Date getdateFacture() 
   {
      return this.dateFacture;
   }

   public void setdateFacture(Date dateFacture) 
   {
      this.dateFacture = dateFacture;
   }

public double getMontant() {
	return montant;
}

public void setMontant(double montant) {
	this.montant = montant;
}

public double getPayer() {
	return payer;
}

public void setPayer(double payer) {
	this.payer = payer;
}

public double getResteApayer() {
	return resteApayer;
}

public void setResteApayer(double resteApayer) {
	this.resteApayer = resteApayer;
}

}
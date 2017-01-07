package service;
import java.sql.*;

public class Prix
{
   private int idPrix;
   private double montant;
   private Date datePrix;
  
   public Prix(){}
   
   public Prix (int idPrix,double montant, Date datePrix) 
   {
      this.setidPrix(idPrix);
      this.setmontant(montant);
      this.setdatePrix(datePrix);
   }

   public int getidPrix() 
   {
      return this.idPrix;
   }

   public void setidPrix(int idPrix) 
   {
      this.idPrix = idPrix;
   }

   public double getmontant() 
   {
      return this.montant;
   }

   public void setmontant(double montant) 
   {
      this.montant = montant;
   }

    public Date getdatePrix() 
   {
      return this.datePrix;
   }

   public void setdatePrix(Date datePrix) 
   {
      this.datePrix = datePrix;
   }
  
  

}
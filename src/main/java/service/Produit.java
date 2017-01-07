package service;
import java.sql.*;

public class Produit 
{
   private int idProduit;
   private int idRayon;
   private int idPrix;
   private String nomProduit;
   private String refProduit;
   private int quantiteMin;
   private int quantiteMax;
 
   public Produit(){}
   
   public Produit (int idProduit,int idRayon, int idPrix, String nomProduit,String refProduit,int quantiteMin,int quantiteMax) 
   {
      this.setidProduit(idProduit);
      this.setidRayon(idRayon);
      this.setidPrix(idPrix);
      this.setnomProduit(nomProduit);
      this.setrefProduit(refProduit);
      this.setquantiteMin(quantiteMin);
      this.setquantiteMax(quantiteMax);
   }

   public int getidProduit() 
   {
      return this.idProduit;
   }

   public void setidProduit(int idProduit) 
   {
      this.idProduit = idProduit;
   }

   public int getidRayon() 
   {
      return this.idRayon;
   }

   public void setidRayon(int idRayon) 
   {
      this.idRayon = idRayon;
   }
   
   public int getidPrix() 
   {
      return this.idPrix;
   }

   public void setidPrix(int idPrix) 
   {
      this.idPrix = idPrix;
   }

   public String getnomProduit() 
   {
      return this.nomProduit;
   }

   public void setnomProduit(String nomProduit) 
   {
      this.nomProduit = nomProduit;
   }
   
   public String getrefProduit() 
   {
      return this.refProduit;
   }

   public void setrefProduit(String refProduit) 
   {
      this.refProduit = refProduit;
   }

   public int getquantiteMin() 
   {
      return this.quantiteMin;
   }

   public void setquantiteMin(int quantiteMin) 
   {
      this.quantiteMin = quantiteMin;
   }
   
   public int getquantiteMax() 
   {
      return this.quantiteMax;
   }

   public void setquantiteMax(int quantiteMax) 
   {
      this.quantiteMax = quantiteMax;
   }

}
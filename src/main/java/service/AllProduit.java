package service;

public class AllProduit 
{
	 private int idProduit;
	 private String nomRayon;
	 private double montant;
	 private String nomProduit;
	 private String refProduit;
	 private int quantiteMin;
	 private int quantiteMax;
         private int test

	 public AllProduit(){}
   
	 public AllProduit (int idProduit,String nomRayon, double montant, String nomProduit,String refProduit,int quantiteMin,int quantiteMax) 
	 {
      this.setidProduit(idProduit);
      this.setnomRayon(nomRayon);
      this.setmontant(montant);
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

	   public String getnomRayon() 
	   {
	      return this.nomRayon;
	   }

	   public void setnomRayon(String nomRayon) 
	   {
	      this.nomRayon = nomRayon;
	   }
	   
	   public double getmontant() 
	   {
	      return this.montant;
	   }

	   public void setmontant(double montant) 
	   {
	      this.montant = montant;
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

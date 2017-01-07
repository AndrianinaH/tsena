package service;
public class Achat 
{
 
   private int idAchat;
   private int idProduit;
   private int idFacture;
   private int nbAcheter;

   public Achat(){}
   
   public Achat(int idAchat,int idProduit,int idFacture, int nbAcheter) 
   {
      this.setidAchat(idAchat);
      this.setidProduit(idProduit);
      this.setidFacture(idFacture);
      this.setnbAcheter(nbAcheter);
   }

   public int getidAchat() 
   {
      return this.idAchat;
   }

   public void setidAchat(int idAchat) 
   {
      this.idAchat = idAchat;
   }
  
   public int getidProduit() 
   {
      return this.idProduit;
   }

   public void setidProduit(int idProduit) 
   {
      this.idProduit = idProduit;
   }

   public int getidFacture() 
   {
      return this.idFacture;
   }

   public void setidFacture(int idFacture) 
   {
      this.idFacture = idFacture;
   }

   public int getnbAcheter() 
   {
      return this.nbAcheter;
   }

   public void setnbAcheter(int nbAcheter) 
   {
      this.nbAcheter = nbAcheter;
   }
   
   

}
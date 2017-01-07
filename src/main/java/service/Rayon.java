package service;
import java.sql.*;

public class Rayon 
{
   private int idRayon;
   private String nomRayon;

   public Rayon(){}
   
   public Rayon(int idRayon,String nomRayon) 
   {
      this.setidRayon(idRayon);
      this.setnomRayon(nomRayon);
   }

   public int getidRayon() 
   {
      return this.idRayon;
   }

   public void setidRayon(int idRayon) 
   {
      this.idRayon = idRayon;
   }
  
   public String getnomRayon() 
   {
      return this.nomRayon;
   }

   public void setnomRayon(String nomRayon) 
   {
      this.nomRayon = nomRayon;
   }
}
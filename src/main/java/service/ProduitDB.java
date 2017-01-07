package service;

import java.sql.*;
import java.util.ArrayList;

public class ProduitDB 
{
	public Connection connection;
	public ProduitDB(Connection con)
	{
		this.connection=con;
	}
	
	public void insertProduit(int idrayon, int idprix, String nomProduit,String refProduit,int quantiteMin, int quantiteMax)throws Exception
	{
		String insert = "INSERT INTO produit(idrayon,idprix,nomProduit,quantiteMin,quantiteMax,refProduit) values(?,?,?,?,?,?)";
		PreparedStatement stmt = connection.prepareStatement(insert);
		stmt.setInt(1,idrayon);
		stmt.setInt(2,idprix);
		stmt.setString(3,nomProduit);
		stmt.setInt(4,quantiteMin);
		stmt.setInt(5,quantiteMax);
		stmt.setString(6,refProduit);
		stmt.executeUpdate();
		
	}
	public void insertHistoPrix(int idproduit,double montant)throws Exception
	{
		String insertHisto = "INSERT INTO historiqueprix(idproduit,montant,datehisto) values(?,?,current_date)";
		PreparedStatement stmt = connection.prepareStatement(insertHisto);
		stmt.setInt(1,idproduit);
		stmt.setDouble(2,montant);
		stmt.executeUpdate();
	}
	
	public AllProduit selectLastAllProduit() throws Exception
	{
		AllProduit produit=new AllProduit();
		String req = "select * from allProduit order by idproduit desc limit 1";
		Statement stat=this.connection.createStatement();
		ResultSet arraySet=stat.executeQuery(req);
		
		while(arraySet.next()){
			produit = new AllProduit(arraySet.getInt("idProduit"),arraySet.getString("nomRayon"),arraySet.getDouble("montant"),arraySet.getString("nomProduit"),arraySet.getString("refProduit"),arraySet.getInt("quantiteMin"),arraySet.getInt("quantiteMax"));
		}
		return produit;
	}
	
	public boolean testPrixByProd(int idproduit,double montant) throws Exception
	{
		double lastMontant=0;
		String req = "select montant from allproduit where idproduit="+idproduit;
		Statement stat=this.connection.createStatement();
		ResultSet arraySet=stat.executeQuery(req);
	
		while(arraySet.next()){
			lastMontant = arraySet.getDouble("montant");
		}
		if(lastMontant!=montant)
		{
			return true;
		}
		return false;
	}
	
	public void modifierProduit(int idrayon, int idprix, String nomProduit,String refProduit,int quantiteMin, int quantiteMax, int idProduit)throws Exception
	{
		String update = "UPDATE produit SET idrayon=?,idprix=?,nomProduit=?,quantiteMin=?,quantiteMax=?,refProduit=? WHERE idproduit=?";
		PreparedStatement stmt = connection.prepareStatement(update);
		stmt.setInt(1,idrayon);
		stmt.setInt(2,idprix);
		stmt.setString(3,nomProduit);
		stmt.setInt(4,quantiteMin);
		stmt.setInt(5,quantiteMax);
		stmt.setString(6,refProduit);
		stmt.setInt(7,idProduit);
		stmt.executeUpdate();
	}
	public void supprimerProduit(int idProduit)throws Exception
	{
		String delete = "INSERT INTO deleteproduit(idproduit) VALUES(?)";
		PreparedStatement stmt = connection.prepareStatement(delete);
		stmt.setInt(1,idProduit);
		stmt.executeUpdate();
	}
}

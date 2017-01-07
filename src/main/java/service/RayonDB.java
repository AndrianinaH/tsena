package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class RayonDB 
{
	public Connection connection;
	public RayonDB(Connection con)
	{
		this.connection=con;
	}
	public ArrayList<Rayon> selectAllRayon() throws Exception
	{
		ArrayList<Rayon> allRayon =new ArrayList(); 
		String req = "select * from rayonValide";
		Statement stat=connection.createStatement();
		ResultSet arraySet=stat.executeQuery(req);
	
		while(arraySet.next()){
			Rayon rayon = new Rayon(arraySet.getInt("idrayon"),arraySet.getString("nomRayon"));
			allRayon.add(rayon);
		}
		return allRayon;
	}
	public void insertRayon(String nomRayon)throws Exception
	{
		String insert = "insert into rayon(nomRayon) values(?)";
		PreparedStatement stmt = connection.prepareStatement(insert);
		stmt.setString(1,nomRayon);
		stmt.executeUpdate();
	}
	
	public void modifierRayon(int idrayon,String nomRayon)throws Exception
	{
		String update = "UPDATE rayon SET nomrayon=? WHERE idrayon=?";
		PreparedStatement stmt = connection.prepareStatement(update);
		stmt.setString(1,nomRayon);
		stmt.setInt(2,idrayon);
		stmt.executeUpdate();
	}
	public String getNomRayonById(int idrayon)throws Exception
	{
		String nomrayon="";
		String req = "select nomrayon from rayon where idrayon="+idrayon;
		Statement stat=this.connection.createStatement();
		ResultSet arraySet=stat.executeQuery(req);
	
		while(arraySet.next()){
			nomrayon = arraySet.getString("nomrayon");
		}
		return nomrayon;
	}
	
	public boolean testRayonDelete(String nomrayon) throws Exception
	{
		int nbRayon=0;
		String req = "select count(*) as nbrayon from allproduit where nomrayon='"+nomrayon+"'";
		Statement stat=this.connection.createStatement();
		ResultSet arraySet=stat.executeQuery(req);
	
		while(arraySet.next()){
			nbRayon = arraySet.getInt("nbrayon");
		}
		if(nbRayon==0)
		{
			return true;
		}
		else
			throw new Exception("Il existe encore des produits dans ce rayon !");
	}
	
	public void supprimerRayon(int idrayon)throws Exception
	{
		String delete = "INSERT INTO deleterayon(idrayon) VALUES(?)";
		PreparedStatement stmt = connection.prepareStatement(delete);
		stmt.setInt(1,idrayon);
		stmt.executeUpdate();
	}
	//CREATE OR REPLACE VIEW rayonValide AS SELECT * FROM rayon WHERE idrayon NOT IN (SELECT idrayon FROM deleterayon);
}

package service;

import java.sql.*;
import java.util.ArrayList;

public class PrixDB 
{
	public Connection connection;
	public PrixDB(Connection con)
	{
		this.connection=con;
	}
	
	public ArrayList<Prix> selectAllPrix() throws Exception
	{
		ArrayList<Prix> allPrix =new ArrayList(); 
		String req2 = "select * from prixValide";
		Statement stat2=connection.createStatement();
		ResultSet arraySet2=stat2.executeQuery(req2);
		
		while(arraySet2.next()){
			Prix prix = new Prix(arraySet2.getInt("idPrix"),arraySet2.getInt("montant"),arraySet2.getDate("datePrix"));
			allPrix.add(prix);
		}
		return allPrix;
	}
	public Prix selectLastPrix() throws Exception
	{
		Prix prix=new Prix();
		String req = "select * from prix order by idprix desc limit 1";
		Statement stat=this.connection.createStatement();
		ResultSet arraySet=stat.executeQuery(req);
		
		while(arraySet.next()){
			prix = new Prix(arraySet.getInt("idprix"),arraySet.getDouble("montant"),arraySet.getDate("dateprix"));
		}
		return prix;
	}
	
	public int getIdPrixByIdProd(int idproduit) throws Exception
	{
		int ret=0;
		String req = "select idprix from produit where idproduit="+idproduit;
		Statement stat=this.connection.createStatement();
		ResultSet arraySet=stat.executeQuery(req);
		
		while(arraySet.next()){
			ret = arraySet.getInt("idprix");
		}
		return ret;
	}
	
	public void insertPrix(double montant)throws Exception
	{
		String insert = "insert into prix(montant,datePrix) values(?,current_date)";
		PreparedStatement stmt = connection.prepareStatement(insert);
		stmt.setDouble(1,montant);
		stmt.executeUpdate();
	}
	
}

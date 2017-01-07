package service;

import java.util.ArrayList;
import java.sql.*;

public class PaiementService 
{
	public Connection connection;
	public PaiementService(){}
	public PaiementService(Connection con)
	{
		this.connection=con;
	}
	public ArrayList<Facture> selectAllFacture() throws Exception
	{
		ArrayList<Facture> allFacture =new ArrayList<Facture>(); 
		String req = "select * from facture";
		Statement stat=this.connection.createStatement();
		ResultSet arraySet=stat.executeQuery(req);
	
		while(arraySet.next()){
			double resteAPayer=arraySet.getDouble("montant")-arraySet.getDouble("payer");
			Facture facture = new Facture(arraySet.getInt("idfacture"),arraySet.getDate("datefacture"),arraySet.getDouble("montant"),arraySet.getDouble("payer"),resteAPayer);
			allFacture.add(facture);
		}
		return allFacture;
	}
	
	public Facture getFactureById(int idfacture) throws Exception
	{
		Facture ret = new Facture();
		String req = "select * from facture where idfacture="+idfacture;
		Statement stat=this.connection.createStatement();
		ResultSet arraySet=stat.executeQuery(req);
	
		while(arraySet.next()){
			double resteAPayer=arraySet.getDouble("montant")-arraySet.getDouble("payer");
			ret = new Facture(arraySet.getInt("idfacture"),arraySet.getDate("datefacture"),arraySet.getDouble("montant"),arraySet.getDouble("payer"),resteAPayer);
			
		}
		return ret;
	}
	
	public ArrayList<Panier> getFactureFilleById(int idfacture) throws Exception
	{
		ArrayList<Panier> ret = new ArrayList<Panier>();
		String req = "select * from detailfacture where idfacture="+idfacture;
		Statement stat=this.connection.createStatement();
		ResultSet arraySet=stat.executeQuery(req);
	
		while(arraySet.next()){
			Panier panier = new Panier(arraySet.getInt("idproduit"),arraySet.getString("nomproduit"),arraySet.getDouble("prixunitaire"),arraySet.getInt("nbacheter"));
			ret.add(panier);
		}
		return ret;
	}
	
	public void payerFacture(int idfacture, double payer) throws Exception
	{
		Facture fact=getFactureById(idfacture);
		String update = "UPDATE facture SET payer=? WHERE idfacture=?";
		PreparedStatement stmt = connection.prepareStatement(update);
		stmt.setDouble(1,fact.getPayer()+payer);
		stmt.setInt(2,idfacture);
		stmt.executeUpdate();
	}
	
	public void insertPaiement(int idfacture, double payer) throws Exception
	{
		Facture fact=getFactureById(idfacture);
		String insert = "INSERT INTO paiement(idfacture,datepaiement,montantpayer) values(?,current_date,?)";
		PreparedStatement stmt = connection.prepareStatement(insert);
		stmt.setInt(1,idfacture);
		stmt.setDouble(2,payer);	
		stmt.executeUpdate();
	}
	
	//CREATE OR REPLACE VIEW detailfacture AS SELECT facture.idfacture,datefacture,produit.idproduit,nomproduit,nbacheter,prixunitaire FROM facture JOIN achat ON achat.idfacture=facture.idfacture JOIN produit ON produit.idproduit=achat.idproduit
}

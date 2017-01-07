package service;

import java.sql.*;
import java.util.*;
import javax.servlet.http.HttpSession;

public class PanierService 
{
	public Connection connection;
	public PanierService(){}
	public PanierService(Connection con)
	{
		this.connection=con;
	}
	
	public void ajoutAuPanier(HttpSession panierSession, Panier panier)
	{
		if(panierSession.getAttribute("panier")==null)
		{
			ArrayList<Panier> allPanier=new ArrayList<Panier>();
			allPanier.add(panier);
			panierSession.setAttribute("panier", allPanier);
		}
		else
		{
			ArrayList<Panier> allPanier=(ArrayList<Panier>)panierSession.getAttribute("panier");	
			if(testIfProduitIsInPanier(panier,allPanier))
			{
				panierSession.setAttribute("panier", allPanier);
			}
			else
			{
				allPanier.add(panier);
				panierSession.setAttribute("panier", allPanier);
			}
		}	
	}
	
	public boolean testIfProduitIsInPanier(Panier panier,ArrayList<Panier> allPanier)
	{
		for(Panier pan : allPanier)
		{
			if(pan.getidproduit()==panier.getidproduit())
			{
				pan.setquantite(pan.getquantite()+panier.getquantite());
				return true;	
			}
		}
		return false;
	}
	
	public double getNetAPayerAchat(ArrayList<Panier> allPanier)
	{
		double ret=0;
		for(Panier pan : allPanier)
		{
			ret=ret+pan.getquantite()*pan.getprix();
		}
		return ret;
	}
	public double getTvaAchat(ArrayList<Panier> allPanier)
	{
		double ret=0;
		for(Panier pan : allPanier)
		{
			ret=ret+pan.getquantite()*pan.getprix()*0.20;
		}
		return ret;
	}
	public void supprimerElementPanier(HttpSession panierSession,int idproduit)
	{
		ArrayList<Panier> newPanier = new ArrayList<Panier>();
		ArrayList<Panier> allPanier=(ArrayList<Panier>)panierSession.getAttribute("panier");
		for(Panier pan : allPanier)
		{
			if(pan.getidproduit()==idproduit)
			{
				System.out.println(idproduit);
				continue;
			}
			else
			{
				newPanier.add(pan);
			}
		}
		panierSession.setAttribute("panier", newPanier);
	}
	public Facture getLastFacture() throws Exception
	{
		Facture ret=new Facture();
		String req = "select * from facture order by idfacture desc limit 1";
		Statement stat=this.connection.createStatement();
		ResultSet arraySet=stat.executeQuery(req);
		
		while(arraySet.next()){
			double resteAPayer=arraySet.getDouble("montant")-arraySet.getDouble("payer");
			 ret = new Facture(arraySet.getInt("idfacture"),arraySet.getDate("datefacture"),arraySet.getDouble("montant"),arraySet.getDouble("payer"),resteAPayer);
		}
		return ret;
	}
	public int insertFacture(double montant)throws Exception
	{
		String insert = "insert into facture(datefacture,montant,payer) values(current_date,?,?)";
		PreparedStatement stmt = connection.prepareStatement(insert);
		stmt.setDouble(1,montant);
		stmt.setDouble(2,0);
		stmt.executeUpdate();
		int ret=getLastFacture().getidFacture();
		return ret;
	}
	public void insertAchat(HttpSession panierSession,int idfacture)throws Exception
	{
		ArrayList<Panier> allPanier=(ArrayList<Panier>)panierSession.getAttribute("panier");
		for(Panier pan : allPanier)
		{
			String insert = "insert into achat(idproduit,idfacture,nbacheter,prixunitaire) values(?,?,?,?)";
			PreparedStatement stmt = connection.prepareStatement(insert);
			stmt.setInt(1,pan.getidproduit());
			stmt.setInt(2,idfacture);
			stmt.setInt(3,pan.getquantite());
			stmt.setDouble(4,pan.getprix());
			stmt.executeUpdate();
		}	
	}
	
}

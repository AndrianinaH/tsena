package service;

import java.sql.*;
import java.util.*;

public class AllProduitDB 
{
	public Connection connection;
	public AllProduitDB(Connection con)
	{
		this.connection=con;
	}
	public ArrayList<AllProduit> selectAllProduit() throws Exception
	{
		ArrayList<AllProduit> allProduit =new ArrayList<AllProduit>(); 
			String req = "select * from allProduit";
			Statement stat=this.connection.createStatement();
			ResultSet arraySet=stat.executeQuery(req);
		
			while(arraySet.next()){
				AllProduit produit = new AllProduit(arraySet.getInt("idProduit"),arraySet.getString("nomRayon"),arraySet.getDouble("montant"),arraySet.getString("nomProduit"),arraySet.getString("refProduit"),arraySet.getInt("quantiteMin"),arraySet.getInt("quantiteMax"));
				allProduit.add(produit);
			}
		return allProduit;
	}
}

/*INSERT INTO rayon (nomRayon)VALUES ('boisson');
INSERT INTO rayon (nomRayon)VALUES ('sanitaire');
INSERT INTO rayon (nomRayon)VALUES ('fourniture scolaire');
INSERT INTO rayon (nomRayon)VALUES ('nouvelle technologie');

INSERT INTO prix (montant)VALUES (1000);
INSERT INTO prix (montant)VALUES (2000);
INSERT INTO prix (montant)VALUES (4000);
INSERT INTO prix (montant)VALUES (5000);
INSERT INTO prix (montant)VALUES (6000);
INSERT INTO prix (montant)VALUES (7000);

CREATE OR REPLACE VIEW allProduit AS SELECT idProduit, nomRayon, montant, nomProduit, quantiteMin, quantiteMax, refProduit FROM produit AS p JOIN rayon AS r ON r.idRayon = p.idRayon JOIN prix As v ON v.idPrix = p.idPrix WHERE idproduit NOT IN (SELECT idproduit FROM deleteproduit);
*/

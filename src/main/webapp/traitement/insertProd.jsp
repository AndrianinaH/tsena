<%@page import="service.*" %>
<%@page import="java.sql.*" %>
<%

	
	if(request.getParameter("idrayon")!=null && request.getParameter("prix")!=null && request.getParameter("reference")!=null && request.getParameter("nomProduit")!=null && request.getParameter("quantiteMin")!=null && request.getParameter("quantiteMax")!=null) 
    {
		int idrayon=Integer.parseInt(request.getParameter("idrayon").trim());
		double montant=Double.parseDouble(request.getParameter("prix").trim());
		String reference=request.getParameter("reference");
		String nomProduit=request.getParameter("nomProduit");
		int quantiteMin=Integer.parseInt(request.getParameter("quantiteMin").trim());
		int quantiteMax=Integer.parseInt(request.getParameter("quantiteMax").trim());
	
		ConnectDB db;
		ProduitDB produitDB;
		PrixDB prixDB;
		try{
			db = new ConnectDB();
			Connection connection = db.getConn();
			produitDB = new ProduitDB(connection);
			
			prixDB = new PrixDB(connection);
			prixDB.insertPrix(montant);
			int prix=prixDB.selectLastPrix().getidPrix();
			
			produitDB.insertProduit(idrayon, prix, nomProduit, reference, quantiteMin, quantiteMax);
			AllProduit lastProduit=produitDB.selectLastAllProduit();
			produitDB.insertHistoPrix(lastProduit.getidProduit(),lastProduit.getmontant());
			
			response.sendRedirect("../index.jsp");
		}catch(Exception e){
			e.printStackTrace();
		}
	}

%>
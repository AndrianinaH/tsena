<%@page import="service.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%

	if(session.getAttribute("panier")!=null)
	{
		ConnectDB db;
		PanierService panierService;
		try{
			db = new ConnectDB();
			Connection connection = db.getConn();
			panierService = new PanierService(connection);
			ArrayList<Panier> allPanier=(ArrayList<Panier>)session.getAttribute("panier");
			double netAPayer=panierService.getNetAPayerAchat(allPanier);
			double totalTva=panierService.getTvaAchat(allPanier);
			double total=netAPayer-totalTva;
			
			
			int idfacture=panierService.insertFacture(total);
			panierService.insertAchat(session, idfacture);
			response.sendRedirect("../facture.jsp");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	else
	{
		System.out.println("le panier est vide");
		String error="error";
		response.sendRedirect("../panier.jsp?success="+error);
	}

%>
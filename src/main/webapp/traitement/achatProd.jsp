<%@page import="service.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%
	if(request.getParameter("idproduit")!=null && request.getParameter("nomproduit")!=null && request.getParameter("prix")!=null && request.getParameter("quantite")!=null) 
	{
		int idproduit=Integer.parseInt(request.getParameter("idproduit").trim());
		String nomproduit=request.getParameter("nomproduit");
		double prix=Double.parseDouble(request.getParameter("prix").trim());
		int quantite=Integer.parseInt(request.getParameter("quantite").trim());
		
		PanierService panierService = new PanierService();
		Panier panier=new Panier(idproduit,nomproduit,prix,quantite);
		panierService.ajoutAuPanier(session, panier);
		
		response.sendRedirect("../achatProduit.jsp");
	}
	
	
%>
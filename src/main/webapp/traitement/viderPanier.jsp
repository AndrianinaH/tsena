<%@page import="service.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="javax.servlet.http.HttpSession"%>
<%
	if(request.getParameter("idproduit")!=null) 
	{
		int idproduit=Integer.parseInt(request.getParameter("idproduit").trim());
		
		PanierService panierService = new PanierService();
		panierService.supprimerElementPanier(session, idproduit);
		ArrayList<Panier> le_panier=(ArrayList<Panier>)session.getAttribute("panier");
		if(le_panier.size()==0)
		{
			session.removeAttribute("panier");
		}
		
		response.sendRedirect("../panier.jsp");
	}
	
	
%>
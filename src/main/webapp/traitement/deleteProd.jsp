<%@page import="service.*" %>
<%@page import="java.sql.*" %>
<%@page import="javax.swing.JOptionPane" %>
<%

	if(request.getParameter("idproduit")!=null) 
    {
		int idproduit=Integer.parseInt(request.getParameter("idproduit"));
		int dialogResult=JOptionPane.showConfirmDialog(null,"Voulez vous vraiment supprimer ce produit ?","Attention",JOptionPane.WARNING_MESSAGE);
		if(dialogResult==JOptionPane.YES_OPTION)
		{
			ConnectDB db;
			ProduitDB produitDB;
			try{
				db = new ConnectDB();
				Connection connection = db.getConn();
				produitDB = new ProduitDB(connection);
				produitDB.supprimerProduit(idproduit);
				response.sendRedirect("../index.jsp");
			}catch(Exception e){
				e.printStackTrace();
			} 
		}
		else response.sendRedirect("../insertRayon.jsp");
	}

%>
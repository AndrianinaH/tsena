<%@page import="service.*" %>
<%@page import="java.sql.*" %>
<%@page import="javax.swing.JOptionPane" %>
<%

	if(request.getParameter("idrayon")!=null) 
    {
		int idrayon=Integer.parseInt(request.getParameter("idrayon").trim());
		int dialogResult=JOptionPane.showConfirmDialog(null,"Voulez vous vraiment supprimer ce rayon ?","Attention",JOptionPane.WARNING_MESSAGE);
		if(dialogResult==JOptionPane.YES_OPTION)
		{
			ConnectDB db;
			RayonDB rayonDB;
			try{
				db = new ConnectDB();
				Connection connection = db.getConn();
				rayonDB = new RayonDB(connection);
				String nomrayon=rayonDB.getNomRayonById(idrayon);
				if(rayonDB.testRayonDelete(nomrayon))
				{
					rayonDB.supprimerRayon(idrayon);
					response.sendRedirect("../insertRayon.jsp");
				}
				
			}catch(Exception e){
				response.sendRedirect("../erreur.jsp");
				e.printStackTrace();
			} 
		}
		else response.sendRedirect("../insertRayon.jsp");
	}

%>
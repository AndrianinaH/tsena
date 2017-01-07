<%@page import="service.*" %>
<%@page import="java.sql.*" %>
<%

	
	if(request.getParameter("idrayon")!=null && request.getParameter("nomrayon")!=null) 
    {
		int idrayon=Integer.parseInt(request.getParameter("idrayon").trim());
		String nomrayon=request.getParameter("nomrayon");
		
		ConnectDB db;
		RayonDB rayonDB;
		try{
			db = new ConnectDB();
			Connection connection = db.getConn();
			rayonDB = new RayonDB(connection);
			rayonDB.modifierRayon(idrayon,nomrayon);
			response.sendRedirect("../insertRayon.jsp");
		}catch(Exception e){
			e.printStackTrace();
		} 
	}

%>
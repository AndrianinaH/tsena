<%@page import="service.*" %>
<%@page import="java.sql.*" %>
<%
	if(request.getParameter("categorie")!=null) 
    {
		String nomRayon=request.getParameter("categorie");
		ConnectDB db;
		RayonDB rayonDB;
		try{
		db = new ConnectDB();
		Connection connection = db.getConn();
		rayonDB = new RayonDB(connection);
		rayonDB.insertRayon(nomRayon);
		response.sendRedirect("../insertProduit.jsp");
	}catch(Exception e){
		e.printStackTrace();
	}
	}

%>
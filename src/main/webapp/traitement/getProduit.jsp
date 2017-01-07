<%@page import="service.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="com.google.gson.Gson"%>
<%
	ConnectDB db;
	AllProduitDB allProduitDB;
	Gson gson;
	ArrayList<AllProduit> allProduit =new ArrayList<AllProduit>();
		try{
			db = new ConnectDB();
			Connection connection = db.getConn();
			allProduitDB=new AllProduitDB(connection);
			allProduit = allProduitDB.selectAllProduit();
			
			gson = new Gson();
			String produit=gson.toJson(allProduit);
			out.print(produit);
		}catch(Exception e){
		e.printStackTrace();
		}
%>
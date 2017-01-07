<%@page import="service.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="com.google.gson.Gson"%>
<%
	ConnectDB db;
	PaiementService paiementService;
	Gson gson;
	ArrayList<Facture> allFacture =new ArrayList<Facture>();
		try{
			db = new ConnectDB();
			Connection connection = db.getConn();
			paiementService=new PaiementService(connection);
			allFacture = paiementService.selectAllFacture();
			
			gson = new Gson();
			String facture=gson.toJson(allFacture);
			out.print(facture);
		}catch(Exception e){
		e.printStackTrace();
		}
%>
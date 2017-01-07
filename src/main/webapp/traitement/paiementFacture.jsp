<%@page import="service.*" %>
<%@page import="java.sql.*" %>
<%

	if(request.getParameter("idfacture")!=null && request.getParameter("payer")!=null) 
    {
		int idfacture=Integer.parseInt(request.getParameter("idfacture").trim());
		double payer=Double.parseDouble(request.getParameter("payer").trim());
		
		ConnectDB db;
		PaiementService paiementService;
		try{
			db = new ConnectDB();
			Connection connection = db.getConn();
			paiementService = new PaiementService(connection);
			paiementService.payerFacture(idfacture, payer);
			paiementService.insertPaiement(idfacture, payer);
			response.sendRedirect("../allFacture.jsp");
		}catch(Exception e){
			e.printStackTrace();
		} 
	}

%>
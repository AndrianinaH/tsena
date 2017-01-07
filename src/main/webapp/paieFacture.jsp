<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="menu.jsp" %>
<%@page import="java.util.*" %>
<% 
	ConnectDB db;
	PaiementService paiementService;
	PanierService panierService= new PanierService();
	
	int idfacture=0;
	java.util.Date date=new java.util.Date();
	Facture facture=new Facture();
	if(request.getParameter("idfacture")!=null)
	{
		idfacture=Integer.parseInt(request.getParameter("idfacture").trim());
		try
		{
			db = new ConnectDB();
			Connection connection = db.getConn();
			paiementService = new PaiementService(connection);
			facture=paiementService.getFactureById(idfacture);	
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
%>
<div class="pusher">
    <div class="ui container">
        <div class="ui huge message">
            <h1>Paiement de facture n°<%=facture.getidFacture() %></h1>
            <p>Date: <%= new SimpleDateFormat("dd-MM-yyyy").format(facture.getdateFacture()) %> <p>
            <p>Date: <%=UtilDB.formatNumber(facture.getResteApayer()) %> Ar <p>
            <div class="ui form" id="insertProd">
	            <form action="traitement/paiementFacture.jsp" method="POST">
			    	<div class="field">
				    	<label>montant à payer</label>
				    	<input type="hidden" name="idfacture" value="<%=facture.getidFacture() %>" required>
				    	<input type="number" name="payer" placeholder="montant à payer" min="0" max="<%=facture.getResteApayer() %>" required>
			    	</div>
				  	<button type="submit" class="ui teal labeled icon button"><i class="save icon"></i>enregistrer</button>
				  	<br>
				  	<br>
				</form>
            </div>
		  	<a class="ui button" href="allFacture.jsp">
		  		retour
		  	</a>
        </div>
    </div>
</div>
<script type="text/javascript" src="assets/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="assets/semantic.min.js"></script>
</body>
</html>
<script>
$(document).ready(function() {
  $("#menu").on('click', function() {
    $('.sidebar').sidebar('toggle');
  });
  $('#nav-icon').click(function(){
    $(this).toggleClass('open');
  });
});
</script>
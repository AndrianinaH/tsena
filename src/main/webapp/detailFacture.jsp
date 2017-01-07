<%@include file="menu.jsp" %>
<%@page import="java.util.*" %>
<% 
	ConnectDB db;
	PaiementService paiementService;
	PanierService panierService= new PanierService();
	
	int idfacture=0;
	java.util.Date date=new java.util.Date();
	ArrayList<Panier> allAchat =new ArrayList<Panier>();
	double netAPayer=0;
	double totalTva=0;
	if(request.getParameter("idfacture")!=null)
	{
		idfacture=Integer.parseInt(request.getParameter("idfacture").trim());
		try
		{
			db = new ConnectDB();
			Connection connection = db.getConn();
			paiementService = new PaiementService(connection);
			date=paiementService.getFactureById(idfacture).getdateFacture();
			allAchat=paiementService.getFactureFilleById(idfacture);
			
			netAPayer=panierService.getNetAPayerAchat(allAchat);
			totalTva=panierService.getTvaAchat(allAchat);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
%>
<div class="pusher">
    <div class="ui container" ng-app="boutiqueApp">
        <div class="ui huge message">
            <h1>Détail facture</h1>
        </div>
        <center>
	        <p>
		      <a class="ui button" href="allFacture.jsp">
			  	retour
			  </a>
			  <a class="ui inverted red large labeled icon button" id="printFact">
				<i class="icon print"></i>Imprimer
			  </a>
			</p>
		</center>
        <div class="ui small message" id="facture_total">
	        <div id="textFacture">
	        	<p><img src="assets/images/logoBoutique.png" alt="logo" width="200px"></p>
		        <p>Facture N°<%=idfacture %><p>
		        <p>Date: <%= new SimpleDateFormat("dd-MM-yyyy").format(date) %> <p>
		        <p>Contact: 032 14 143 22 </p>
	        	<p>Email: tsena@gmail.com </p>
		        <p>TVA: 20% <p>
	        </div>
	        <table class="ui selectable table" ng-controller="produit_Ctrl">
	             <thead>
	                 <tr>
	                     <th>produit</th>
	                     <th>prix Unitaire</th>
	                     <th>quantité</th>
	                     <th>TVA</th>
	                     <th>total</th>
	                 </tr>
	             </thead>
	             <tbody>
	             	<% for(Panier panier : allAchat){%>
		               <tr>
		                   <td><%= panier.getnomproduit()%></td>
		                   <td><%= UtilDB.formatNumber(panier.getprix()) %> Ar</td>
		                   <td><%= panier.getquantite()%></td>
		                   <td><%= UtilDB.formatNumber(panier.getprix()*0.20)%></td>
		                   <td><%= UtilDB.formatNumber(panier.getquantite()*panier.getprix())%> Ar</td>
		               </tr>
		            <% } %>
	             </tbody>
	         </table>
	         <div class="total_prix">
	         	<div id="facturer2">
	         		<p>
					   Total TVA : <span><%= UtilDB.formatNumber(totalTva) %> Ar</span>
					</p>
					<p>
					   Total prix  : <span><%= UtilDB.formatNumber(netAPayer) %> Ar</span>
					</p>
	         		<p>
					   Net à Payer : <span><%= UtilDB.formatNumber(netAPayer-totalTva) %> Ar</span>
					</p>
				</div>
			 </div>
		 </div>
    </div>
</div>
    
<script type="text/javascript" src="assets/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="assets/semantic.min.js"></script>
<script type="text/javascript" src="assets/html2pdf/jspdf_debug.js"></script>
<script type="text/javascript" src="assets/html2pdf/html2canvas.js"></script>
<script type="text/javascript" src="assets/html2pdf/from_html.js"></script>
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
  $('.ui.dropdown').dropdown();
  
  //pdf
  $('#printFact').click(function(){
  	var pdf = new jsPDF('l','pt','a4');
  	var html= $("#facture_total").attr("style","background-color:white");
		pdf.addHTML(html[0],function() {
	    	pdf.save('facture.pdf');
		});
  });
});
</script>
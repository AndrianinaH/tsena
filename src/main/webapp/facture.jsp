<%@include file="menu.jsp" %>
<% 
	ConnectDB db;
	PanierService panierService = new PanierService();
	double netAPayer=panierService.getNetAPayerAchat(allPanier);
	double totalTva=panierService.getTvaAchat(allPanier);
	Facture facture=new Facture();
	try
	{
		db = new ConnectDB();
		Connection connection = db.getConn();
		panierService = new PanierService(connection);
		facture=panierService.getLastFacture();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	session.removeAttribute("panier");
%>
<div class="pusher">
    <div class="ui container" ng-app="boutiqueApp">
        <div class="ui huge message">
            <h1>Fiche facture</h1>
        </div>
        <center>
	        <p>
			  <a class="ui inverted red large labeled icon button" id="printFact">
				<i class="icon print"></i>Imprimer
			  </a>
			</p>
		</center>
        <div class="ui small message" id="facture_total">
	        <div id="textFacture">
	        	<p><img src="assets/images/logoBoutique.png" alt="logo" width="200px"></p>
		        <p>Facture N°<%=facture.getidFacture() %><p>
		        <p>Date: <%= new SimpleDateFormat("dd-MM-yyyy").format(facture.getdateFacture()) %> <p>
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
	             	<% for(Panier panier : allPanier){%>
		               <tr>
		                   <td><%= panier.getnomproduit()%></td>
		                   <td><%= UtilDB.formatNumber(panier.getprix()) %> Ar</td>
		                   <td><%= panier.getquantite()%></td>
		                   <td><%= UtilDB.formatNumber(panier.getprix()*0.20)%> Ar</td>
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
<%@include file="menu.jsp" %>
<% 
	PanierService panierService = new PanierService();
	double netAPayer=panierService.getNetAPayerAchat(allPanier);
	
	String message="";
	if(request.getParameter("success")!=null)
	{
		if(request.getParameter("success").equals("true"))
		{
			message="Facture créer avec succès";
		}
		else if(request.getParameter("success").equals("error"))
		{
			message="Le panier est vide";
		}
	}
	
	
%>
<div class="pusher">
    <div class="ui container" ng-app="boutiqueApp">
        <div class="ui huge message">
            <h1>Mon Panier</h1>
        </div>
        <center><p id="ms_error"><%= message %></p></center>
        <table class="ui teal selectable table" ng-controller="produit_Ctrl">
             <thead>
                 <tr>
                     <th>idProduit</th>
                     <th>produit</th>
                     <th>prix Unitaire</th>
                     <th>quantité</th>
                     <th>total</th>
                     <th>Supprimer</th>
                 </tr>
             </thead>
             <tbody>
             	<% for(Panier panier : allPanier){%>
	               <tr>
	                   <td><%= panier.getidproduit()%></td>
	                   <td><%= panier.getnomproduit()%></td>
	                   <td><%= UtilDB.formatNumber(panier.getprix()) %> Ar</td>
	                   <td><%= panier.getquantite()%></td>
	                   <td><%= UtilDB.formatNumber(panier.getquantite()*panier.getprix())%> Ar</td>
	                   <td> 
	                   	 <a class="ui red icon button" href="traitement/viderPanier.jsp?idproduit=<%= panier.getidproduit()%>">
					  		<i class="icon trash"></i>
					  	 </a>
					  </td>
	               </tr>
	            <% } %>
             </tbody>
         </table>
         <div class="total_prix">
         	<div>
	         	<a class="ui button" href="achatProduit.jsp">
		 	   		<i class="icon chevron left"></i>liste d'achat
		     	</a>
         	</div>
         	<div id="facturer">
         		<p>
				   Total : <span><%= UtilDB.formatNumber(netAPayer) %> Ar</span>
				</p>
				<p>
				  <a class="ui inverted red large labeled icon button" href="traitement/savePanier.jsp">
					<i class="icon print"></i>Facturer
				  </a>
				</p>
			</div>
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
  $('.ui.dropdown').dropdown();
});
</script>
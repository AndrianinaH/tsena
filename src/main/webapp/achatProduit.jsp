<%@include file="menu.jsp" %>
<script type="text/javascript" src="assets/angular.min.js"></script>
<div class="pusher">
    <div class="ui container" ng-app="boutiqueApp">
        <div class="ui huge message">
            <h1>Achat de produit</h1>
            <div class="ui category search">
              <div class="ui icon input">
                <input class="prompt" ng-model="filtre.nomRayon" placeholder="rayon" type="text">
                <i class="icon search"></i>
              </div>
              <div class="ui icon input">
                <input class="prompt" ng-model="filtre.nomProduit" placeholder="produit" type="text">
                <i class="icon search"></i>
              </div>
              <div class="ui icon input">
                <input class="prompt" ng-model="filtre.montant" placeholder="prix" type="text">
                <i class="icon search"></i>
              </div>
              <div class="results"></div>
            </div>
        </div>
        <table class="ui teal selectable table" ng-controller="produit_Ctrl">
             <thead>
                 <tr>
                     <th ng-click="orderByMe('idProduit')">idProduit <i class="sort icon"></i></th>
                     <th ng-click="orderByMe('nomRayon')">rayon <i class="sort icon"></i></th>
                     <th ng-click="orderByMe('nomProduit')">produit <i class="sort icon"></i></th>
                     <th ng-click="orderByMe('montant')">prix Unitaire<i class="sort icon"></i></th>
                     <th>quantité</th>
                 </tr>
             </thead>
             <tbody>
               <tr ng-repeat="prod in allProduit | filter:filtre| orderBy:myOrderBy">
                   <td>{{ prod.idProduit }}</td>
                   <td>{{ prod.nomRayon }}</td>
                   <td>{{ prod.nomProduit }}</td>
                   <td>{{ prod.montant | number }}</td>
                   <td>
	                   <div class="ui form quantite">
	                   	<form action="traitement/achatProd.jsp" method="POST">
	                   		<input type="hidden" name="idproduit" value="{{ prod.idProduit }}" required>
	                   		<input type="hidden" name="nomproduit" value="{{ prod.nomProduit }}" required>
	                   		<input type="hidden" name="prix" value="{{ prod.montant }}" required>
	                   		<input type="number" name="quantite" placeholder="quantité" min="1" required>
	                   		<button type="submit" class="ui olive button">ajouter au panier</button>
	                   	</form>
	                   </div>
                   </td>
               </tr>
             </tbody>
         </table>
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
<script>
  angular.module('boutiqueApp',[]).controller("produit_Ctrl", function($scope,$http){
	  $scope.orderByMe = function(x) {
        $scope.myOrderBy = x;
      }
     $http.get("traitement/getProduit.jsp")
      .then(function(response){
    	  console.log(response.data);
       	  $scope.allProduit = response.data;
     });

  });
</script>
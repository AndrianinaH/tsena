<%@include file="menu.jsp" %>
<script type="text/javascript" src="assets/angular.min.js"></script>
<div class="pusher">
    <div class="ui container" ng-app="boutiqueApp">
        <div class="ui huge message">
            <h1>Paiement des factures</h1>
            <div class="ui category search">
              <div class="ui icon input">
                <input class="prompt" ng-model="filtre" placeholder="Rechercher" type="text">
                <i class="icon search"></i>
              </div>
              <div class="results"></div>
            </div>
        </div>

        <table class="ui teal selectable table" ng-controller="facture_Ctrl">
             <thead>
                 <tr>
                     <th ng-click="orderByMe('idFacture')">facture N° <i class="sort icon"></i></th>
                     <th ng-click="orderByMe('dateFacture')">date <i class="sort icon"></i></th>
                     <th ng-click="orderByMe('montant')">montant <i class="sort icon"></i></th>
                     <th ng-click="orderByMe('payer')">payer <i class="sort icon"></i></th>
                     <th ng-click="orderByMe('resteApayer')">reste à payer <i class="sort icon"></i></th>
                 </tr>
             </thead>
             <tbody>
	              <tr ng-repeat="fact in allFacture | filter:filtre| orderBy:myOrderBy">
                   <td>{{ fact.idFacture }}</td>
                   <td>{{ fact.dateFacture | date }}</td>
                   <td>{{ fact.montant | number }}</td>
                   <td>{{ fact.payer | number }}</td>
                   <td>{{ fact.resteApayer | number }}</td>
                   <td ng-if="fact.resteApayer != 0">
	                   <a class="ui teal button" href="detailFacture.jsp?idfacture={{ fact.idFacture }}">détail</a>
	                   <a class="ui olive button" href="paieFacture.jsp?idfacture={{ fact.idFacture }}">payer</a>
                   </td>
                    <td ng-if="fact.resteApayer == 0">
	                   <a class="ui teal button" href="detailFacture.jsp?idfacture={{ fact.idFacture }}">détail</a>
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
  angular.module('boutiqueApp',[]).controller("facture_Ctrl", function($scope,$http){
	  $scope.orderByMe = function(x) {
        $scope.myOrderBy = x;
      }
     $http.get("traitement/getFacture.jsp")
      .then(function(response){
    	  console.log(response.data);
       	  $scope.allFacture = response.data;
     });

  });
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="menu.jsp" %>
<%
	ConnectDB db;
	RayonDB rayonDB;
	ArrayList<Rayon> allRayon =new ArrayList<Rayon>(); 
		try{
			db = new ConnectDB();
			Connection connection = db.getConn();
			rayonDB=new RayonDB(connection);
			allRayon=rayonDB.selectAllRayon();
			
		}catch(Exception e){
		e.printStackTrace();
		}
%>

<div class="pusher">
    <div class="ui container">
        <div class="ui huge message">
            <h1>Gestion des produits</h1>
            <h2>Ajouter des produits</h2>
            <div class="ui form" id="insertProd">
	            <form action="traitement/insertProd.jsp" method="POST">
	            	<div class="field">
		            	<label>rayon</label>
						<select name="idrayon" id="idrayon" required>
						<%
							for(Rayon rayon : allRayon){%>
								<option value="<% out.println(rayon.getidRayon() ); %>"><% out.println(rayon.getnomRayon()); %></option>
						<% } %>
						</select>
						<a class="ui olive button" href="insertRayon.jsp">
							Ajouter un nouveau rayon
						</a>
					</div>
					<div class="field">
						<label>prix</label>
						<input type="number" name="prix" placeholder="prix" min="1" required>
			    	</div>
			    	<div class="field">
				    	<label>réference</label>
				    	<input type="text" name="reference" placeholder="reference" required>
			    	</div>
			    	<div class="field">
				    	<label>nom du produit</label>
				    	<input type="text" name="nomProduit" placeholder="nomProduit min" required>
			    	</div>
			    	<div class="field">
				    	<label>quantité minimal</label>
				    	<input type="number" name="quantiteMin" placeholder="quantité min" min="0" required>
			    	</div>
			    	<div class="field">
				    	<label>quantité maximal</label>
				    	<input type="number" name="quantiteMax" placeholder="quantité max" min="1" required>
			    	</div>
				  	<button type="submit" class="ui teal labeled icon button"><i class="save icon"></i>enregistrer</button>
				  	<br>
				  	<br>
				</form>
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
});
</script>
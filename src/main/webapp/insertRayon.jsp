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
            <h1>Créer un Rayon</h1>
            <div class="ui form" id="insertProd">
	            <form action="traitement/rayon.jsp" method="POST">
			    	<div class="field">
				    	<label>Nom de rayon</label>
				    	<input type="text" name="categorie" placeholder="categorie" required>
			    	</div>
				  	<button type="submit" class="ui teal labeled icon button"><i class="save icon"></i>enregistrer</button>
				  	<br>
				  	<br>
				  	<a class="ui button" href="insertProduit.jsp">
				  		retour
				  	</a>
				</form>
            </div>
        </div>
        <div class="ui huge message">
         <h1>Modifier un rayon</h1>
            <div class="ui form" id="insertProd">
	            <form action="traitement/modifRayon.jsp" method="POST">
	            	<div class="field">
		            	<label>rayon</label>
						<select name="idrayon" id="idrayon" required>
						<%
							for(Rayon rayon : allRayon){%>
								<option value="<% out.println(rayon.getidRayon() ); %>"><% out.println(rayon.getnomRayon()); %></option>
						<% } %>
						</select>
					</div>
			    	<div class="field">
				    	<label>nom de rayon</label>
				    	<input type="text" name="nomrayon" placeholder="nouveau nom de rayon" required>
			    	</div>
				  	<button type="submit" class="ui olive labeled icon button"><i class="edit icon"></i>modifier</button>
				  	<br>
				  	<br>
				  	<a class="ui button" href="insertProduit.jsp">
				  		retour
				  	</a>
				</form>
            </div>
        </div>
        <div class="ui huge message">
         <h1>Supprimer un rayon</h1>
            <div class="ui form" id="insertProd">
	            <form action="traitement/deleteRayon.jsp" method="POST">
	            	<div class="field">
		            	<label>rayon</label>
						<select name="idrayon" id="idrayon" required>
						<%
							for(Rayon rayon : allRayon){%>
								<option value="<% out.println(rayon.getidRayon() ); %>"><% out.println(rayon.getnomRayon()); %></option>
						<% } %>
						</select>
					</div>
				  	<button type="submit" class="ui red labeled icon button"><i class="trash icon"></i>supprimer</button>
				  	<br>
				  	<br>
				  	<a class="ui button" href="insertProduit.jsp">
				  		retour
				  	</a>
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
  $('.ui.dropdown').dropdown();
});
</script>
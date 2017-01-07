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
		int idProduit=0;
		String nomProduit="";
		String refProduit="";
		String quantiteMin="";
		String quantiteMax="";
		String nomRayon="";
		String prixprod="";
		if(request.getParameter("idProduit")!=null && request.getParameter("nomProduit")!=null && request.getParameter("refProduit")!=null && request.getParameter("quantiteMin")!=null && request.getParameter("quantiteMax")!=null && request.getParameter("nomRayon")!=null && request.getParameter("prix")!=null) 
	    {
			idProduit=Integer.parseInt(request.getParameter("idProduit"));
			nomProduit=request.getParameter("nomProduit");
			refProduit=request.getParameter("refProduit");
			quantiteMin=request.getParameter("quantiteMin");
			quantiteMax=request.getParameter("quantiteMax");
			nomRayon=request.getParameter("nomRayon");
			prixprod=request.getParameter("prix");
	    }
%>

<div class="pusher">
    <div class="ui container">
        <div class="ui huge message">
            <h1>Gestion des produits</h1>
            <h2>Modifier le produit n° <%=idProduit %> </h2>
            <div class="ui form" id="insertProd">
	            <form action="traitement/modifProd.jsp" method="POST">
	            	<input type="hidden" name="idproduit" value="<%= idProduit %>" required>
	            	<div class="field">
		            	<label>rayon</label>
						<select name="idrayon" id="idrayon" required>
						<%
							for(Rayon rayon : allRayon){
								if(nomRayon.compareTo(rayon.getnomRayon())==0){%>
								<option value="<% out.println(rayon.getidRayon() ); %>"><% out.println(rayon.getnomRayon()); %></option>
						<% 
								}
							}
						%>
						<%
							for(Rayon rayon : allRayon){
								if(nomRayon.compareTo(rayon.getnomRayon())!=0){%>
								<option value="<% out.println(rayon.getidRayon() ); %>"><% out.println(rayon.getnomRayon()); %></option>
						<% 
								}else continue;
							}
						%>
						</select>
					</div>
					<div class="field">
						<label>prix</label>
						<input type="number" name="prix" placeholder="prix" value="<%= prixprod %>" min="1" required>
			    	</div>
			    	<div class="field">
				    	<label>réference</label>
				    	<input type="text" name="reference" placeholder="reference" value="<%= refProduit %>" required>
			    	</div>
			    	<div class="field">
				    	<label>nom du produit</label>
				    	<input type="text" name="nomProduit" placeholder="nomProduit min" value="<%= nomProduit %>" required>
			    	</div>
			    	<div class="field">
				    	<label>quantité minimal</label>
				    	<input type="number" name="quantiteMin" placeholder="quantité min" min="0" value="<%= quantiteMin %>" required>
			    	</div>
			    	<div class="field">
				    	<label>quantité maximal</label>
				    	<input type="number" name="quantiteMax" placeholder="quantité max" min="1" value="<%= quantiteMax %>" required>
			    	</div>
				  	<button type="submit" class="ui teal button">Enregistrer</button>
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
  $('.ui.dropdown').dropdown();
});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="menu.jsp" %>

<div class="pusher">
    <div class="ui container">
        <div class="ui large message">
        <br>
     
         <h1>Erreur de suppression de rayon</h1>
   			<p>Impossible de supprimer le rayon car il éxiste encore des produits dépendant de ce rayon.</p>
   			<p>Veillez supprimer ces produits avant de supprimer le rayon. </p>
		  	<a class="ui button" href="insertRayon.jsp">
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
  $('.ui.dropdown').dropdown();
});
</script>
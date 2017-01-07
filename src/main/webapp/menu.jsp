<%@page import="service.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.text.SimpleDateFormat" %>
<%
	HttpSession panierSession = request.getSession();
	ArrayList<Panier> allPanier=new ArrayList<Panier>();
	int nbrAchat;
	
	if(panierSession.getAttribute("panier")!=null)
	{
		allPanier=(ArrayList<Panier>)panierSession.getAttribute("panier");
		nbrAchat=allPanier.size();
	}
	else
		nbrAchat=allPanier.size();
%>
<!doctype html>
<html>
  <head>
  <title>Boutique</title>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <link rel="stylesheet"  style="text/css" href="assets/semantic.min.css">
    <link rel="stylesheet"  style="text/css" href="assets/style.css">
    <link rel="stylesheet"  style="text/css" href="assets/icon.min.css">
  <meta name="viewport" content="width=device-width"> 
</head>
<body>
<div  id="logo"> 
  <a class="item">
      <img src="assets/images/logoBoutique.png" alt="logo">
    </a>
</div>
<div class="ui fixed menu">
    <a class="item" id="menu">
     <section id="nav-icon">
      <span></span>
      <span></span>
      <span></span>
    </section>
    </a>
    <div class="ui right menu">
     <a class="item" id="login" href="panier.jsp">
        <strong>Panier</strong>
        <div class="ui red left pointing label"><%=nbrAchat %></div>
     </a>
      <div class="ui dropdown item" id="login">
      	  <strong id="user_admin">Admin</strong><i class="icon chevron down  large"></i>
	      <div class="menu">
	       	 <a class="item" id="login">
		        <i class="icon user large"></i><strong id="deco">Profil</strong>
		     </a>
	         <a class="item" id="login">
		        <i class="icon sign out large"></i><strong id="deco">Déconnexion</strong>
		     </a>
	      </div>
      
      </div>
    </div>
</div>
<div class="ui sidebar red inverted labeled icon vertical menu">
    <a class="item" href="index.jsp">
      <i class="icon dashboard"></i>
      <strong>Tableau de bord</strong>
    </a>
    <a class="item"  href="achatProduit.jsp">
      <i class="icon shopping cart"></i>
      <strong>Gestion des achats</strong>
    </a>
    <a class="item" href="insertProduit.jsp">
     <i class="icon cubes"></i>
      <strong>Gestion des produits</strong>
    </a>
    <a class="item" href="allFacture.jsp">
     <i class="icon print"></i>
      <strong>Gestion des factures</strong>
    </a>
    <a class="item">
     <i class="icon bar chart o"></i>
      <strong>Voir les recettes</strong>
    </a>
</div>
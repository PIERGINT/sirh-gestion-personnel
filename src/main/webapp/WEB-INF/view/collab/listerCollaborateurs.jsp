<%@page import="java.util.List"%>
<%@page import="dev.sgp.entite.Collaborateur"%>
<%@page import="dev.sgp.entite.Departement"%>
<%@page import="dev.sgp.web.CreerCollaborateursController"%>
<%@page import="dev.sgp.web.ListerCollaborateursController"%>
<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-tofit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<title>SGP - Accueil</title>
</head>

<body>
	<!-- TODO -->
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-
J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#"> <img src="logo-anime-2.gif"
			width="30" height="30" alt="">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarTogglerDemo01"
			aria-controls="navbarTogglerDemo01" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarTogglerDemo01">

			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li class="nav-item"><a class="nav-link" href="#">Collaborateurs</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">Statistiques</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">Activité</a>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container-fluid mx-md-5">
		<div class="row">
			<div class="col-md-4 offset-7 d-flex justify-content-end">
				<nav>
					<a href="/sgp/collaborateurs/creer" class="btn btn-warning"
						role="button" type="submit">Ajouter un nouveau collaborateur</a>
				</nav>

			</div>
		</div>
		<div class="row ">
			<div class="col-6 h1 text-left">Les collaborateurs</div>
		</div>
		<div class="row no-padding">
			<div class="col-5 no-padding text-right">
				<label for="rechercher">Rechercher un nom ou un prénom qui
					commence par:</label>
			</div>
			<div class="col-2 no-padding">
				<input class="form-custom-control-input p-0 mb-2 " type="search"
					name="rechercher">
			</div>
			<div class="col-1 no-padding">
				<div
					class="btn border-dark right shadow p-0 mb-2 rounded-0 btn-group btn-group-lg"
					role="group" type="submit">Rechercher</div>
			</div>
			<div class="col-3 no-padding offset-1">
				<label class="custom-control-label" for="désactiver">Voir
					les collaborateurs désactivés</label> <input type="checkbox"
					class="custom-control-input" id="désactiver">
			</div>
		</div>
		<div class="row">
			<div class="col-5 text-right">
				<label for="filtrer_par_departement">Filtrer par département
					:</label>
			</div>
			<div class="col-2 no-padding">
				<select id="filtrer_par_departement">
					<option value="tous">Tous</option>
					<!--   
						List<Departement> listePerso2 = (List<Departement>) request.getAttribute("liste2");
						for (Departement depart : listePerso2) {
					%>-->
					<option value="comptabilite">Comptabilité</option>
					<option value="ressources_humaines">Ressources humaines</option>
					<option value="informatique">Informatique</option>
					<option value="administratif">Administratif</option>
				</select>
			</div>

			<div class="col-5 text-left"></div>
		</div>
		<div class="row no-padding">
			<%
				List<Collaborateur> listePerso = (List<Collaborateur>) request.getAttribute("liste");
				for (Collaborateur collabo : listePerso) {
			%>

			<div class="col-12 col-sm-6 col-md-4 col-lg-3">
				<div class="card">
					<div class="card-header text-white bg-primary mb-3"><%=collabo.getNom()%>
						<%=collabo.getPrenom()%></div>
					<div class="card-body no-padding">
						<div class="row">
							<div class="col-4">
								<img src="/sgp/avatar.png" class="card-img" alt="...">
							</div>
							<div class="col-8 text-left">
								<ul>
									<li class="card-text">Fonction :</li>
									<li class="card-text">Département:</li>
									<li class="card-text"><h6>
											Email:<%=collabo.getEmailPro()%></h6></li>
									<li class="card-text">Téléphone:</li>
								</ul>
							</div>
						</div>
						<div class="row offset-8 ">
							<div class="col-12">
								<nav>
									<a href="<%=request.getContextPath()%>/collaborateurs/editer?matricule=<%=collabo.getMatricule() %>" class="btn btn-primary"
										role="button" type="submit">Editer</a>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>
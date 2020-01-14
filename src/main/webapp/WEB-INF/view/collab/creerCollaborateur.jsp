<%@page import="java.util.List"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="dev.sgp.web.CreerCollaborateursController"%>
<!-- CETTE PAGE GERE LE REMPLISSAGE DU FORMULAIRE DE CREATION D'UN NOUVEAU COLLABORATEUR-->
<!doctype html>
<html lang="fr">

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

	<form method=post>
		<div class="container-fluid mx-md-5">
			<div class="row ">
				<div class="col-6 h1 text-left">Nouveau collaborateur</div>
			</div>
			<div class="row no-padding">
				<div class="col-1"></div>
				<div class="col-2 p-3 text-right">
					<label for="surname">Nom:</label>
				</div>
				<div class="col-4 p-3 ">
					<input class="input-group input-group-lg" type="search"
						name="surname">
					<%
						if (request.getAttribute("erreurNom") != null) {
					%>
					<a href="#1" class="text-danger">Le nom est obligatoire</a>
					<%
						}
					%>
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row no-padding">
				<div class="col-1"></div>
				<div class="col-2 p-3 text-right">
					<label for="firstname">Prénom:</label>
				</div>
				<div class="col-4 p-3 ">
					<input class="input-group input-group-lg" type="search"
						name="firstname">
					<%
						if (request.getAttribute("erreurPrenom") != null) {
					%>
					<a href="#1" class="text-danger">Le prénom est obligatoire</a>
					<%
						}
					%>
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row no-padding">
				<div class="col-1"></div>
				<div class="col-2 p-3 text-right">
					<label for="birthdate">Date de naissance:</label>
				</div>
				<div class="col-4 p-3 ">
					<input class="input-group input-group-lg" type="date"
						name="birthdate">
					<%
						if (request.getAttribute("erreurDate_De_Naissance") != null) {
					%>
					<a href="#1" class="text-danger">La date de naissance est
						obligatoire</a>
					<%
						} else if (request.getAttribute("erreur_Trop_Jeune") != null) {
					%>
					<a href="#1" class="text-danger">Veuillez entrer une autre date</a>
					<%
						}
					%>
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row no-padding">
				<div class="col-1"></div>
				<div class="col-2 p-3 text-right">
					<label for="address">Adresse:</label>
				</div>
				<div class="col-4 p-3">
					<textarea class="input-group input-group-lg align-top" type="text" name="address" size="58.5" style="height: 150px;"></textarea>
					<%
						if (request.getAttribute("erreurAdresse") != null) {
					%>
					<a href="#1" class="text-danger">L'adresse est obligatoire</a>
					<%
						}
					%>
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row no-padding">
				<div class="col-1"></div>
				<div class="col-2 p-3 text-right">
					<label for="secu">Numéro de sécurité sociale:</label>
				</div>
				<div class="col-4 p-3 ">
					<input class="input-group input-group-lg" type="search" name="secu">
					<%
						if (request.getAttribute("erreurNum_Secu") != null) {
					%>
					<a href="#1" class="text-danger">Le numéro de sécurité sociale
						est obligatoire</a>
					<%
						} else if (request.getAttribute("erreurTaille_Num_Secu") != null) {
					%>
					<a href="#1" class="text-danger">Veuillez entrer un numéro à 15
						chiffres</a>
					<%
						} else if (request.getAttribute("erreur_Caractere") != null) {
					%>
					<a href="#1" class="text-danger">Veuillez entrer un numéro à 15
						chiffres</a>
					<%
						}
					%>
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row no-padding">
				<div class="col-7 p-0 text-right">
					<nav>
					<button class="btn btn-primary" role="button"
						type="submit">Créer</button>
				</nav>
				</div>
			</div>
	</form>
	</div>
</body>

</html>
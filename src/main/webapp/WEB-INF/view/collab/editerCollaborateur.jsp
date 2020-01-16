<%@page import="java.util.List"%>
<%@page import="dev.sgp.entite.Collaborateur"%>
<%@page import="dev.sgp.entite.Departement"%>
<%@page import="dev.sgp.web.CreerCollaborateursController"%>
<%@page import="dev.sgp.web.ListerCollaborateursController"%>
<%@page import="dev.sgp.web.EditerCollaborateursController" %>

<!doctype html>
<html lang="fr">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-tofit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <title>SGP - Accueil</title>
</head>

<body>
    <!-- TODO -->
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-
J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#"> <img src="logo-anime-2.gif" width="30" height="30" alt="">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01"
            aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
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
        <div class="container-fluid">
            <div class="row">
            
                <div class="col-3"></div>
                <div class="col-6 h1 no-padding text-left"></div>
                <div class="col-1 no-padding text-right offset"><label class="custom-control-label"
                        for="désactiver">Désactiver</label>
                    <input type="checkbox" class="custom-control-input" id="désactiver"></div>
                <div class="col-2"></div>
            </div>
            <div class="row no-padding">
                <div class="col-3 no-border text-center"><img src="/sgp/avatar.png" class="card-img" alt="..."
                        style="width:50%"></div>
                <div class="col-7 ">

                    <div class="row no-padding border border-dark my-2">
                        <p>Identité</p>
                    </div>
                    <div class="row no-padding border-left border-right border-top border-dark">
                        <div class="col-6 p-3 text-right">
                            <label for="civilite">Civilité:</label>
                        </div>
                        <div class="col-6 p-3 input-group input-group-lg">
                            <select id="filtrer_par_departement">
                                <option value="tous"></option>
                                <option value="tous">Madame</option>
                                <option value="comptabilite">Monsieur</option>
                            </select>
                        </div>
                    </div>
                    <div class="row no-padding border-left border-right border-dark ">
                        <div class="col-6 text-right">
                            <label for="surname">Nom:</label>
                        </div>
                        <div class="col-6 no-padding"><input class="input-group input-group-lg" type="search"
                                name="surname"></div>

                    </div>
                    <div class="row no-padding border-left border-right border-dark">
                        <div class="col-6 text-right">
                            <label for="firstname">Prénom:</label>
                        </div>
                        <div class="col-6 no-padding"><input class="input-group input-group-lg" type="search"
                                name="firstname"></div>

                    </div>
                    <div class="row no-padding border-left border-right border-dark">
                        <div class="col-6 text-right">
                            <label for="birthdate">Date de naissance:</label>
                        </div>
                        <div class="col-6 ">
                            <input class="input-group input-group-lg" type="date" name="birthdate">
                        </div>
                    </div>
                    <div class="row no-padding border-left border-right border-dark">
                        <div class="col-6 text-right">
                            <label for="address">Adresse:</label>
                        </div>
                        <div class="col-6 ">
                            <textarea class="input-group input-group-lg align-top" type="text" name="address"
                                size="58.5" style="height: 150px;"></textarea>
                        </div>
                    </div>
                    <div class="row no-padding border-left border-right border-dark">
                        <div class="col-6 text-right">
                            <label for="numSecu">Numéro de sécurité sociale:</label>
                        </div>
                        <div class="col-6 ">
                            <input class="input-group input-group-lg" type="search" name="numSecu">
                        </div>
                    </div>
                    <div class="row no-padding border-left border-right border-bottom border-dark">
                        <div class="col-6 text-right">
                            <label for="tel">Téléphone:</label>
                        </div>
                        <div class="col-6 ">
                            <input class="input-group input-group-lg" type="search" name="tel">
                        </div>
                    </div>
                    <div class="row no-padding border border-dark align-text-middle my-2">
                        <p>Poste</p>
                    </div>
                    <div class="row no-padding border border-dark my-2">
                        <p>Coordonnées bancaires</p>
                    </div>
                </div>
           
                <div class="col-2 "></div>
            </div>
            <div class="row p-3">
                <div class="col-3"></div>
                <div class="col-6"></div>
                <div class="col-1 margin text-right offset"><button class="btn btn-primary" type="submit">Sauvegarder</button>
                <div class="col-2"></div>
            </div>
        </div>
    </form>

</body>

</html>
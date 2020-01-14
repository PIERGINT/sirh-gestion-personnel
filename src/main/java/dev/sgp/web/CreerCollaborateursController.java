package dev.sgp.web;

import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.ResourceBundle;
import java.util.UUID;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dev.sgp.entite.Collaborateur;
import dev.sgp.entite.Departement;
import dev.sgp.service.CollaborateurService;
import dev.sgp.service.DepartementService;
import dev.sgp.util.Constantes;

public class CreerCollaborateursController extends HttpServlet {

	private CollaborateurService collabService = Constantes.COLLAB_SERVICE;
	ResourceBundle data = ResourceBundle.getBundle("application");
	String suffixe = data.getString("suffixe.email");

	@Override
	// Affichage de la page du formulaire
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/view/collab/creerCollaborateur.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Recherche des paramètres
		String nom = req.getParameter("surname");
		String prenom = req.getParameter("firstname");
		String datedeNaissance = req.getParameter("birthdate");
		String adresse = req.getParameter("address");
		String numSecu = req.getParameter("secu");
		resp.setContentType("text/html");

		// Gestion des erreurs de saisie
		if (nom == null || "".equals(nom) || prenom == null || "".equals(prenom) || datedeNaissance == null
				|| "".equals(datedeNaissance) || adresse == null || "".equals(adresse) || numSecu == null
				|| "".equals(numSecu)) {

			// Erreur pour le nom

			if (nom == null || "".equals(nom)) {

				req.setAttribute("erreurNom", true);
			}
			// Erreur pour le prénom.
			if (prenom == null || "".equals(prenom)) {
				req.setAttribute("erreurPrenom", true);
			}

			// Erreur pour la date de naissance.
			if (datedeNaissance == null || "".equals(datedeNaissance)) {
				req.setAttribute("erreurDate_De_Naissance", true);
			} else if (LocalDate.parse(datedeNaissance).equals(LocalDate.now())
					|| LocalDate.parse(datedeNaissance).isAfter(LocalDate.now())) {
				req.setAttribute("erreur_Trop_Jeune", true);}

				// Erreur pour l'adresse.
				if (adresse == null || "".equals(adresse)) {
					req.setAttribute("erreurAdresse", true);
				}

				// Erreur pour le numéro de sécurité sociale.
				if (numSecu == null || "".equals(numSecu)) {
					req.setAttribute("erreurNum_Secu", true);
				} else if (numSecu.length() != 15) {
					req.setAttribute("erreurTaille_Num_Secu", true);
				} else if ( !Pattern.matches("[a-zA-Z]+", numSecu)) {
					req.setAttribute("erreur_Caractere", true);
				}

				// Affichage code statut.
				resp.setStatus(400);
				// Affichage cause erreur par JSP.

				req.getRequestDispatcher("/WEB-INF/view/collab/creerCollaborateur.jsp").forward(req, resp);

				// FORMULAIRE CORRECTEMENT REMPLI: sauvegarde et redirection
				// vers la liste des collaborateurs.
			} else {
				Collaborateur nouveaucollabo = new Collaborateur();

				// Valorisation des paramètres
				nouveaucollabo.setNom(nom);
				nouveaucollabo.setPrenom(prenom);
				nouveaucollabo.setDatedeNaissance(LocalDate.parse(datedeNaissance));
				nouveaucollabo.setAdresse(adresse);
				nouveaucollabo.setNumSecu(numSecu);
				

				
				// Génération du matricule.
				nouveaucollabo.setMatricule(UUID.randomUUID().toString());
				// Enregistrement heure/date.
				nouveaucollabo.setDateHeureCreation(ZonedDateTime.now(ZoneId.of("UTC")));
				// Photo fictive provisoire.
				nouveaucollabo.setPhoto("/sgp/avatar.png");
				// Statut actif
				nouveaucollabo.setActif(true);
				
				// Constitution du mail.
				nouveaucollabo.setEmailPro(prenom+"."+nom+"@"+suffixe);
				String emailPro = (prenom+"."+nom+"@"+suffixe);
				
				// Définition de la fonction.
				nouveaucollabo.setIntitulePoste("********");
				
				// Définition du département.
				
				
				req.setAttribute("nouveau_collabo", nouveaucollabo);
				collabService.sauvegarderCollaborateur(nouveaucollabo);
				// Redirection vers la liste
				resp.sendRedirect("/sgp/collaborateurs/lister");
				
			}
		}
	
	}

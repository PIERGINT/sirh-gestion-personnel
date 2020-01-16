package dev.sgp.web;

/**
 * Cette classe permet de paramétrer une servlet afin de gérer des requêtes de type get
 */

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;
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

@SuppressWarnings("serial")
public class EditerCollaborateursController extends HttpServlet {

	// SERVLETS DE GESTION REQUETES GET/COLLABORATEUR
	// Récupération du service.
	private CollaborateurService collabService = Constantes.COLLAB_SERVICE;
	private DepartementService departService = Constantes.DEPART_SERVICE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/view/collab/editerCollaborateur.jsp").forward(req, resp);

		// Recherche du matricule
		String matricule = req.getParameter("matricule");
		resp.setContentType("text/html");

		List<Collaborateur> collaborateurs = collabService.listerCollaborateurs();
		Optional<Collaborateur> collab = collaborateurs.stream().filter(c -> c.getMatricule().equals(matricule))
				.findFirst();
		
		 if (collab.isPresent()) {

	            req.setAttribute("collaborateur", collab.get());
	        }

		// Code HTML écrit dans le corps de la réponse.
		// A) Erreur côté client si pas de matricule.
		if (matricule == null) {
			// A1) Affichage statut.
			resp.setStatus(400);
			// A2) Affichage cause erreur.
			resp.getWriter().write("Un matricule est attendu");

			// B) Code correct si matricule.
		} else {
			// B1) Affichage statut.
			resp.setStatus(200);
			// B2)Affichage numéro matricule.
			resp.sendRedirect("/sgp/collaborateurs/editer");
			;

		}

	}
	// SERVLETS DE GESTION REQUETES POST/COLLABORATEUR

	
	
}

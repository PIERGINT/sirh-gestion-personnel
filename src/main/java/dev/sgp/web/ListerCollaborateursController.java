package dev.sgp.web;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import dev.sgp.entite.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.sgp.service.CollaborateurService;
import dev.sgp.service.DepartementService;
import dev.sgp.util.Constantes;
import dev.sgp.web.CreerCollaborateursController;


public class ListerCollaborateursController extends HttpServlet {

	// SERVLETS DE GESTION REQUETES GET/PARAMETRE
	// Récupération du service.
	private CollaborateurService collabService = Constantes.COLLAB_SERVICE;
	private DepartementService departService = Constantes.DEPART_SERVICE;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// Utilisation du service: création d'une liste collaborateurs.
		List<Collaborateur> collaborateurs = collabService.listerCollaborateurs();
		req.setAttribute("liste", collaborateurs);
		
		// Utilisation du service: création d'une liste départements.
				List<Departement> departements = departService.listerDepartement();
				req.setAttribute("liste2", departements);
		
		// Envoi vers jsp pour affichage.
		req.getRequestDispatcher("/WEB-INF/view/collab/listerCollaborateurs.jsp").forward(req, resp);
		
		
	}
}
package dev.sgp.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class EditerCollaborateursController extends HttpServlet {

	// SERVLETS DE GESTION REQUETES GET/COLLABORATEUR

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// Recherche du matricule
		String matriculeParam = req.getParameter("matricule");
		resp.setContentType("text/html");

		// Code HTML écrit dans le corps de la réponse.
		// A) Erreur côté client si pas de matricule.
		if (matriculeParam == null) {
			// A1) Affichage statut.
			resp.setStatus(400);
			// A2) Affichage cause erreur.
			resp.getWriter().write("Un matricule est attendu");

			// B) Code correct si matricule.
		} else {
			// B1) Affichage statut.
			resp.setStatus(200);
			// B2)Affichage numéro matricule.
			resp.getWriter().write("<h1>Edition de collaborateurs</h1>" + "<ul>" + "<li>code :" + resp.getStatus()
					+ "</li>" + "<li>Matricule :" + matriculeParam + "</li>" + "</ul>");

		}

	}
	// SERVLETS DE GESTION REQUETES POST/COLLABORATEUR

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Recherche des paramètres
		String matriculeParam = req.getParameter("matricule");
		String titreParam = req.getParameter("titre");
		String nomParam = req.getParameter("nom");
		String prenomParam = req.getParameter("prenom");
		resp.setContentType("text/html");

		// C) Erreur côté client si paramètres non renseignés.
		if (matriculeParam == null || titreParam == null || nomParam == null || prenomParam == null) {
			// C1) Affichage statut.
			resp.setStatus(400);
			// C2) Affichage cause erreur.
			resp.getWriter().write("Les paramètres suivants sont incorrects : ");
			if (matriculeParam == null) {
				resp.getWriter().write("<li>Matricule</li>");
			}
			if (titreParam == null) {
				resp.getWriter().write("<li>Titre</li>");
			}
			if (nomParam == null) {
				resp.getWriter().write("<li>Nom</li>");
			}
			if (prenomParam == null) {
				resp.getWriter().write("<li>Prenom</li>");
			}

			// D) Code correct si matricule.
			// D1) Affichage statut.
		} else {
			resp.setStatus(201);
			// D2) Affichage profil collaborateur.
			resp.getWriter()
					.write("<h1>Création d'un collaborateur avec les informations suivantes</h1>" + "<ul>"
							+ "<li>Matricule :" + matriculeParam + "</li>" + "<li>Titre :" + titreParam + "</li>"
							+ "<li>Nom :" + nomParam + "</li>" + "<li>Prenom :" + prenomParam + "</li>" + "</ul>");

		}
	}
}

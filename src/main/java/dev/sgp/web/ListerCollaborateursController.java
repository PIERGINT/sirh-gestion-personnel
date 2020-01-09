package dev.sgp.web;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class ListerCollaborateursController extends HttpServlet {

	// SERVLETS DE GESTION REQUETES GET/PARAMETRE

@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	resp.getWriter().write("Hello Guys ! Time for programming ! ^^, ");

	//UTILITAIRE MVC
	//Envoi de l'information vers le fichier jsp.
	req.setAttribute("listeNoms",  Arrays.asList("Robert", "Jean", "Hugues"));
	req.getRequestDispatcher("/WEB-INF/view/collab/listerCollaborateurs.jsp").forward(req,resp);
	
}
}
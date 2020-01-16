package dev.sgp.service;

import java.util.*;

import dev.sgp.entite.Collaborateur;

public class CollaborateurService {

	// Création d'un nouvel objet liste.
	List<Collaborateur> listeCollaborateurs = new ArrayList<>();

	//Méthode d'affichage de la liste.
	public List<Collaborateur> listerCollaborateurs() {
		return listeCollaborateurs;
	}
	
	//Méthode d'ajout d'un nouveau collaborateur à la liste.
	public void sauvegarderCollaborateur(Collaborateur collab){
		
		listeCollaborateurs.add(collab);
	}
}

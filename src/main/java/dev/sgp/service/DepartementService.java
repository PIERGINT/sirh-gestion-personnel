package dev.sgp.service;

import java.util.*;

import dev.sgp.entite.Departement;

public class DepartementService {

	
	// Création d'un nouvau département
	List<Departement> listedepart = new ArrayList<>();
	
	//Méthode d'affichage de la liste.
	public List<Departement> listerDepartement () {
		return listedepart;
	};
	
	//Méthode d'ajout de nouveaux départements.
	public void ajouterDepartement (Integer id, String nom){
		listedepart.add(new Departement (1, "tous"));
        listedepart.add(new Departement (2, "comptabilite"));
        listedepart.add(new Departement (3, "ressourcesHumaines"));
        listedepart.add(new Departement (4, "informatique"));
        listedepart.add(new Departement (5, "administratif"));
	}
	
}

public class Mois {
  private String nom;
  private int nbJours;

  Mois(String nom, int nbJours) {
    this.nom = nom;
    this.nbJours = nbJours;
  }
  
  public String getNom(){
	  return this.nom;
	  
  }
  
  public int getNbJours(){
	  return this.nbJours;
  }
  
} 

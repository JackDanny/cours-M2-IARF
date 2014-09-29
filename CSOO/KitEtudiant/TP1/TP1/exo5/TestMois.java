

public class TestMois {
  public static void main(String args[]) {
    int monMois = Integer.parseInt(args[0]);
    //
    // code à fournir
    //
    
    //int moisJours[] = {0,31,29,31,30,31,30,31,31,30,31,30,31};
    
    monMois=monMois-1;
    
    Mois moisJours[] = new Mois[12];
    
    moisJours[0] = new Mois("Janvier",31);
    moisJours[1] = new Mois("Fevrier",29);
    moisJours[2] = new Mois("Mars",31);
    moisJours[3] = new Mois("Avril",30);
    moisJours[4] = new Mois("Mai",31);
    moisJours[5] = new Mois("Juin",30);
    moisJours[6] = new Mois("Juillet",31);
    moisJours[7] = new Mois("Aout",31);
    moisJours[8] = new Mois("Septembre",30);
    moisJours[9] = new Mois("Octobre",31);
    moisJours[10] = new Mois("Novembre",30);
    moisJours[11] = new Mois("Decembre",31);
   
    
    
    System.out.print("Le mois de "
                     + moisJours[monMois].getNom() + " a ");
    System.out.println(moisJours[monMois].getNbJours()
                       + " jours");
  }
}

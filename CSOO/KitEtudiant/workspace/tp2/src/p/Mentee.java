package p;

import java.io.PrintWriter;

public class Mentee extends Employe {

	/** attributs */
	private Mentor mentor;

	/** constructeur */
	
	

	public Mentee() {
		super();
	}

	public Mentee(String nom, int num, float salaryB) {

		super(nom, num, salaryB);

	}

	/** methodes */

	//mise a jour du mentor
	public void setMentor(Mentor ment) {
		this.mentor = ment;
	}

	public Mentor getMentor() {
		return this.mentor;
	}

	/** bonus = 10% si langage = Java */
	public int bonus() {

		if ((this.getLangage()).equals("Java")) {
			return 10;
		} else {
			return 0;
		}
	}

	public float getSalary() {
		return (this.salaryBase) * (1 + (this.bonus() / 100.f));

	}

	public void display() {

		if (this.mentor == null) {
			System.out.println("Nom : " + this.getName()
					+ " // Mentoré qui n'a pas de mentor");
		} else {
			System.out.println("Nom : " + this.getName() + " // Mentoré");
		}
		super.display();

		if (this.getMentor() != null) {
			System.out.println("son Mentor est " + this.getMentor().getName()
					+ " avec le numero de paie " + this.getMentor().getNum());
		} else {
			System.out.println("pas de Mentor");
		}
		System.out.println("Salaire du mois : " + this.getSalary() + "\n");

	}

	public void displayReports(PrintWriter fic) {
		if (this.mentor == null) {
			fic.println("Nom : " + this.getName()
					+ " // Mentoré qui n'a pas de mentor");
		} else {
			fic.println("Nom : " + this.getName() + " // Mentoré");
		}
		super.displayReports(fic);

		if (this.getMentor() != null) {
			fic.println("son Mentor est " + this.getMentor().getName()
					+ " avec le numero de paie " + this.getMentor().getNum());
		} else {
			fic.println("pas de Mentor");
		}
		fic.println("Salaire du mois : " + this.getSalary() + "\n");

	}
	//verifie la coherence du langage du mentoré avec celui de son Mentor
	public boolean verifCoherenceLanguage(){
		if(this.getMentor()==null){
			return true;
		}
		if(this.getLangage().equals(this.getMentor().getLangage())){
			return true;
		}
		else{
			return false;
		}
		
	}
	
	//Regler le probleme de la cohérence
	public void resoudIncoherence(){
		if(!this.verifCoherenceLanguage()){
			System.out.println("probleme de coherence de langage entre " + this.getNum() + " et " + this.getMentor().getNum());
			//on enleve le mentee des mentees du mentor
			this.getMentor().suppMentee(this);
			//on enleve le mentor du mentee
			this.setMentor(null);
			
			
		}
		
		
	}

	
	
	
	
	
	

}

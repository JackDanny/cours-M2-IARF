package p;

import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Iterator;

public class Mentor extends Employe {

	/** attributs */

	// ensemble des Mentees dirigés par le mentor
	private HashSet<Mentee> mentees = new HashSet<Mentee>();

	/** constructeurs */

	//on utilise les constructeur de Employe
	public Mentor() {
		super();
	}

	Mentor(String nom, int num, float salaryB) {
		super(nom, num, salaryB);
	}

	public HashSet<Mentee> getMentees(){

//		if(this.mentees != null){
			return this.mentees;
//		}
//		return null;
	}



	/** methodes */

	//Ajoute un Mentee au mentor
	public void addMentee(Mentee me) {
		//On ajoute le mentor au mentee. Si il est deja associe on en informe l'utilisateur.
		if (this.mentees.add(me) == false) {
			System.out
			.println("\nCe Mentee (" + me.getName()
					+ ") est deja associe a� ce Mentor("
					+ this.getName() + "\n");
		}
		;

	}

	//supprime un Mentee au mentor
	public void suppMentee(Mentee me) {
		this.mentees.remove(me);

	}



	/** bonus = 10% si java + 5% * Mentoree */
	public int bonus() {
		int b = 0;
		if ((this.getLangage()).equals("Java")) {
			b = 10;
		}
		b = b + (this.mentees.size()) * 5;
		return b;
	}

	public float getSalary() {
		return (this.salaryBase) * (1 + (this.bonus() / 100.f));
	}

	public boolean hasMentee(){
		if (this.mentees.size() == 0) {
			return false;
		}
		return true;

	}

	public void display() {
		if (this.mentees.size() == 0) {
			System.out.println("Nom : " + this.getName()
					+ " // Employé qui n'a pas de mentoré");

		}

		else {
			System.out.println("Nom : " + this.getName() + " // Mentor");
		}

		super.display();

		Iterator<Mentee> i = this.mentees.iterator();

		if (this.mentees.size() > 0) {
			System.out.println("Son (ses) mentoré(s) est(sont):");
		}

		while (i.hasNext()) {
			Mentee maux = i.next();

			System.out.println(maux.getName() + " avec le numero de paie de "
					+ maux.getNum());
		}

		System.out.println("Salaire du mois : " + this.getSalary() + "\n");

	}

	public void displayReports(PrintWriter fic) {
		if (this.mentees.size() == 0) {
			fic.println("Nom : " + this.getName()
					+ " // Employé qui n'a pas de mentoré");

		}

		else {
			fic.println("Nom : " + this.getName() + " // Mentor");
		}

		super.displayReports(fic);

		Iterator<Mentee> i = this.mentees.iterator();

		if (this.mentees.size() > 0) {
			fic.println("Son (ses) mentoré(s) est(sont):");
		}

		while (i.hasNext()) {
			Mentee maux = i.next();

			fic.println(maux.getName() + " avec le numero de paie de "
					+ maux.getNum());
		}

		fic.println("Salaire du mois : " + this.getSalary() + "\n");

	}
}

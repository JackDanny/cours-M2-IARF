package p;

public class Mentee extends Employe {

	/** attributs */
	private Mentor mentor;

	/** constructeur */

	public Mentee() {
		super();
	}

	Mentee(String nom, int num, float salaryB) {

		super(nom, num, salaryB);

	}

	/** methodes */

	public void setMentor(Mentor ment) {
		this.mentor = ment;
	}

	public Mentor getMentor() {
		return this.mentor;
	}

	/** bonus = 10% si langage = Java */
	public float bonus() {

		if ((this.getLangage()).equals("Java")) {
			return 10;
		} else {
			return 0;
		}
	}

	public float getSalary() {
		return (this.salaryBase) * (1 + (this.bonus() / 100));

	}

	public void display() {

		System.out.println("Nom : " + this.getName() + " // Mentoré");
		super.display();

		if (this.getMentor() != null) {
			System.out.println("son Mentor est " + this.getMentor().getName()
					+ "avec le numero de paie " + this.getMentor().getNum());
		} else {
			System.out.println("Il n'a pas de Mentor");
		}
		System.out.println("Salaire du mois : " + this.getSalary() + "\n");

	}

}
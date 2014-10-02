package p;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("hello world");
		Company c = new Company("Nestlé");
		System.out.println(c.toString());

		Mentee m1 = new Mentee("Vincent", 5201, 1000.f);
		m1.setLangage("Java");
		c.addEmploye(m1);

		m1.display();

	}

}

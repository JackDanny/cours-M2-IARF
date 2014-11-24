package p;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Iterator;


public class Main {

	public static void main(String[] args) {

		Company c = new Company("Nestlé");

		// Mentor mo1= new Mentor("Jean",5200,1000.f);
		// mo1.setLangage("C++");
		//
		// Mentee me2 = new Mentee("Vincent", 5201, 1000.f);
		// me2.setLangage("Java");
		//
		// //mentor de vincent est marc
		// //c.addEmploye(me2, mo);
		//
		// Mentee me3 = new Mentee("Camille", 5202, 1000.f);
		// me3.setLangage("Java");
		//
		// Mentor mo4 = new Mentor("Marc",5203,1210.f);
		// mo4.setLangage("Java");
		//
		//
		// c.addEmploye(mo1);
		//
		// c.addEmploye(me2);
		// c.addEmploye(me2,mo4);
		// c.addEmploye(me3,mo4);
		// c.addEmploye(mo4);
		//
		//
		//
		// c.displayEmployes();
		//
		//
		// mo1.display();
		// me2.display();
		// me3.display();
		// mo4.display();
		// si on veut lire à partir d'init.txt

		Main.lireinfo(c);
		Main.menu(c);

		/*
		 * c.displayEmployes();
		 * 
		 * c.displayReports("report.txt");
		 */
	}

	/** pour recuperer les infos à partir de init.txt */
	static void lireinfo(Company c) {

		BufferedReader br = null;

		try {
			br = new BufferedReader(new FileReader("init.txt"));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		String ligne = null;
		String[] champs = null;
		String prenom = null;
		int numPay = 0;
		float salaryB;
		String langage;
		int numPayMentor = 0;
		Mentor e1 = null;
		Mentee e2 = null;
		// 
		try {
			while ((ligne = br.readLine()) != null) {

				champs = ligne.split(",");
				prenom = champs[0];
				numPay = Integer.parseInt(champs[1]);
				salaryB = Float.parseFloat(champs[2]);
				langage = champs[3];

				//si on a quatre champs sur la ligne,
				//c'est que l'employe est un mentor, car il n'a pas de mentor attitr�

				if (champs.length == 4) {

					e1 = new Mentor(prenom, numPay, salaryB);
					e1.setLangage(langage);
					//on ajoute e1 aux employes de la compagnie
					c.addEmploye(e1);

				}
				// si on a 5 champ c'est que l'employe est un mentee et qu'il a un mentor
				else if (champs.length == 5) {

					//on recupere les infos du Mentee
					e2 = new Mentee(prenom, numPay, salaryB);
					e2.setLangage(langage);

					//on recupere les infos du Mentor
					numPayMentor = Integer.parseInt(champs[4]);
					e1 = (Mentor) c.findEmploye(numPayMentor);

					//on ajoute le mentor et le mentee qui lui est associ�
					c.addEmploye(e2, e1);

				} else {
					System.out.println("nombre de champs incorects");
				}

			}

		} catch (IOException e) {

			e.printStackTrace();
		}

	}
	//affichage du menu a l'utilisateur
	static void menu(Company c) {
		System.out.println("\nMENU\n");
		System.out.println("choisissez une commande (puis entree):\n");
		System.out.println("1: afficher les infos des employes");
		System.out.println("2: generer le raport (dans report.txt)");
		System.out
		.println("3: detail d'un employé (à partir de son num de paye)");
		System.out
		.println("4: modifier le langage spécialisé d'un employé (à partir de son numero de paie)");
		System.out.println("5: ajouter des employés");

		BufferedReader br = null;

		br = new BufferedReader(new InputStreamReader(System.in));
		int choix = 0;
		try {
			choix = Integer.parseInt(br.readLine());
		}catch(NumberFormatException e){
			System.out.println("entier necessaire");
			Main.menu(c);

		}
		catch (IOException e) {



			e.printStackTrace();
		}

		switch (choix) {
		case 1:
			c.displayEmployes();
			break;
		case 2:
			c.displayReports("report.txt");
			break;
		case 3:
			Main.infoEmploye(c);
			break;
		case 4:
			Main.setLangageEmploye(c);
			break;
		case 5:
			Main.ajouteEmploye(c);
			break;

		default:
			System.out.println("Veuillez entrer une action possible");
			Main.menu(c);
		}


		try {
			System.out.println("appuyer sur entree pour continuer");
			br.readLine();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			Main.menu(c);
		}

		Main.menu(c);

	}

	private static void ajouteEmploye(Company c) {
		System.out.println("numero de l'employe");
		//on recupere le numero de l'employe
		BufferedReader br = null;
		br = new BufferedReader(new InputStreamReader(System.in));
		int numPay = 0;

		try {
			numPay = Integer.parseInt(br.readLine());
		}catch(NumberFormatException e){
			System.out.println("ANNULATION");

			System.out.println("Il fallait entrer un entier");
			Main.menu(c);

		}
		catch (IOException e) {
			e.printStackTrace();
		}
		Employe emp = c.findEmploye(numPay);
		if(emp!=null){
			System.out.println("ANNULATION");
			System.out.println("un employe de numero " + emp.getNum() + " existe deja");
			Main.menu(c);
		}
		System.out.println("nom de l'employe");
		String nomEmploye = null;
		try {
			nomEmploye=br.readLine();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("salaire de base");

		float salaireBase = 0;

		try {
			salaireBase=Float.parseFloat(br.readLine());
		} catch (NumberFormatException e) {
			System.out.println("Veuillez entrer un nombre flottant");
			Main.menu(c);

		}catch (IOException e ){

			e.printStackTrace();
		}
		String langage = null;
		System.out.println("langage de programation");
		try {
			langage=br.readLine();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("num "+numPay+ " nom " +nomEmploye+ " langage " + langage);

		System.out.println("cet employe est il un mentor ayant des mentores?(y/n)");
		String reponse = null;		
		try {
			reponse=br.readLine();
		} catch (IOException e) {
			e.printStackTrace();
		}
		if(reponse.equals("y")){
			System.out.println("numero du mentore?");
			int numMentore = 0;
			try {

				numMentore = Integer.parseInt(br.readLine());

			}catch(NumberFormatException e){
				System.out.println("ANNULATION");

				System.out.println("Il fallait entrer un entier");
				Main.menu(c);
			}catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			Employe empl= c.findEmploye(numMentore);
			if(empl == null){
				System.out.println("ANNULATION");
				System.out.println("pas d'employe numero "+ numMentore + ". Veuillez d'abord creer un employe " + numMentore + " avant de lui associer un mentor");

				
				
			}
			else{
				Mentor ment = new Mentor(nomEmploye,numPay,salaireBase);
				ment.setLangage(langage);
				c.addEmploye(ment);
				c.addEmploye(empl, ment);
			}
		}
		else{
			Mentor ment = new Mentor(nomEmploye,numPay,salaireBase);
			ment.setLangage(langage);
			c.addEmploye(ment);
		}




	}

	static void infoEmploye(Company c) {
		System.out.println("Entrez le numero de paye de l'employe");

		BufferedReader br = null;
		br = new BufferedReader(new InputStreamReader(System.in));
		int numPay = 0;
		try {
			numPay = Integer.parseInt(br.readLine());
		}catch(NumberFormatException e){
			System.out.println("Il fallait un entier");
			Main.menu(c);

		}
		catch (IOException e) {
			e.printStackTrace();
		}

		Employe e = null;
		e = c.findEmploye(numPay);
		if (e != null) {
			e.display();
		}

	}

	static void setLangageEmploye(Company c) {
		System.out.println("Entrez le numero de paye de l'employe");

		BufferedReader br = null;
		br = new BufferedReader(new InputStreamReader(System.in));
		int numPay = 0;

		try {
			numPay = Integer.parseInt(br.readLine());
		} catch (NumberFormatException e1) {
			System.out.println("\nENTIER NECESSAIRE");
			Main.menu(c);

			e1.printStackTrace();
		} catch (IOException e1) {

			e1.printStackTrace();
		}

		System.out.println("Entrez le nouveau langage");

		String langage = null;
		try {
			langage = br.readLine();
		} catch (IOException e) {
			e.printStackTrace();
		}

		Employe e = null;
		e = c.findEmploye(numPay);
		if (e != null) {
			e.setLangage(langage);
			if(e instanceof Mentee){
				((Mentee) e).resoudIncoherence();
			}
			else if(e instanceof Mentor){


				Iterator<Mentee> iterator = ((Mentor) e).getMentees().iterator(); 
				while(iterator.hasNext()){
					iterator.next().resoudIncoherence();

				}


			}

		}

	}



}

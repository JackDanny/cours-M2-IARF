package p;

import java.io.FileWriter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Iterator;

public class Company {

	/** attributs */

	private String name; // nom de l'entreprise

	//ensemble des employes de la companie
	private HashSet<Employe> hsEmp = new HashSet<Employe>(); 

	/** methodes */

	// constructeurs
	public Company() {

	}

	public Company(String nom) {
		this.name = nom;
	}

	/** pour ajouter un employee a la companie */

	//ajouter un employe
	public void addEmploye(Employe emp) {

		this.hsEmp.add(emp);

	}


	//TODO
	//verifier que on ne peut pas ecraser le mentor d'un mentee


	//ajoute un mentee et un mentor a l'entreprise si il n'y sont pas deja, puis
	//associe le mentor au mentee et ajoute le mentee aux mentee du mentor
	//TODO

	//il faut qu'ils aient le meme language pour les ajouter
	public void addEmploye(Employe me, Mentor mo) {




		//on verifie si ils ont le m�me langage
		if(me.getLangage().equals(mo.getLangage())){




			//si l'employe est un mentee, pas de probleme

			if(me instanceof Mentee){

				//on verifie que le mentee n'a pas de mentor
				if(((Mentee) me).getMentor()!=null){
					System.out.println("impossible, le mentor " + ((Mentee) me).getMentor().getNum() +" est deja associé au mentorée " + me.getNum());

				}
				//sinon
				else{
					//on associe le mentor a l'employe
					mo.addMentee((Mentee) me);
					((Mentee) me).setMentor(mo);

					//on supprime l'ancien me
					this.suppEmploye(me.getNum());
					//on ajoute le mentee
					this.hsEmp.add(me);
					//on ajoute le mentor
					this.hsEmp.add(mo);
				}


			}
			//si l'employe est un Mentor qui n'a pas de Mentee, il faut le caster en Mentee puis le
			//rajouter aux Mentee du mentor
			else if(me instanceof Mentor){
				if(((Mentor) me).hasMentee()){
					System.out.println("impossible, l'employé " + me.getNum() +" est un mentor qui a au moins un mentoré");
				}

				Mentee me2=new Mentee(me.getName(),me.getNum(),me.getSalaryB());
				me2.setLangage(me.getLangage());
				mo.addMentee(me2);
				me2.setMentor(mo);

				this.suppEmploye(me.getNum());
				//on ajoute le mentee
				this.hsEmp.add(me2);
				//on ajoute le mentor
				this.hsEmp.add(mo);


			}
			//si l'employe n'est ni mentor ni mentoree
			else{
				
				Mentee me2=new Mentee(me.getName(),me.getNum(),me.getSalaryB());
				me2.setLangage(me.getLangage());
				mo.addMentee(me2);
				me2.setMentor(mo);

				this.suppEmploye(me.getNum());
				//on ajoute le mentee
				this.hsEmp.add(me2);
				//on ajoute le mentor
				this.hsEmp.add(mo);
				
			}






		}
		else{
			//le mentor et le mentore n'ont pas le meme language
			System.out.println("l'employee numero " + me.getNum() + " ne peut etre mentore de " + mo.getNum() + " car ils n'ont pas le meme language.");
			this.hsEmp.add(me);
			this.hsEmp.add(mo);



		}


		//on associe le mentee au mentor

	}




	//TODO

	//supprimer un employe
	public void suppEmploye(int num){
		Employe e = this.findEmploye(num);

		//		Iterator<Employe> i = this.hsEmp.iterator();
		//		//pour chaque employe
		//		while (i.hasNext()) {
		//			//on ecrit ses informations dans le fichier fic
		//			if(i.next().getNum()==num){
		this.hsEmp.remove(e);

		//			}
	}






	//TODO
	//	public void addEmploye(Mentor mo, Mentor mo) {
	//		//on ajoute le mentee
	//		this.hsEmp.add(me);
	//		//on ajoute le mentor
	//		this.hsEmp.add(mo);
	//		//on associe le mentor a l'employe
	//		me.setMentor(mo);
	//		//on associe le mentee au mentor
	//		mo.addMentee(me);
	//	}
	//	



	//getter sur le nom
	public String getName() {
		return this.name;
	}

	//pour afficher les infos de tout les employes de l'entreprise
	public void displayEmployes() {
		System.out.println("Calcul des salaires mensuels des employes de "
				+ this.getName());
		Iterator<Employe> i = this.hsEmp.iterator();
		//pour chaque employe
		while (i.hasNext()) {
			//on affiche ses infos
			i.next().display();
		}

	}

	//ecrit dans le fichier theFile les infos sur les employes
	public void displayReports(String theFile) {
		PrintWriter fic = null;


		try {
			fic = new PrintWriter(new FileWriter(theFile));
		} catch (IOException e) {
			e.printStackTrace();
		}

		fic.println("Calcul des salaires mensuels des employes de "
				+ this.getName());
		Iterator<Employe> i = this.hsEmp.iterator();
		//pour chaque employe
		while (i.hasNext()) {
			//on ecrit ses informations dans le fichier fic
			i.next().displayReports(fic);
		}

		fic.close();

	}

	/** trouve un employe avec le numero de paye indique */


	public Employe findEmploye(int numPay) {

		Iterator<Employe> i = this.hsEmp.iterator();
		Employe e = null;
		//pour chaque employe
		while (i.hasNext()) {
			e = i.next();
			//si il a le numero de paye on le renvoie
			if (e.getNum() == numPay) {
				return e;
			}
		}

		System.out.println("Aucun employe ne correspond au numero " + numPay);
		return null;
	}

}

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class Main {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int k=2;

		BufferedReader IN = null;

		try {
			IN = new BufferedReader(new FileReader("example6.col"));

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String ligne = null;
		String[] champs = null;
		int nbSommets=0;
		int nbArc=0;

		int[] sommets = {0,0};

		ArrayList<int[]> tabArc = new ArrayList<int[]>();

		// on a ou pas la ligne qui commence par p
		boolean ligneGraphe = false;
		try {

			while ((ligne = IN.readLine()) != null && (!ligneGraphe)) {
				champs = ligne.split(" ");

				if ((champs.length == 4) && (champs[0].compareTo("p") == 0 && champs[1].compareTo("edge") == 0)) {
					//System.out.println(ligne);

					nbSommets = Integer.parseInt(champs[2]);
					nbArc = Integer.parseInt(champs[3]);
					ligneGraphe = true;
					break;

				} 
				else {
					System.out.println("pas de fichier graphe");
				}

			}



			System.out.println(ligneGraphe);


			//si la ligne est présente on continue
			if (ligneGraphe) {
				while ((ligne = IN.readLine()) != null) {
					champs = ligne.split(" ");
					// System.out.println(champs[0]);

					if ((champs.length == 3) && (champs[0].compareTo("e") == 0)) {
						sommets[0] = Integer.parseInt(champs[1]);
						sommets[1] = Integer.parseInt(champs[2]);
						//on rajoute les deux sommets à la liste des arcs
						tabArc.add(sommets.clone());


					} 
					else {
						//						System.out.println("ligne bizarre:");
						//						System.out.println(ligne);
					}

				}

			}


			//			for(int i=0;i<tabArc.size();i++){
			//							System.out.println("arc " + tabArc.get(i)[0] + " " + tabArc.get(i)[1]);
			//
			//			}




		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		//on a k couleurs pour chaque sommets donc k*nbSommets variables
		int nbVariable=k*nbSommets;


		//on a ((k*(k-1))/2) + 1 contraintes sur les couleurs pour chaque sommets donc

		// nbSommets * ( (k*(k-1))/2) + 1 ) contraintes pour les couleurs
		//on a k contraintes pour chaque arc donc
		// k*nbArc contraintes pour les arcs
		int nbClauses=( nbSommets * ( ((k*(k-1))/2) + 1 ) ) + (k*nbArc);


		try {
			PrintWriter fic = new PrintWriter(new FileWriter("superFichier"));
			fic.println("p cnf " + nbVariable + " " +  nbClauses);

			//liste contenant toutes les variables tries
			ArrayList<Integer> var= new ArrayList<Integer>();

			//liste contenant toutes les contraintes de couleur pour le sommet courant
			ArrayList<ArrayList<Integer>> listevar= new ArrayList<ArrayList<Integer>>();


			//pour chaque sommet var contient les indices des variables correspondant aux couleurs relative au sommet j
			for(int j=0;j<nbSommets;j++){
				var.clear();
				for(int i=0;i<k;i++){
					var.add(i+k*j+1);
				}

				//on vide listevar
				listevar.clear();

				//on remplit listevar
				listevar=contrainteCouleurs(var);

				//				for(int i1 = 0; i1<listevar.size();i1++){
				//					System.out.println("contrainte "+i1);
				//					for(int i2 = 0; i2<listevar.get(i1).size();i2++){
				//						System.out.print(listevar.get(i1).get(i2)+" ");
				//						
				//					}
				//					System.out.println();
				//					
				//				}

				//on ecrit les contraintes dans le fichier
				for(int i1 = 0; i1<listevar.size();i1++){

					for(int i2 = 0; i2<listevar.get(i1).size();i2++){
						fic.print(listevar.get(i1).get(i2)+" ");

					}
					fic.println("0");

				}




			}

			//			for(int i = 0; i< nbArc; i++){
			//				System.out.println("arcs "+ i);
			//				System.out.println(tabArc.get(i)[0]);
			//				System.out.println(tabArc.get(i)[1]);
			//				       
			//				       
			//			}
			//			

			//GESTION DES CONTRAINTES LIEES AUX ARCS

			//liste de l'opposé toutes les variable
			int[] listeallvariable = new int[nbVariable];

			for(int i=0 ;i< nbVariable ;i++){
				listeallvariable[i] = -(i+1);
			}
			//on recupere tous les arcs
			for(int numArc = 0; numArc< nbArc; numArc++){
				//on recupere les deux sommets de l'arc
				int sommet1 = tabArc.get(numArc)[0];
				int sommet2 = tabArc.get(numArc)[1];


				for(int i=0;i<k;i++){
					//on part de la position de la première variable correspondant a la couleur du sommet1 et on gere
					//toutes ses couleurs. De même avec le sommet2
					fic.print(listeallvariable[((sommet1-1)*k)+i] + " ");
					fic.print(listeallvariable[((sommet2-1)*k)+i] +" 0\n");

				}

			}










			fic.close();


		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}




	}

	@SuppressWarnings("unchecked")
	public static ArrayList<ArrayList<Integer>> contrainteCouleurs(ArrayList<Integer> coulSommets){
		ArrayList<ArrayList<Integer>> contraintes = new ArrayList<ArrayList<Integer>>();

		ArrayList<Integer> contrainteActuel = new ArrayList<Integer>();
		
		contraintes.add((ArrayList<Integer>) coulSommets.clone());
		

		//contrainteActuel = (ArrayList<Integer>) coulSommets.clone();

		for(int i=0;i<coulSommets.size();i++){



			for(int j = i+1;j<coulSommets.size();j++){
				contrainteActuel.add(-coulSommets.get(i));
				contrainteActuel.add(-coulSommets.get(j));
				contraintes.add((ArrayList<Integer>) contrainteActuel.clone());
				contrainteActuel.clear();

			}


		}

		return contraintes;

	}



}



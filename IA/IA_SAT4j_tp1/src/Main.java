import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;

public class Main {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BufferedReader IN = null;

		try {
			IN = new BufferedReader(new FileReader("example6.col"));

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String ligne = null;
		String[] champs = null;
		// int nbSommets;
		// int nbArc;

		int[] sommets = {0,0};

		ArrayList<int[]> tabArc = new ArrayList<int[]>();

		// on a la ligne qui commence par p
		boolean ligneGraphe = false;
		try {

			while ((ligne = IN.readLine()) != null && (!ligneGraphe)) {
				champs = ligne.split(" ");

				if ((champs.length == 4) && (champs[0].compareTo("p") == 0 && champs[1].compareTo("edge") == 0)) {
					//System.out.println(ligne);

					sommets[0] = Integer.parseInt(champs[2]);
					sommets[1] = Integer.parseInt(champs[3]);
					ligneGraphe = true;
					break;

				} 
				else {
					System.out.println("pas de fichier graphe");
				}

			}

			int sommet1;
			int sommet2;

			System.out.println(ligneGraphe);
			if (ligneGraphe) {
				while ((ligne = IN.readLine()) != null) {
					champs = ligne.split(" ");
					// System.out.println(champs[0]);
					
					if ((champs.length == 3) && (champs[0].compareTo("e") == 0)) {
						sommets[0] = Integer.parseInt(champs[1]);
						sommets[1] = Integer.parseInt(champs[2]);
						tabArc.add(sommets.clone());
						

					} 
					else {
						System.out.println("ligne bizarre:");
						System.out.println(ligne);
					}

				}

			}
			
			
			for(int i=0;i<tabArc.size();i++){
				
					System.out.println("arc " + tabArc.get(i)[0] + " " + tabArc.get(i)[1]);


			}
		



	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

}

}



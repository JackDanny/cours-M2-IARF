public class House{

	public static void main(String[] args) {
		//House h1 = new House("rue Paumé","Toulouse");
		House h1 = new House();
		House h2 = new House("rue street","New-York");
		House h3 = new House("rue Strasse","Berlin",5);

		h1.setNumberOfRoom(5);
		h2.setNumberOfRoom(5);
		h3.setNumberOfRoom(5);


		System.out.println("h1");
		/*
        System.out.println("adresse: " + h1.getAddress());
        System.out.println("ville: " + h1.getCity());
        System.out.println("nb chambre: " + h1.getNumberOfRoom() + "\n");
		 */

		h1.display();


		System.out.println("h2");
		/*System.out.println("adresse: " + h2.getAddress());
        System.out.println("ville: " + h2.getCity());
        System.out.println("nb chambre: " + h2.getNumberOfRoom() + "\n");
		 */

		h2.display();

		System.out.println("h3");
		/*
        System.out.println("adresse: " + h3.getAddress());
        System.out.println("ville: " + h3.getCity());
        System.out.println("nb chambre: " + h3.getNumberOfRoom() + "\n");
		 */

		h3.display();

		System.out.println("nb total de chambres: " + (h1.getNumberOfRoom()+h2.getNumberOfRoom()+h3.getNumberOfRoom()) + "\n");

		//on affiche l'@ de h1 si toString pas redefinit
		System.out.println(h1);

		//System.out.println(h1.toString());
		/*

		h1.setNumberOfRoom(5);
		h2.setNumberOfRoom(6);

		System.out.println("nb de chambre h1: " + h1.getNumberOfRoom());
		System.out.println("nb de chambre h2: " + h2.getNumberOfRoom());		

		System.out.println("nb de chambre total: " + (h1.getNumberOfRoom()+h2.getNumberOfRoom()));
		 */
		System.out.println("\ncomparaison h1 et h2");
		h1.setNumberOfRoom(4);
		h2.setNumberOfRoom(6);
		System.out.println(h1.compare(h2));
		System.out.println(House.compare2(h2,h1));

	}


	//OPERATIONS

	public House(){

	}
	public House(String anAddress, String aCity){
		this.theAddress = anAddress;
		this.theCity = aCity;
	}

	public House(String anAddress, String aCity, int aNumberOfRoom){
		this.theAddress = anAddress;
		this.theCity = aCity;
		this.theNumberOfRoom=aNumberOfRoom;

	}






	public String getAddress(){
		return this.theAddress;

	}
	public String getCity(){
		return this.theCity;
	}

	public int getNumberOfRoom(){
		return this.theNumberOfRoom;
	}
	public void setNumberOfRoom(int newNumber){
		this.theNumberOfRoom = newNumber;

	}

	public void display(){
		/*System.out.println("adresse: " + this.theAddress);
		System.out.println("ville: " + this.theCity);
		System.out.println("nb de chambre: " + this.theNumberOfRoom);
		 */
		System.out.println(this);
	}

	public String toString(){
		return ("maison \n" + "adresse: " + this.theAddress + "\nville: " + this.theCity + "\nnb de chambre: " + this.theNumberOfRoom);

	}
	//retourne 1 si l'instance courante a le plus de chambre, 0 si même nb et -1 sinn
	public int compare(House h){
		if(h.theNumberOfRoom == this.theNumberOfRoom){
			return 0;
		}
		else if(this.theNumberOfRoom > h.theNumberOfRoom){
			return 1;

		}
		else return -1;


	}

	public static int compare2(House h1,House h2){
		if(h1.theNumberOfRoom == h2.theNumberOfRoom){
			return 0;
		}
		else if(h1.theNumberOfRoom > h2.theNumberOfRoom){
			return 1;

		}
		else return -1;


	}



	//ATTRIBUTES
	private String theAddress;
	private String theCity;
	private int theNumberOfRoom;
}



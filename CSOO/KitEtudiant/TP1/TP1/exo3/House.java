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
        System.out.println("adresse: " + h1.getAddress());
        System.out.println("ville: " + h1.getCity());
        System.out.println("nb chambre: " + h1.getNumberOfRoom() + "\n");
        
        
       
        System.out.println("h2");
        System.out.println("adresse: " + h2.getAddress());
        System.out.println("ville: " + h2.getCity());
        System.out.println("nb chambre: " + h2.getNumberOfRoom() + "\n");
        
        System.out.println("h3");
        System.out.println("adresse: " + h3.getAddress());
        System.out.println("ville: " + h3.getCity());
        System.out.println("nb chambre: " + h3.getNumberOfRoom() + "\n");
		 
        System.out.println("nb total de maison: " + (h1.getNumberOfRoom()+h2.getNumberOfRoom()+h3.getNumberOfRoom()) + "\n");
        
        
		/*
		
		h1.setNumberOfRoom(5);
		h2.setNumberOfRoom(6);

		System.out.println("nb de chambre h1: " + h1.getNumberOfRoom());
		System.out.println("nb de chambre h2: " + h2.getNumberOfRoom());		

		System.out.println("nb de chambre total: " + (h1.getNumberOfRoom()+h2.getNumberOfRoom()));
		*/
		
		
		
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


	//ATTRIBUTES
	private String theAddress;
	private String theCity;
	private int theNumberOfRoom;
}



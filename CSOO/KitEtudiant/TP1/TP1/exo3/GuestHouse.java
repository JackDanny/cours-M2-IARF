public class GuestHouse extends House{

	public static void main(String[] args) {
		
		GuestHouse gh1 = new GuestHouse("rue cassoulet","Toulouse",5,"Dracula");
		//gh1.display();
		House m1 = new House("rue Strasse","Berlin",5);
		//m1.display();
		
		m1 = gh1;
		gh1.display();
		m1.display();
		
		
		//on ne peut pas faire ca
		//hostName = m1.getHostName();
		//hostName = ((GuestHouse)m1).getHostName();
		String hostName = ((GuestHouse)m1).getHostName();
		//refuse d'afficher
		//System.out.println(hostName):
		System.out.println(((GuestHouse)m1).getHostName());
		m1.display();
		
	}

	public GuestHouse(String anAddress, String aCity, int aNumberOfRoom,String hn){
		super(anAddress,aCity,aNumberOfRoom);
		this.hostName = hn;
	}
	
	
	public String getHostName(){
		return this.hostName;
	}
	
	public void setHostName(String hn){
		this.hostName=hn;
	}
	
	public void display(){
		
		System.out.println(this.toString());
		
	}
	
	public String toString(){
		return (super.toString() + "\nhostname: " + getHostName());

	}

	//ATTRIBUTES
	private String hostName;
	
	
	
}



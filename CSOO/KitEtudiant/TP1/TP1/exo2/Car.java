/*est-ce une application?*/

public class Car{
	//OPERATIONS
	public Car(String aMake, String aModel, int aCapacity){
        this.theMake=aMake;
        this.theModel=aModel;
        this.theCapacity=aCapacity;

    }
    public String getMake(){
        return this.theMake;
    }
	public String getModel(){
        return this.theModel;
    }
	public int getCapacity(){
        return this.theCapacity;
    }


	//ATTRIBUTES
	private String theMake;
	private String theModel;
	private int theCapacity;

   public static void main(String[] args) {
    Car car1=new Car("Peugeot","806",8);
    Car car2=new Car("citroen","DS3",4);
    System.out.println(car1.getMake());
    System.out.println(car2.getModel());
    System.out.println(car1.getCapacity());


  }

}



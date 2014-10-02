package p1;

import java.util.*;


/**
 * Class Employe
 */
abstract public class Employe {

  //
  // Fields
  //

  private String nom;
  private int num;
  private float salaryBase;
  private String langage;
  
  //
  // Constructors
  //
  public Employe () { };
  
  //
  // Methods
  //


  //
  // Accessor methods
  //

  /**
   * Set the value of nom
   * @param newVar the new value of nom
   */
  private void setNom (String newVar) {
    nom = newVar;
  }

  /**
   * Get the value of nom
   * @return the value of nom
   */
  private String getNom () {
    return nom;
  }

  /**
   * Set the value of num
   * @param newVar the new value of num
   */
  private void setNum (int newVar) {
    num = newVar;
  }

  /**
   * Get the value of num
   * @return the value of num
   */
  private int getNum () {
    return num;
  }

  /**
   * Set the value of salaryBase
   * @param newVar the new value of salaryBase
   */
  private void setSalaryBase (float newVar) {
    salaryBase = newVar;
  }

  /**
   * Get the value of salaryBase
   * @return the value of salaryBase
   */
  private float getSalaryBase () {
    return salaryBase;
  }

  /**
   * Set the value of langage
   * @param newVar the new value of langage
   */
  private void setLangage (String newVar) {
    langage = newVar;
  }

  /**
   * Get the value of langage
   * @return the value of langage
   */
  private String getLangage () {
    return langage;
  }

  //
  // Other methods
  //

  /**
   * @param        nom
   * @param        num
   * @param        salaryB
   */
  public void Employe(String nom, int num, Float salaryB)
  {
  }


  /**
   */
  public void Employe()
  {
  }


  /**
   * @param        langage
   */
  public void setLangage(String langage)
  {
  }


  /**
   * @return       String
   */
  public String getLangage()
  {
  }


  /**
   */
  public void display()
  {
  }


  /**
   * @return       int
   */
  abstract public int bonus();


  /**
   * @return       float
   */
  abstract public float getSalary();


}

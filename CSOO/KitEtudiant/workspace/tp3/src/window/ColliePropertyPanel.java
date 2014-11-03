/**
 *  The ColliePropertyPanel is a placeholder panel which will be used to
 *	display the properties of selected model elements.
 *
 *  This class implements the singleton design pattern.
 *
 *  @author	K Barclay
 */



package window;



import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.InputMethodEvent;
import java.awt.event.InputMethodListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.util.ArrayList;

import javax.swing.*;



public final class ColliePropertyPanel 		extends JPanel {

    public static ColliePropertyPanel	getColliePropertyPanel()	{ return colliePropertyPanel; }
    
    
    
    protected 				ColliePropertyPanel() {
    	super();
    	nomClasse = new JTextField();
    	nomElement = new JTextField();
    	modifAttributes = new JTextField();
    	modifAttributes.addKeyListener(new ModifAction());
    	listAttributes = new JComboBox();
    	listAttributes.addItemListener(new SelectAction());
    	validButton = new JButton("valider");
    	validButton.addActionListener(new ValidAction());
    	gestAffich = new GridLayout(4,2);
    	this.setLayout(gestAffich);
    	this.add(new JLabel("classe"));
    	this.add(nomClasse);
    	this.add(new JLabel("element"));
    	this.add(nomElement);
    	this.add(listAttributes);
    	this.add(modifAttributes);
    	this.add(validButton);
    	//this.nomClasse.setVisible(false);
    }
    
    //Listener pour le bouton de validation
    class ValidAction extends AbstractAction{

		@Override
		public void actionPerformed(ActionEvent arg0) {
			// TODO Auto-generated method stub
			//Parcours de tous les éléments du diagramme
			for(int i=0; i<CollieModelPanel.getCollieModelPanel().getDiagram().getModelList().size();i++)
			{
				//Récupération de l'élément sélectionné
				if( CollieModelPanel.getCollieModelPanel().getDiagram().getModelList().get(i).isSelected())
				{
					//Mise à jour des éléments du noeud sélectionné
					CollieModelPanel.getCollieModelPanel().getDiagram().getModelList().get(i).setClassifier(ColliePropertyPanel.getColliePropertyPanel().getClasse().getText());
					CollieModelPanel.getCollieModelPanel().getDiagram().getModelList().get(i).setName(ColliePropertyPanel.getColliePropertyPanel().getNom().getText());
					//Nettoyage de la liste d'attribut
					CollieModelPanel.getCollieModelPanel().getDiagram().getModelList().get(i).getAttributes().clear();
					//remplissage de la liste d'attribut (on commence à 1 pour éviter d'ajouter l'item "Ajout d'un attribut"
					for(int it=1; it<ColliePropertyPanel.getColliePropertyPanel().getList().getItemCount();it++)
					{					
						CollieModelPanel.getCollieModelPanel().getDiagram().getModelList().get(i).getAttributes().add(ColliePropertyPanel.getColliePropertyPanel().getList().getItemAt(it));
					}
				}
			}
			//Màj de l'affichage
			CollieModelPanel.getCollieModelPanel().repaint();
		}
    	
    }
    
    //Listener pour la liste déroulante
    class SelectAction implements ItemListener{

		@Override
		public void itemStateChanged(ItemEvent arg0) {
			// TODO Auto-generated method stub
			//lors de la sélection d'un item de la liste, on affiche sa valeur dans le textfield pour pouvoir y apporter des modifications
			if(arg0.getStateChange() == ItemEvent.SELECTED)
			{
				String value = (String) ColliePropertyPanel.getColliePropertyPanel().getList().getSelectedItem();
				ColliePropertyPanel.getColliePropertyPanel().setAttributeField(value);
			}
		}		
    }
    
    //Listener pour le textfield de modification d'un attribut
    class ModifAction implements KeyListener{
		@Override
		public void keyPressed(KeyEvent arg0) {
			// TODO Auto-generated method stub
			//Lors d'un appui sur la touche entrée, on va mettre à jour la liste dans la liste déroulante
			if( ((KeyEvent)arg0).getKeyCode() == KeyEvent.VK_ENTER)
			{
				String newValue = ColliePropertyPanel.getColliePropertyPanel().getAttributeField().getText();
				int indexSelected = ColliePropertyPanel.getColliePropertyPanel().getList().getSelectedIndex();
				//ajout d'un nouvel attribut
				if((indexSelected == 0) && (!newValue.isEmpty()))
				{
					ColliePropertyPanel.getColliePropertyPanel().getList().addItem(newValue);
					
				}
				//modification d'un attribut
				if((indexSelected != 0) && (!newValue.isEmpty()))
				{
					
					ColliePropertyPanel.getColliePropertyPanel().getList().insertItemAt(newValue, indexSelected);
					ColliePropertyPanel.getColliePropertyPanel().getList().setSelectedIndex(indexSelected);
					ColliePropertyPanel.getColliePropertyPanel().getList().removeItemAt(indexSelected+1);
				}
			}
		}

		@Override
		public void keyReleased(KeyEvent arg0) {
			// TODO Auto-generated method stub
			
		}

		@Override
		public void keyTyped(KeyEvent arg0) {
			// TODO Auto-generated method stub
			
		}

    	
    }
    /*Getters and Setters*/
    public JTextField getClasse()
    {
    	return this.nomClasse;
    }
    
    public void setClasse(String nomClasse)
    {
    	this.nomClasse.setText(nomClasse);
    }
    
    public void setNomElement(String nomElement)
    {
    	this.nomElement.setText(nomElement);
    }
    
    public JTextField getNom()
    {
    	return this.nomElement;
    }
    
    public void setListAttributs(ArrayList list)
    {
    	//Pour remplir la liste d'attributs dans la liste déroulante, on créé une liste temporaire contenant tous les attributs 
    	//du noeud puis on y ajoute un item "Ajout element"
    	ArrayList temp = new ArrayList();
    	for(int i= 0; i<list.size();i++)
    	{
    		temp.add(list.get(i));
    	}
    	temp.add(0, "Ajout element");
    	
    	this.listAttributes.removeAllItems();
    	for(int i = 0; i< temp.size(); i++)
    	{
    		this.listAttributes.addItem(temp.get(i));
    	}
    }
    
    public void setAttributeField(String nomAttribut)
    {
    	this.modifAttributes.setText(nomAttribut);
    }
    
    public JTextField getAttributeField()
    {
    	return this.modifAttributes;
    }
    
    public JComboBox getList()
    {
    	return this.listAttributes;
    }
    
// ---------- properties ----------------------------------

    private static ColliePropertyPanel	colliePropertyPanel = new ColliePropertyPanel();
    private JTextField nomClasse, nomElement, modifAttributes;
    private JComboBox listAttributes;
    private JButton validButton;
    private GridLayout gestAffich;
    
}	// class ColliePropertyPanel

// ==================================================================

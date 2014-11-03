package dialog;

import java.awt.Color;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;

import javax.swing.AbstractAction;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextField;

import window.CollieModelPanel;
import window.ColliePropertyPanel;

public class EditAttributsDialog extends JDialog{
	GridLayout gestAffich;
	JComboBox listAttributs;
	JButton okButton, annulButton;
	JTextField modifAttribute;
	
	public EditAttributsDialog(JFrame parent, String title, boolean modal){
	    super(parent, title, modal);
	    this.setSize(550, 270);
	    this.setLocationRelativeTo(null);
	    this.setResizable(false);
	    this.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
	    
	    gestAffich = new GridLayout(2,2);
	    for(int i=0; i<CollieModelPanel.getCollieModelPanel().getDiagram().getModelList().size();i++)
		{
			//Récupération de l'élément sélectionné
			if( CollieModelPanel.getCollieModelPanel().getDiagram().getModelList().get(i).isSelected())
			{
				listAttributs = new JComboBox(CollieModelPanel.getCollieModelPanel().getDiagram().getModelList().get(i).getAttributes().toArray());
			}
		}
	    
	    okButton = new JButton("Valider");
	    annulButton = new JButton("Annuler");
	    modifAttribute = new JTextField();
	    
	    listAttributs.addItemListener(new ItemListener() {
			
			@Override
			public void itemStateChanged(ItemEvent arg0) {
				// TODO Auto-generated method stub
				if(arg0.getStateChange() == ItemEvent.SELECTED)
				{
					String value = (String) listAttributs.getSelectedItem();
					modifAttribute.setText(value);
				}
			}
		});
	    
	    okButton.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				for(int i=0; i<CollieModelPanel.getCollieModelPanel().getDiagram().getModelList().size();i++)
				{
					//Récupération de l'élément sélectionné
					if( CollieModelPanel.getCollieModelPanel().getDiagram().getModelList().get(i).isSelected())
					{
						//CollieModelPanel.getCollieModelPanel().getDiagram().getModelList().get(i).getAttributes().set(listAttributs.getSelectedIndex(), modifAttribute.getText());
						CollieModelPanel.getCollieModelPanel().getDiagram().getModelList().get(i).getAttributes().remove(listAttributs.getSelectedIndex());
						CollieModelPanel.getCollieModelPanel().getDiagram().getModelList().get(i).getAttributes().add(listAttributs.getSelectedIndex(), modifAttribute.getText());
						ColliePropertyPanel.getColliePropertyPanel().setListAttributs(CollieModelPanel.getCollieModelPanel().getDiagram().getModelList().get(i).getAttributes());
						break;
					}
				}
				setVisible(false);
			}
		});
	    
	    annulButton.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent arg0) {
				// TODO Auto-generated method stub
				setVisible(false);
			}
		});
	    
	    JPanel content = new JPanel();
	    content.setBackground(Color.white);
	    content.setLayout(gestAffich);
	    content.add(listAttributs);
	    content.add(modifAttribute);
	    content.add(okButton);
	    content.add(annulButton);
	    this.getContentPane().add(content);
	    
	    
	    
	    this.setVisible(true);
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
    
}

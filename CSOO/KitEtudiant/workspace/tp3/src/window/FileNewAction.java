package window;

import java.awt.event.ActionEvent;

import javax.swing.AbstractAction;
import javax.swing.ImageIcon;


public class FileNewAction extends AbstractAction{

	public FileNewAction(String string, ImageIcon imageIcon) {
		// TODO Auto-generated constructor stub
		super(string, imageIcon);
	}

	@Override
	public void actionPerformed(ActionEvent arg0) {
		// TODO Auto-generated method stub
		CollieModelPanel.getCollieModelPanel().getDiagram().getModelList().clear();
		ColliePropertyPanel.getColliePropertyPanel().getNom().setText("");
		ColliePropertyPanel.getColliePropertyPanel().getClasse().setText("");
		ColliePropertyPanel.getColliePropertyPanel().getAttributeField().setText("");
		ColliePropertyPanel.getColliePropertyPanel().getList().removeAllItems();
		CollieModelPanel.getCollieModelPanel().repaint();
	}

	
}

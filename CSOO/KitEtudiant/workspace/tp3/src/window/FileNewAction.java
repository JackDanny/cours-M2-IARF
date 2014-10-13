package window;

import java.awt.event.ActionEvent;

import javax.swing.ImageIcon;
import javax.swing.AbstractAction;

public class FileNewAction extends AbstractAction {

	public FileNewAction(String string, ImageIcon imageIcon) {
		super(string,imageIcon);
	}

	public void actionPerformed(ActionEvent arg0) {
		System.out.println(arg0.getActionCommand());
		
	}



}

package window;

import java.awt.event.ActionEvent;

import javax.swing.AbstractAction;
import javax.swing.ImageIcon;

public class FileOpenAction extends AbstractAction{

	public FileOpenAction(String string, ImageIcon imageIcon) {
		super(string,imageIcon);
	}


	public void actionPerformed(ActionEvent e) {
		System.out.println(e.getActionCommand());
		
	}

}

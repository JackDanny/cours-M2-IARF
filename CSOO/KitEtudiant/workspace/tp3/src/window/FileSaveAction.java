package window;

import java.awt.event.ActionEvent;

import javax.swing.AbstractAction;
import javax.swing.ImageIcon;

public class FileSaveAction extends AbstractAction{

	String comment;
	ImageIcon image;
	public FileSaveAction(String string, ImageIcon imageIcon) {
		// TODO Auto-generated constructor stub
		super(string, imageIcon);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		System.out.println(e.getActionCommand());
	}

	public void setEnabled(boolean b) {
		// TODO Auto-generated method stub
		
	}
	
}

package window;

import java.awt.event.ActionEvent;

import javax.swing.AbstractAction;

public class FileSaveAsAction extends AbstractAction{

	String comment;
	public FileSaveAsAction(String string) {
		// TODO Auto-generated constructor stub
		super(string);
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

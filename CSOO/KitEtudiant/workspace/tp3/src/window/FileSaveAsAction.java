package window;

import java.awt.event.ActionEvent;

import javax.swing.AbstractAction;

public class FileSaveAsAction extends AbstractAction{

	public FileSaveAsAction(String string) {
		super(string);
	}

	public void setEnabled(boolean newValue){
		super.setEnabled(newValue);
	}

	public void actionPerformed(ActionEvent e) {
		System.out.println(e.getActionCommand());
		
	}

}

package window;

import java.awt.event.ActionEvent;

import javax.swing.AbstractAction;

public class FileExitAction extends AbstractAction {

	public FileExitAction(String string) {
		super(string);
	}

	
	public void actionPerformed(ActionEvent e) {
		
		System.out.println(e.getActionCommand());
		System.exit(0);
	}

	
}

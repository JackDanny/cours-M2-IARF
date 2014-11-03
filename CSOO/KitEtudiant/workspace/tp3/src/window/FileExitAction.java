package window;

import java.awt.event.ActionEvent;

import javax.swing.AbstractAction;

public class FileExitAction extends AbstractAction{

	String comment;
	public FileExitAction(String string) {
		// TODO Auto-generated constructor stub
		super(string);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		System.out.println(e.getActionCommand());
		System.exit(0);
	}

}

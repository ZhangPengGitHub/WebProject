import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import javax.swing.*;

public class Table {
	public Table(){
		JFrame f = new JFrame();
		Object[][] playerInfo = 
		{
				{"王鹏",new Integer(91),new Integer(100),new Integer(191),new Boolean(true)},
				{"王鹏",new Integer(91),new Integer(100),new Integer(191),new Boolean(true)},
				{"王鹏",new Integer(91),new Integer(100),new Integer(191),new Boolean(true)},
				{"王鹏",new Integer(91),new Integer(100),new Integer(191),new Boolean(true)},
				{"王鹏",new Integer(91),new Integer(100),new Integer(191),new Boolean(true)}
		};
		String[] Names = {"姓名","语文","数学","总分","及格"};
		JTable table = new JTable(playerInfo,Names);
		table.setPreferredScrollableViewportSize(new Dimension(550,30));
		JScrollPane scrollpane = new JScrollPane(table);
		f.getContentPane().add(scrollpane,BorderLayout.CENTER);
		f.setTitle("表格测试窗口");
		f.pack();
		f.setVisible(true);
		f.addWindowListener(new WindowAdapter()
		{
			public void windowClosing(WindowEvent e){
				System.exit(0);
			}
		});
	}
}

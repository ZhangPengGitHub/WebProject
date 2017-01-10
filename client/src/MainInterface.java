import javax.swing.*;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MainInterface {
	@SuppressWarnings("deprecation")
	public static void main(String[] args) throws Exception{
		BoxLayoutFrame1 frame1 = new BoxLayoutFrame1();
		frame1.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame1.show();
		Denglujdbc myjdbc = new Denglujdbc();
		//CreateXLS myxls = new CreateXLS();
		ReadXLS myxls = new ReadXLS();
		IO myio = new IO(); 
		DB mydb = new DB();
		//Table mytable = new Table();
		myjdbc.getconn();
		myjdbc.islogin();
		//myxls.create();
		myxls.read();
		myio.read();
		mydb.insert();
	}
}
	@SuppressWarnings("serial")
	class BoxLayoutFrame1 extends JFrame{
		private static final int WIDTH = 800;
		private static final int HEIGHT = 500;
		public BoxLayoutFrame1(){
			setTitle("桌面客户端");
			setSize(WIDTH,HEIGHT);
			Container con = getContentPane();
			/*JLabel label1 = new JLabel(" 姓名： ");
			JTextField textField1 = new JTextField(10);
			textField1.setMaximumSize(textField1.getPreferredSize());
			Box hbox1 = Box.createHorizontalBox();
			hbox1.add(label1);
			hbox1.add(Box.createHorizontalStrut(20));
			hbox1.add(textField1);
			JLabel label2 = new JLabel(" 密码： ");
			JTextField textField2 = new JTextField(10);
			textField2.setMaximumSize(textField2.getPreferredSize());*/
			Box hbox1 = Box.createHorizontalBox();
			Box hbox2 = Box.createHorizontalBox();
			Box hbox3 = Box.createHorizontalBox();
			Box hbox4 = Box.createHorizontalBox();
//			hbox2.add(label2);
//			hbox2.add(Box.createHorizontalStrut(20));
//			hbox2.add(textField2);
			JButton button1 = new JButton("确定");
			JButton button2 = new JButton("取消");
			JButton button3 = new JButton("确定");
			JButton button4 = new JButton("确定");
			ActionListener ac1 = new ActionHandler1();
			button1.addActionListener(ac1);
//			Box hbox3 = Box.createHorizontalBox();
//			hbox3.add(button1);
//			hbox3.add(button2);
			Box vbox = Box.createVerticalBox();
//			vbox.add(hbox1);
//			vbox.add(hbox2);
//			hbox1.add(Box.createVerticalGlue());
			hbox1.add(button1,BorderLayout.CENTER);
			hbox2.add(button2,BorderLayout.CENTER);
			hbox3.add(button3,BorderLayout.CENTER);
			hbox4.add(button4,BorderLayout.CENTER);
			vbox.add(hbox1);
			vbox.add(hbox2);
			vbox.add(hbox3);
			vbox.add(hbox4);
			//Box.createHorizontalGlue();
			con.add(vbox,BorderLayout.CENTER);
		}
	}
	class ActionHandler1 implements ActionListener{
		@SuppressWarnings("deprecation")
		public void actionPerformed(ActionEvent e){
			BoxLayoutFrame frame = new BoxLayoutFrame();
			frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			frame.show();
		}
	}
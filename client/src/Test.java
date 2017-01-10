import javax.swing.*;
import java.awt.*;

public class Test {
	@SuppressWarnings("deprecation")
	public static void main(String[] args){
		BoxLayoutFrame frame = new BoxLayoutFrame();
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.show();
	}
}
	@SuppressWarnings("serial")
	class BoxLayoutFrame extends JFrame{
		private static final int WIDTH = 300;
		private static final int HEIGHT = 200;
		public BoxLayoutFrame(){
			setTitle("测试箱式布局管理器");
			setSize(WIDTH,HEIGHT);
			Container con = getContentPane();
			JLabel label1 = new JLabel(" 密码： ");
			JTextField textField1 = new JTextField(10);
			textField1.setMaximumSize(textField1.getPreferredSize());
			Box hbox1 = Box.createHorizontalBox();
			hbox1.add(label1);
			hbox1.add(Box.createHorizontalStrut(20));
			hbox1.add(textField1);
			JLabel label2 = new JLabel(" 姓名： ");
			JTextField textField2 = new JTextField(10);
			textField2.setMaximumSize(textField2.getPreferredSize());
			Box hbox2 = Box.createHorizontalBox();
			hbox2.add(label2);
			hbox2.add(Box.createHorizontalStrut(20));
			hbox2.add(textField2);
			JButton button1 = new JButton("确定");
			JButton button2 = new JButton("取消");
			Box hbox3 = Box.createHorizontalBox();
			hbox3.add(button1);
			hbox3.add(button2);
			Box vbox = Box.createVerticalBox();
			vbox.add(hbox1);
			vbox.add(hbox2);
			hbox1.add(Box.createVerticalGlue());
			vbox.add(hbox3);
			con.add(vbox,BorderLayout.CENTER);
		}
	}


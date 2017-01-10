import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

public class IO {
	public void read(){
		try{
			FileReader fr = new FileReader("����.txt"); 
			BufferedReader br = new BufferedReader(fr);
			WritableWorkbook book = Workbook.createWorkbook(new File("���Խ��.xls"));
			WritableSheet sheet1 = book.createSheet("��һҳ", 0);
			String temp = br.readLine();
			int i = 0;
			while (temp != null) { 
				Label label = new Label(0,i,temp);
				sheet1.addCell(label);
				System.out.println(temp);
				temp = br.readLine(); 
				i++;
			} 
			br.close(); 
			fr.close();
			book.write();
			book.close();
		}catch(Exception e){
			System.out.println(e);
		}
		
	}  
}
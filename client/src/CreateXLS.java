//����Excel���� 
import java.io.*; 
import jxl.*; 
import jxl.write.*; 
public class CreateXLS { 
	public void create(){
		 try{
			 WritableWorkbook book = Workbook.createWorkbook(new File("����.xls"));
			 WritableSheet sheet1 = book.createSheet("��һҳ", 0);
			 //WritableSheet sheet2 = book.createSheet("�ڶ�ҳ", 1);
			 Label label = new Label(0,0,"test");
			 sheet1.addCell(label);
			 jxl.write.Number number = new jxl.write.Number(1,0,789.123);
			 sheet1.addCell(number);
			 book.write();
			 book.close();
			 
		 }catch(Exception e){
			 System.out.println(e);
		 }
	}
}
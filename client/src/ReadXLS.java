import java.io.File;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

public class ReadXLS {
	public void read() {
		try {
			Workbook book = Workbook.getWorkbook(new File("����.xls"));
			// ��õ�һ�����������
			Sheet sheet = book.getSheet(0);
			// �õ���һ�е�һ�еĵ�Ԫ��
			Cell cell1 = sheet.getCell(0, 0);
			String result = cell1.getContents();
			System.out.println(result);
			book.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
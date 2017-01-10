import java.io.File;
import java.io.IOException;

import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;


public class InsertExcel {
	public String[][] read() throws BiffException, IOException{
		
		Workbook workbook = Workbook.getWorkbook(new File("test.xls"));   
		Sheet sheet = workbook.getSheet(0);   
		String[][] result = new String[sheet.getRows()][sheet.getColumns()];   
		for(int i=1;i<sheet.getRows();i++){
			for(int j=0;j<sheet.getColumns();j++){
				result[i-1][j] = sheet.getCell(j,i).getContents();
			}
		}
		return result;
	}
	
	public int linenumber() throws BiffException, IOException{
		Workbook workbook = Workbook.getWorkbook(new File("test.xls"));   
		Sheet sheet = workbook.getSheet(0);
		return sheet.getRows();
	}
}

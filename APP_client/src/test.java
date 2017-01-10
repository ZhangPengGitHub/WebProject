import java.io.IOException;

import jxl.read.biff.BiffException;

public class test {
	public static void main(String[] args) throws BiffException, IOException{
		InsertExcel test = new InsertExcel();
		String[][] info = test.read();
		for(int i = 0;i<test.linenumber()-1;i++){
			for(int j = 0;j<5;j++){
				System.out.println(info[i][j]);
			}
		}
	}
}
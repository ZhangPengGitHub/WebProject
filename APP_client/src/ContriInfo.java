import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ContriInfo {
	public String[][] read(){
		int num = 0;
		String[][] result = null;
		Connection conn = null;
		DbCon temp = new DbCon();
	    conn = temp.getconn();
	    
	    try{
	    	String sql = "select count(*) from information";
	    	PreparedStatement statement = conn.prepareStatement(sql);
	    	ResultSet set = statement.executeQuery();
	    	while(set.next()){
	    		num = Integer.valueOf(set.getString(1));
	    	}
	    	statement.close();
	    }catch(Exception e){
	    	//TODO:handle exception
	    	e.printStackTrace();
	    }
	    
	    int number = 0;
	    result = new String[num][5];
	    try{
	    	String sql = "select * from information";
	    	PreparedStatement statement = conn.prepareStatement(sql);
	    	ResultSet set = statement.executeQuery();
	    	while(set.next()){
	    		for(int i = 0;i<5;i++){
	    			result[number][i] = set.getString(i+1);
	    			System.out.println(result[number][i]);
	    		}
	    	}
	    	
	    	statement.close();
	    	conn.close();
	    }catch(Exception e){
	    	//TODO:handle exception
	    	e.printStackTrace();
	    }
	    return result;
	}
}

import java.sql.Connection;
import java.sql.PreparedStatement;


public class DeleteInfo {
	public void delete(String[] info){

		Connection conn = null;
		DbCon temp = new DbCon();
	    conn = temp.getconn();
 
	    try{
	    	String sql = "delete from information where information_id = \'"+info[0]+"\';";
	    	PreparedStatement statement = conn.prepareStatement(sql);
	    	statement.execute(sql);
	    	statement.close();
	    	conn.close();
	    }catch(Exception e){
	    	//TODO:handle exception
	    	e.printStackTrace();
	    }
	}
}

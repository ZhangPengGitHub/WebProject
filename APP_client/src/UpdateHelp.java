import java.sql.Connection;
import java.sql.PreparedStatement;


public class UpdateHelp {
	public void update(String info){

		Connection conn = null;
		DbCon temp = new DbCon();
	    conn = temp.getconn();
 
	    try{
	    	String sql = "update help set content = \'" + info + "\' where name = \'help\';";
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

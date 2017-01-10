import java.sql.Connection;
import java.sql.PreparedStatement;


public class UpdateSadd {
	public void update(String info){

		Connection conn = null;
		DbCon temp = new DbCon();
	    conn = temp.getconn();
 
	    try{
	    	String sql = "update server_address set content = \'" + info + "\' where name = \'address\';";
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

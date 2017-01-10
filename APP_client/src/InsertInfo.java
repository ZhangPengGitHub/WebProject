import java.sql.Connection;
import java.sql.PreparedStatement;


public class InsertInfo {
	public void insert(String[] info){

		Connection conn = null;
		DbCon temp = new DbCon();
	    conn = temp.getconn();
	    
	    String type = null;
	    
	    if(info[1]=="1"){
	    	type="news";
	    }
	    else{
	    	type="notice";
	    }
	    
	    try{
	    	String sql = "insert into " + type +" values ( \'" + info[0] +"\',\'" + info[2] +"\',\'" + info[3] +"\',\'" + info[4] +"\');";
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

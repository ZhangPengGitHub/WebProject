import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class InsertPaper {
	public void insert(String[] info){

		Connection conn = null;
		DbCon temp = new DbCon();
	    conn = temp.getconn();
	    
	    int a[] = new int[10];
	    String id = null;
	    boolean flag = false;
	    
	    do{
	    	flag = false;
	    	
	    	a[0] = (int)(10*(Math.random()));
	    	id = "" + a[0];
	    	
	    	for(int i=1;i<a.length;i++ ) {
		    	a[i] = (int)(10*(Math.random()));
		    	id = id + a[i];
		    }
		    
		    try{
		    	String sql = "select paper_id from paper";
		    	PreparedStatement statement = conn.prepareStatement(sql);
		    	ResultSet set = statement.executeQuery();
		    	while(set.next()){
		    		if(id == set.getString(1)){
		    			flag = true;
		    		}
		    	}
		    	statement.close();
		    }catch(Exception e){
		    	//TODO:handle exception
		    	e.printStackTrace();
		    }
	    }while(flag);  
	    
	    try{
	    	String sql = "insert into paper values ( \'" + id +"\',\'" + info[0] +"\',\'" + info[1] +"\',\'" + info[2] +"\',\'" + info[3] +"\',\'" + info[4] +"\');";
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

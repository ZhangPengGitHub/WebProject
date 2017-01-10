import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Denglujdbc{
	Connection conn = null;
	public Connection getconn(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e){
			//TODO:handle exception
			e.printStackTrace();
		}
		String url = "jdbc:mysql://localhost:3306/oscar_workreport";
		String useName = "root";
		String password = "root";
		try{
			conn = DriverManager.getConnection(url,useName,password);
			if(conn!=null){
				System.out.println("连接数据库成功");
				
			}
			
		}catch(Exception e){
			//TODO:handle exception
			e.printStackTrace();
		}
		return conn;
	}
	public boolean islogin(){
		boolean bol = false;
	    conn = getconn();
	    try{
	    	String sql = "select * from user;";
	    	PreparedStatement statement = conn.prepareStatement(sql);
	    	//statement.setString(1, name);
	    	//statement.setString(2, password);
	    	ResultSet set1 = statement.executeQuery();
	    	while(set1.next()){
	    		System.out.println(set1.getString(1));
	    		bol =true;
	    	}
	    	set1.close();
	    	conn.close();
	    	statement.close();
	    }catch(Exception e){
	    	//TODO:handle exception
	    	e.printStackTrace();
	    }
	    return bol;
	    	
	}
}

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DB {
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
	public boolean insert(){
		boolean bol = false;
	    conn = getconn();
	    try{
	    	String sql = "insert into user values (\"1\",\"2\",3,\"4\",\"5\",\"6\",\"7\");";
	    	PreparedStatement statement = conn.prepareStatement(sql);
	    	//statement.setString(1, name);
	    	//statement.setString(2, password);
	    	statement.execute(sql);
	    	conn.close();
	    	statement.close();
	    	System.out.println("insert成功");
	    }catch(Exception e){
	    	//TODO:handle exception
	    	e.printStackTrace();
	    }
	    return bol;
	}
}

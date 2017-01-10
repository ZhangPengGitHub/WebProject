package com.servlet;

import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.Count;
import com.db.user;
import com.db.work;

@SuppressWarnings("serial")
public class Work extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Work() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/*response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();*/
		
		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/*response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();*/
		request.setCharacterEncoding("GB2312");
		
		if(request.getSession(false) != null ){
			int id = (Integer) request.getSession().getAttribute("whatstudent");
			
			String username = (String) request.getSession().getAttribute("name");
			String name = (String) request.getSession().getAttribute("username");
			
			String count = request.getParameter("count");

			int int_num = 0;
			ResultSet rs = null;
			
			if(user.selectUser(username)==1){
				String num = work.count(username);
				int_num = Integer.valueOf(num);
				rs = work.selectWork(username,count);
			}
			else{
				String[][] content = Count.work(username);
				String num = work.count(content[id][3]);
				int_num = Integer.valueOf(num);
				
				rs = work.selectWork(content[id][3],count);
			}		
			
			String [] weekday = {"星期一：","星期二：","星期三：","星期四：","星期五：","星期六：","星期日："};
			String[] work = new String[7];
			String[] result = new String[5];
			
			try {
				if(rs.next()){
					result[2]="";
					for(int j=0;j<7;j++){
						try {
							work[j] = rs.getString(j+4);
						} catch (SQLException e) {
							// TODO 自动生成的 catch 块
							e.printStackTrace();
						}
						result[2]=result[2]+weekday[j]+work[j]+"<br>";
					}	
					result[1]=rs.getString(3);
					result[4]=rs.getString(11);
				}
				else{
					result[1]="";
					result[2]="";
				}
				result[0]=username;
				result[3]=name;
			}catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			
			request.getSession().setAttribute("weekplan", result[1]);
			request.getSession().setAttribute("weekwork", result[2]);
			request.getSession().setAttribute("weekcomment", result[4]);
			request.getSession().setAttribute("weekcount",int_num);
			request.getSession().setAttribute("whatweek",count);
			
			String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
			response.sendRedirect(basePath+"jsp/work.jsp");
		}
		else{
			String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
			response.sendRedirect(basePath+"jsp/temp_timeout.jsp");
		}		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}
}

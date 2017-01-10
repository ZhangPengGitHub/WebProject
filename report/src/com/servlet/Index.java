package com.servlet;

import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.Count;
import com.db.user;
import com.db.work;
import com.times.WorkWeek;

@SuppressWarnings("serial")
public class Index extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Index() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	
	int num=0;
	
	String[] usernameArray = new String[50];
	String[] passwordArray = new String[50];
	int[] professionArray = new int[50];
	String[] teacherArray = new String[50];
	String[] nameArray = new String[50];
	
	String plan ="";
	String todaywork ="";
	String thisweekcomment ="";
	String iffirstweek ="";
	String iffirstday ="";
	
	int ifplan = 1;
	
    public void allRandomSelect(){
		
		ResultSet rs = user.selectUser();
		num = 0;
		try {
			while (rs.next()){
				usernameArray[num] = rs.getString(1);
				passwordArray[num] = rs.getString(2);
				professionArray[num] = Integer.valueOf(rs.getString(3));
				teacherArray[num] = rs.getString(4);
				nameArray[num] = rs.getString(5);

				num++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//return resultArray;
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
		request.setCharacterEncoding("UTF-8");
		
		Date dt = new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); 
		int mytime = WorkWeek.getWeekOfDate(dt);
		String str_mytime = String.valueOf(mytime);
		String str=sdf.format(dt); 
		
		allRandomSelect();
		
		int i=0;
		
		String un = request.getParameter("username");
		String pw = request.getParameter("password");
		String name = "";
		
		if(un == ""){
			request.getSession().setAttribute("temp",1);
		}
		else{
			for(i=0;i<num;i++){
				System.out.println(un);
				System.out.println(usernameArray[i]);
				if(un.equals(usernameArray[i]))
					break;
			}
			if(i==num){
				request.getSession().setAttribute("temp",2);
			}
			else if(!pw.equals(passwordArray[i])){
				request.getSession().setAttribute("temp",3);
			}	
			else{
				/*response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
				out.println("<HTML>");
				out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
				out.println("  <BODY>");
				out.print("    <Script Language=\"JavaScript\">");
				out.print("    alert(\"登录成功!\");");
				out.println("  </Script>");
				out.println("  </BODY>");
				out.println("</HTML>");
				out.flush();
				out.close();*/
				
				name = nameArray[i];
				if(professionArray[i]==1){
					request.getSession().setAttribute("username", name);
					request.getSession().setAttribute("name", un);
					request.getSession().setAttribute("password", pw);
					
					ResultSet rs = work.selectThisweekWork(un);
	
						try {
							if(!rs.next()){
								work.insertWork(un, str_mytime, str);
							}
							else{
								plan = rs.getString(3);
								todaywork = rs.getString(mytime+3);
								thisweekcomment = rs.getString(11);
								ifplan = Integer.valueOf(rs.getString(12));
							}
						} catch (NumberFormatException e) {
							// TODO 自动生成的 catch 块
							e.printStackTrace();
						} catch (SQLException e) {
							// TODO 自动生成的 catch 块
							e.printStackTrace();
						}
					request.getSession().setAttribute("plan", plan);
					request.getSession().setAttribute("todaywork", todaywork);
					request.getSession().setAttribute("thisweekcomment", thisweekcomment);
					request.getSession().setAttribute("ifplan", ifplan);
					request.getSession().setAttribute("whatday", mytime);
					request.getSession().setAttribute("today", mytime);
					
					request.getSession().setAttribute("temp",4);
				}
				else{
					int num = Count.count(un);
					request.getSession().setAttribute("count", num);
					request.getSession().setAttribute("username", name);
					request.getSession().setAttribute("name", un);
					request.getSession().setAttribute("password", pw);
					request.getSession().setAttribute("ifplan", ifplan);
					
					request.getSession().setAttribute("temp",5);
					
					request.getSession().setAttribute("content", Count.work(un));
				}
			}
		}
		
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		response.sendRedirect(basePath+"jsp/temp_index.jsp");
		
		return;
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

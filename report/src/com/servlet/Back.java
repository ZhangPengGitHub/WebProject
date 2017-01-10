package com.servlet;

import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.user;
import com.db.work;
import com.times.WorkWeek;

@SuppressWarnings("serial")
public class Back extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Back() {
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
			String username = (String) request.getSession().getAttribute("name");
			int num = user.selectUser(username);
			if(num==1){
				String name = (String)request.getSession().getAttribute("username");
				//String username = (String)request.getSession().getAttribute("name");
				String password = (String)request.getSession().getAttribute("password");
					
				String plan ="";
				int today = 0;
				String todaywork ="";
				String thisweekcomment ="";
				
				Date dt = new Date();
				today = WorkWeek.getWeekOfDate(dt);
				
				request.getSession().setAttribute("username", name);
				request.getSession().setAttribute("name", username);
				request.getSession().setAttribute("password", password);
				
				ResultSet rs = work.selectThisweekWork(username);
				try {
					rs.next();
					plan = rs.getString(3);
					todaywork = rs.getString(today+3);
					thisweekcomment = rs.getString(11);
				} catch (SQLException e) {
					// TODO �Զ���ɵ� catch ��
					e.printStackTrace();
				}
				
				request.getSession().setAttribute("plan", plan);
				request.getSession().setAttribute("today", today);
				request.getSession().setAttribute("todaywork", todaywork);
				request.getSession().setAttribute("thisweekcomment", thisweekcomment);
				
				String path = request.getContextPath();
				String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
				response.sendRedirect(basePath+"jsp/student.jsp");
			}
			else{
				String path = request.getContextPath();
				String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
				response.sendRedirect(basePath+"jsp/teacher.jsp");
			}
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

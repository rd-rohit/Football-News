

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class inserdata
 */
@WebServlet("/inserdata")
public class inserdata extends HttpServlet {
	 public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		    response.setContentType("text/html");
		    PrintWriter out = response.getWriter();
		    String Driver = "com.mysql.jdbc.Driver";
	        String url = "jdbc:mysql://localhost/footballnews";
	        String uName ="root";
	        String pwd = "";
	        Connection conn=null;
		        try{
					String name = request.getParameter("name");
					String email = request.getParameter("email");
					String password = request.getParameter("psw");
					String[] selectedTeams = request.getParameterValues("teams");
					String htmlResponse = "<html>";
			        htmlResponse += "<body><h2>Your username is: " + name + "<br/>";      
			        htmlResponse += "Your password is: " + password ;
			        /*for(int i=0;i<selectedTeams.length;i++){
			        htmlResponse += "Your team is: " + selectedTeams[i] + "</h2>";
			        }   */
			        htmlResponse += "</body></html>";
			        out.println(htmlResponse);
			        Class.forName(Driver).newInstance();
		            conn = DriverManager.getConnection(url, uName, pwd);
		          
		            Statement stmt = conn.createStatement();
		            String q = "alter table selected_teams add "+name.replaceAll(" ","_")+" varchar(30) ";
		            stmt.executeUpdate(q);
		            for( int j=0;j<selectedTeams.length;j++){
		            	 PreparedStatement pst = conn.prepareStatement("insert into selected_teams("+name.replaceAll(" ","_")+") values(?)");
							pst.setString(1,selectedTeams[j].replaceAll(" ","-").toLowerCase());
							pst.executeUpdate();
		            }
		            
		            PreparedStatement pst = conn.prepareStatement("insert into user_info(name,email,password) values(?,?,?)");
					pst.setString(1,name);
					pst.setString(2,email);
					pst.setString(3,password);
					int i = pst.executeUpdate();
					if(i!=0){
						out.println("<br>Record has been inserted");
						RequestDispatcher rd=request.getRequestDispatcher("dashboard.jsp");  
					       rd.forward(request,response);  
					}
					else{
						out.println("failed to insert the data");
		      }
		    }
		    catch (Exception e){
		      out.println(e);
		    }
		  }

}

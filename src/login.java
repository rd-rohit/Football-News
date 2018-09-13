

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)  
	        throws ServletException, IOException {  
	  
	    response.setContentType("text/html");  
	    PrintWriter out = response.getWriter();  
	          
	    String e=request.getParameter("email");  
	    String p=request.getParameter("psw");  
	          
	    if(LoginDao.validate(e, p)){
	    	//out.println("Welcome\n "+e+p);
	       RequestDispatcher rd=request.getRequestDispatcher("dashboard.jsp");  
	       rd.forward(request,response);  
	    }  
	    else{  
	        out.print("Sorry username or password error");  
	        RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
	        rd.include(request,response);  
	    }  
	          
	    out.close();  
	    }  
}

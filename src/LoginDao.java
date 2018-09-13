import java.sql.*;  
  
public class LoginDao {  
public static boolean validate(String email,String pass){  
boolean status=false;  

String Driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost/footballnews";
String uName ="root";
String pwd = "";
Connection conn=null;

try {
    Class.forName(Driver).newInstance();
    conn = DriverManager.getConnection(url, uName, pwd);
      
    PreparedStatement ps=conn.prepareStatement(  "select * from user_info where email=? and password=?");  
    ps.setString(1,email);  
    ps.setString(2,pass);  
      
    ResultSet rs=ps.executeQuery();  
    status=rs.next();  
          
}catch(Exception e){System.out.println(e);
}  
return status;  
}  
}  

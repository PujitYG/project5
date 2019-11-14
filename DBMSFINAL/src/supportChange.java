import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

@WebServlet("/supportChange")
public class supportChange extends HttpServlet {
    public void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        HttpSession ses=request.getSession();
        String id=(String) ses.getAttribute("id");
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        String address=request.getParameter("address");
        Connection conn=null;
        PreparedStatement stmt=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/learn", "root", "dancebar123");
            String sql="update manager set email=?,password=?,address=?";
            stmt=conn.prepareStatement(sql);
            stmt.setString(1,email);
            stmt.setString(2,password);
            stmt.setString(3,address);
            stmt.execute();
        }catch(Exception e){
                e.printStackTrace();
        }
        if(id==null){
           response.sendRedirect("index.html");
        }else{
            RequestDispatcher rd=request.getRequestDispatcher("support");
             rd.forward(request,response);
        }
    }
}

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Enumeration;


@WebServlet("/manager")
public class manager extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String id=req.getParameter("id");
        String password=req.getParameter("password");
        ManagerInfo manager=new ManagerInfo(id,password);
        boolean check=false;
        try{
           check=checkDB(manager);
        }catch(Exception e){
            e.printStackTrace();
        }
        if(check){
            res.sendRedirect("product.jsp");
        }else{
            res.sendRedirect("Manager.html");
        }
    }

    public static boolean checkDB(ManagerInfo manager) throws ClassNotFoundException, SQLException,NullPointerException {
        Connection con=null;
        Statement stmt=null;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/learn","root","dancebar123");
        String sql="select id,password from manager where (id='"+manager.id+"'and password='"+manager.password+"')";
        stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery(sql);
        return rs.next();
    }
}

class ManagerInfo{
    String id;
    String password;

    public ManagerInfo(String id, String password) {
        this.id = id;
        this.password = password;
    }
}

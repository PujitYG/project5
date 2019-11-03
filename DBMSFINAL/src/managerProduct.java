import com.google.gson.Gson;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Scanner;

@WebServlet("/managerProduct")
public class managerProduct extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String value=req.getParameter("id");
        ArrayList<Product> arr=new ArrayList<>();
        try {
            arr=getInfo(value);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Gson json=new Gson();
        String J=json.toJson(arr);
        HttpSession s=req.getSession();
        req.setAttribute("products",J);
        s.setAttribute("id",value);
//        res.sendRedirect("products.jsp");
//        req.setAttribute("products",J);
        RequestDispatcher rd=req.getRequestDispatcher("product.jsp");
        rd.forward(req,res);
    }

    public ArrayList<Product> getInfo(String id) throws ClassNotFoundException, SQLException {
        Connection conn=null;
        Statement stmt=null;
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost/learn","root","dancebar123");
        String sql="select * from products where id=?";
        PreparedStatement ps=conn.prepareStatement(sql);
        ps.setString(1,id);
        System.out.println(id);
        ResultSet rs=ps.executeQuery();
        ArrayList<Product> arr=new ArrayList<>();
        while(rs.next()){
            arr.add(new Product(rs.getString(2)));
        }
    return arr;
    }
}



class Product{
    String name;
     public Product(String name){
         this.name=name;
     }
}



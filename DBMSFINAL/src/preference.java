import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.Enumeration;

@WebServlet("/preference")
public class preference extends HttpServlet {
    public void service(HttpServletRequest req ,HttpServletResponse res) throws IOException {
        StringBuilder sb=null;
        String[] colorValues=req.getParameterValues("color");
        String[] connectivityValues=req.getParameterValues("connect");
        String[] ageValues=req.getParameterValues("age");
        String[] typeValues=req.getParameterValues("type");
        try{
            getProducts(colorValues,connectivityValues,ageValues,typeValues);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(sb);
    }

    public static void getProducts(String[] colorValues,String[] connectivityValues,String[] ageValues,String[] typeValues) throws SQLException {
        String sql1=new String(build(colorValues,"color"));
        String sql2=new String(build(connectivityValues,"connection"));
        String sql3=new String(build(ageValues,"age"));
        String sql4=new String(build(typeValues,"type"));
        String sqlFinal="select * from pro1 where pid in("+sql1+") and pid in("+sql2+") and pid in("+sql3+") and pid in("+sql4+")";
        System.out.println(sqlFinal);
        integrate(sqlFinal,colorValues,connectivityValues,ageValues,typeValues);
    }
    public static void integrate(String sqlFinal,String[] colorValues,String[] connectivityValues,String[] ageValues,String[] typeValues) throws SQLException{
       int k=1;
       int i=0;
        Connection conn=null;
        PreparedStatement ps;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/learn","root","dancebar123");
        } catch (Exception e) {
            e.printStackTrace();
        }
        assert conn != null;
        PreparedStatement stmt=conn.prepareStatement(sqlFinal);
        if(colorValues!=null) {
            for (i = 0; i < colorValues.length; i++) {
                stmt.setString(k, colorValues[i]);
                k++;
            }
        }

        if(connectivityValues!=null) {
            for (i = 0; i < connectivityValues.length; i++) {
                stmt.setString(k, connectivityValues[i]);
                k++;
            }
        }

       if(ageValues!=null) {
           for (i = 0; i < ageValues.length; i++) {
               stmt.setString(k, ageValues[i]);
               k++;
           }
       }
        if(typeValues!=null) {
            for (i = 0; i < typeValues.length; i++) {
                stmt.setString(k, typeValues[i]);
                k++;
            }
        }
        System.out.println(k);
        ResultSet rs=stmt.executeQuery();
        while(rs.next()){
            System.out.println(rs.getString("name"));
        }
    }

    public static StringBuilder build(String[] values, String att){
        StringBuilder sb=new StringBuilder("Select pid from pro1 where id=1");
        if(values!=null){
            for(int i=0;i<values.length;i++){
                if(i==0){
                    sb.append(" and "+att+"=?");
                }else{
                    sb.append(" or "+att+"=?");
                }
            }
        }
        return sb;
    }
}

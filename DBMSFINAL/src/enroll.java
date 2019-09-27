import com.google.gson.Gson;
import com.sun.org.apache.xml.internal.resolver.readers.ExtendedXMLCatalogReader;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Scanner;

@WebServlet("/enroll")
public class enroll extends HttpServlet {
    static final String USER = "root";
    static final String PASS = "dancebar123";
    public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
            InputStream istream = req.getInputStream();
            StringBuffer indata = new StringBuffer();
            Scanner in = new Scanner(istream);
            while (in.hasNext()) {
                indata.append(in.nextLine());
            }
            Gson gson = new Gson();
            dataObj a = gson.fromJson(String.valueOf(indata), dataObj.class);
            if (verification(a)) {
                try {
                    sendData(a);
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (Exception e1) {
                    e1.printStackTrace();
                }
            }
    }
    static boolean verification(dataObj a){
        int Nflag = 0, Pflag = 0;
//        while (true){
            if (a.first.matches("^[a-zA-Z]*$")) Nflag =1;
            if(strongPass(a.password)) Pflag =1;
            if((Nflag==1)&&(Pflag==1))
                return  true;
            else
                return false;
//        }
    }
    static boolean strongPass(String ps){
        boolean hasUppercase = false;
        boolean hasLowercase = false;
        boolean hasDigit = false;
        boolean hasSymbol = false;
        if (ps.length()>=8){
            for (int i=0;i<ps.length();i++) {
                char x = ps.charAt(i);
                if (Character.isLowerCase(x)) hasLowercase = true;
                else if (Character.isUpperCase(x)) hasUppercase = true;
                else if (Character.isDigit(x)) hasDigit = true;
                else if (Character.isDefined(x)) hasSymbol = true;
                if (hasDigit && hasLowercase && hasSymbol && hasUppercase)return true;
                }
            }
        else
            System.out.println("have at least 8 characters");
        return false;
        }


    public static boolean sendData(dataObj a) throws SQLException,Exception{
            Connection conn = null;
            Statement stmt = null;
            String user,pass;
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("connecting:");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/learn",USER,PASS);
            System.out.println("getting statement:");
            stmt = conn.createStatement();
            String sqlstmt = "insert into emp values('"+a.first+"','"+a.last+"')";
            stmt.execute(sqlstmt);
        return true;
    }
}

class dataObj{
    public String email, password,first,last,address,location;

}
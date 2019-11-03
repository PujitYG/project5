import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@WebServlet("/lol")
public class lol extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse res){
        HttpSession s=req.getSession();
        ArrayList<String> ar= (ArrayList<String>) s.getAttribute("products");
        System.out.println(ar.size());
    }
}

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/change")
public class change extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse res){
        HttpSession ses=req.getSession();
        final String id= (String) ses.getAttribute("id");
        final String pid=(String) req.getParameter("pid");
        System.out.println(id);
        System.out.println("okok lets see"+pid);
    }
}

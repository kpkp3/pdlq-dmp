import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Mock user data
    private static final String VALID_USERNAME = "user";
    private static final String VALID_PASSWORD = "password";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Simple validation
        if ("STCS-Y".equals(username) && "qwerty123".equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("username", "STCS-Y");
            response.sendRedirect("index.jsp");
        } else {
            request.setAttribute("loginMessage", "Invalid username or password.");
            // Forward to the login page
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}

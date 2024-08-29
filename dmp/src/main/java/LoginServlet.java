import com.mysql.jdbc.PreparedStatement;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //response.sendRedirect("http://192.168.249.137/evil/hack.html");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;


        try{

            // 获取数据库连接
            connection = DatabaseUtils.getConnection();

            // 创建SQL查询
            String sql = "SELECT * FROM user where username =? and password =?";
            statement = (PreparedStatement) connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            resultSet = statement.executeQuery();
            int disable = 0;

            if(resultSet.next()){
                disable = resultSet.getInt("disable");
            }
            else {
                request.setAttribute("loginMessage", "Invalid username or password.");
                // Forward to the login page
                //重定向点
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            System.out.println(disable);
            // 处理查询结果
            if(disable == 0){
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                //重定向点
                response.sendRedirect("index.jsp");
            }
            else {
                request.setAttribute("loginMessage", "account have bean baned");
                // Forward to the login page
                //重定向点
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        }catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error occurred: " + e.getMessage());
        } finally {
            // 关闭资源
            DatabaseUtils.closeConnection(connection);
            try {
                if (statement != null) statement.close();
                if (resultSet != null) resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }
}

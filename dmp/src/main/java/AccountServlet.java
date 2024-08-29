import com.mysql.jdbc.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;


public class AccountServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        System.out.println("aaaa");
        System.out.println(uri);


        if (uri.endsWith("/addaccound")) {
            System.out.println("if");
            // Handle add operation
            String username = req.getParameter("username");
            System.out.println(username);
            if(username != null && username != ""){
                Connection connection = null;
                PreparedStatement statement = null;
                ResultSet resultSet = null;
                try{
                    System.out.println("try");
                    connection = DatabaseUtils.getConnection();
                    String sql = "update user set disable=1 where username=?";
                    statement = (PreparedStatement) connection.prepareStatement(sql);
                    statement.setString(2, username);
                    statement.executeQuery();

                    System.out.println("addaccound");
                }catch (Exception e){
                    e.printStackTrace();

                }finally {
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
        } else if (uri.endsWith("/deleteaccound")) {
            // Handle delete operation
            int id = Integer.parseInt(req.getParameter("id"));
            if(id > 0){
                Connection connection = null;
                PreparedStatement statement = null;
                ResultSet resultSet = null;
                try{
                    connection = DatabaseUtils.getConnection();
                    String sql = "update user set disable=0 where id=?";
                    statement = (PreparedStatement) connection.prepareStatement(sql);
                    statement.setInt(1, id);
                    statement.executeQuery();


                }catch (Exception e){
                    e.printStackTrace();

                }finally {
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
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}

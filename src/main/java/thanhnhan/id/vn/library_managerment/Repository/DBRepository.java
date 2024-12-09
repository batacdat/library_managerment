package thanhnhan.id.vn.library_managerment.Repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBRepository {
    private static String jdbcURL = "jdbc:mysql://localhost:3306/ library_managerment"; // Địa chỉ của DB
    private static String jdbcUsername = "root"; // Tên người dùng
    private static String jdbcPassword = "Tu1den9bo8."; // Mật khẩu
    private static Connection connection;


    /**
     * Phương thức getConnection để lấy kết nối tới cơ sở dữ liệu.
     * Phương thức này kiểm tra nếu connection chưa được khởi tạo (connection == null) thì sẽ tạo một kết nối mới.
     */
    public static Connection getConnection() {
        if (connection == null) {
            try {
                // Tải driver JDBC cho MySQL vào bộ nhớ, điều này cần thiết để có thể kết nối.
                Class.forName("com.mysql.cj.jdbc.Driver");
                // Khởi tạo kết nối tới cơ sở dữ liệu với các thông tin đã cung cấp (URL, username, password).
                connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
        return connection;
    }

    /**
     * Phương thức closeConnection để đóng kết nối tới cơ sở dữ liệu khi không cần sử dụng nữa.
     */
    public static void closeConnection() throws SQLException {
        if (connection != null && !connection.isClosed()) {
            connection.close();
            connection = null;
        }
    }
}
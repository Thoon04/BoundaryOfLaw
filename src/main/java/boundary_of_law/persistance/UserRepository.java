package boundary_of_law.persistance;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import boundary_of_law.models.User;

public class UserRepository {

    // Database connection
    private static Connection con = null;

    static {
        con = MyConnection.getConnection();
    }

    // Create (Insert)
    public int add(User user) {
        int result = 0;
        String sql = "INSERT INTO user (name, password, email, phone, gender, NRC, role) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getGender());
            ps.setString(6, user.getNRC());
            ps.setString(7, user.getRole());

            result = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("lawer insert error: " + e.getErrorCode());
            result = e.getErrorCode();
        }
        return result;
    }

    // Update
    public int edit(User user) {
        int result = 0;
        String sql = "UPDATE user SET name=?, password=?, email=?, phone=?, gender=?, NRC=?, role=? WHERE user_id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getGender());
            ps.setString(6, user.getNRC());
            ps.setString(7, user.getRole());
            ps.setInt(8, user.getUser_id());

            result = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("User update error: " + e.getMessage());
        }
        return result;
    }

    // Delete
    public int delete(int userId) {
        int result = 0;
        String sql = "DELETE FROM user WHERE user_id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);

            result = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("User delete error: " + e.getMessage());
        }
        return result;
    }

    // Read (Find by ID)
    public User findById(int userId) {
        User user = null;
        String sql = "SELECT * FROM user WHERE user_id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUser_id(userId);
                user.setName(rs.getString("name"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setGender(rs.getString("gender"));
                user.setNRC(rs.getString("NRC"));
                user.setRole(rs.getString("role"));
            }
        } catch (SQLException e) {
            System.out.println("User find by id error: " + e.getMessage());
        }
        return user;
    }

    // Read (Find all)
    public List<User> findAll() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM user";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUser_id(rs.getInt("user_id"));
                user.setName(rs.getString("name"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setGender(rs.getString("gender"));
                user.setNRC(rs.getString("NRC"));
                user.setRole(rs.getString("role"));
                users.add(user);
            }
        } catch (SQLException e) {
            System.out.println("User find all error: " + e.getMessage());
        }
        return users;
    }
    
    public int findIdWithEmail(String email) {
        int userId = 0;
        String sql = "SELECT user_id FROM user WHERE email=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                userId = rs.getInt("user_id");
            }
        } catch (SQLException e) {
            System.out.println("User find by email error: " + e.getMessage());
        }
        return userId;
    }
}


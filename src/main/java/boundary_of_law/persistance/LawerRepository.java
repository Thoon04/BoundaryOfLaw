package boundary_of_law.persistance;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import boundary_of_law.models.Lawer;
import boundary_of_law.models.LawerInfo;

public class LawerRepository {

	
    // Database connection
    private static Connection con = null;

    static {
        con = MyConnection.getConnection();
    }

    // Create (Insert)
    public int add(Lawer lawer) {
        int result = 0;
        String sql = "INSERT INTO lawer (current_state, price, photo, status, user_user_id, caseType_id) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, lawer.getCurrentState());
            ps.setString(2, lawer.getPrice());
            ps.setString(3, lawer.getPhoto());
            ps.setString(4, lawer.getStatus());
            ps.setInt(5, lawer.getUserUserId());
            ps.setInt(6, lawer.getCaseTypeId());

            result = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Lawer insert error: " + e.getMessage());
        }
        return result;
    }

    // Update
    public int edit(Lawer lawer) {
        int result = 0;
        String sql = "UPDATE lawer SET current_state=?, price=?, photo=?, status=?, user_user_id=?, caseType_id=? WHERE id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, lawer.getCurrentState());
            ps.setString(2, lawer.getPrice());
            ps.setString(3, lawer.getPhoto());
            ps.setString(4, lawer.getStatus());
            ps.setInt(5, lawer.getUserUserId());
            ps.setInt(6, lawer.getCaseTypeId());
            ps.setInt(7, lawer.getId());

            result = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Lawer update error: " + e.getErrorCode());
        }
        return result;
    }

    // Delete
    public int delete(int id) {
        int result = 0;
        String sql = "DELETE FROM lawer WHERE id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            result = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Lawer delete error: " + e.getMessage());
        }
        return result;
    }

    // Read (Find by ID)
    public Lawer findById(int id) {
        Lawer lawer = null;
        String sql = "SELECT * FROM lawer WHERE id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                lawer = new Lawer();
                lawer.setId(rs.getInt("id"));
                lawer.setCurrentState(rs.getString("current_state"));
                lawer.setPrice(rs.getString("price"));
                lawer.setPhoto(rs.getString("photo"));
                lawer.setStatus(rs.getString("status"));
                lawer.setUserUserId(rs.getInt("user_user_id"));
                lawer.setCaseTypeId(rs.getInt("caseType_id"));
            }
        } catch (SQLException e) {
            System.out.println("Lawer find by id error: " + e.getMessage());
        }
        return lawer;
    }

    // Read (Find all)
    public List<Lawer> findAll() {
        List<Lawer> lawers = new ArrayList<>();
        String sql = "SELECT * FROM lawer";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Lawer lawer = new Lawer();
                lawer.setId(rs.getInt("id"));
                lawer.setCurrentState(rs.getString("current_state"));
                lawer.setPrice(rs.getString("price"));
                lawer.setPhoto(rs.getString("photo"));
                lawer.setStatus(rs.getString("status"));
                lawer.setUserUserId(rs.getInt("user_user_id"));
                lawer.setCaseTypeId(rs.getInt("caseType_id"));
                lawers.add(lawer);
            }
        } catch (SQLException e) {
            System.out.println("Lawer find all error: " + e.getMessage());
        }
        return lawers;
    }
    
    public boolean isNRCExists(String NRC) {
	    boolean exists = true;
	    String sql = "SELECT COUNT(*) FROM lawer WHERE NRC = ?";
	    try {
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1, NRC);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            exists = rs.getInt(1) > 0;
	        }
	    } catch (SQLException e) {
	        System.out.println("NRC check error: " + e);
	    }
	    return exists;
	} 
    
    public LawerInfo lawerAllInfoById(int id){
    	  LawerInfo lawer = null;
    	  String sql="SELECT lawer.*, user.*,casetype.name as casetype_name FROM ((lawer INNER JOIN user ON lawer.user_user_id = user.user_id) INNER JOIN casetype ON casetype.id = lawer.caseType_id) where lawer.id=?";
    	  
    	  try {
			PreparedStatement ps=con.prepareStatement(sql);
			 ps.setInt(1, id);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                lawer = new LawerInfo();
	                lawer.setId(rs.getInt("id"));
	                lawer.setCurrentState(rs.getString("current_state"));
	                lawer.setPrice(rs.getString("price"));
	                lawer.setPhoto(rs.getString("photo"));
	                lawer.setStatus(rs.getString("status"));
	                lawer.setCaseTypeId(rs.getInt("caseType_id"));
	                lawer.setUserId(rs.getInt("user_id"));
	                lawer.setName(rs.getString("name"));
	                lawer.setPassword(rs.getString("password"));
	                lawer.setEmail(rs.getString("email"));
	                lawer.setPhone(rs.getString("phone"));
	                lawer.setGender(rs.getString("gender"));
	                lawer.setNRC(rs.getString("NRC"));
	                lawer.setRole(rs.getString("role"));
	                lawer.setCasetype_name(rs.getString("casetype_name"));
	            }
	        } catch (SQLException e) {
	            System.out.println("Lawer find by id error: " + e.getMessage());
	        }
    	  
    	  return lawer;
    }
    
    public Lawer findByUserId(int id) {
        Lawer lawer = null;
        String sql = "SELECT * FROM lawer WHERE user_user_id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                lawer = new Lawer();
                lawer.setId(rs.getInt("id"));
                lawer.setCurrentState(rs.getString("current_state"));
                lawer.setPrice(rs.getString("price"));
                lawer.setPhoto(rs.getString("photo"));
                lawer.setStatus(rs.getString("status"));
                lawer.setUserUserId(rs.getInt("user_user_id"));
                lawer.setCaseTypeId(rs.getInt("caseType_id"));
            }
        } catch (SQLException e) {
            System.out.println("Lawer find by id error: " + e.getMessage());
        }
        return lawer;
    }

    


}

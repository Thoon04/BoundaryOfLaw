//package boundary_of_law.persistance;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
//
//import boundary_of_law.models.LawerInfo;
//
//public class LawerInfoRepository {
//	
//	 private static Connection con = null;
//
//	    static {
//	        con = MyConnection.getConnection();
//	    }
//
//	public List<LawerInfo> findAll(){
//		 List<LawerInfo> lawers = new ArrayList<>();
//	        String sql = "select lawer.*, user.*, casetype.name as casetype_name FROM ((lawer INNER JOIN user ON lawer.user_user_id = user.user_id) INNER JOIN casetype ON casetype.id = lawer.caseType_id);";
//	        try {
//	            PreparedStatement ps = con.prepareStatement(sql);
//	            ResultSet rs = ps.executeQuery();
//	            while (rs.next()) {
//	            	LawerInfo lawer = new LawerInfo();
//	                lawer.setId(rs.getInt("id"));
//	                lawer.setCurrentState(rs.getString("current_state"));
//	                lawer.setPrice(rs.getString("price"));
//	                lawer.setPhoto(rs.getString("photo"));
//	                lawer.setStatus(rs.getString("status"));
//	                lawer.setCaseTypeId(rs.getInt("caseType_id"));
//	                lawer.setUserId(rs.getInt("user_id"));
//	                lawer.setName(rs.getString("name"));
//	                lawer.setPassword(rs.getString("password"));
//	                lawer.setEmail(rs.getString("email"));
//	                lawer.setPhone(rs.getString("phone"));
//	                lawer.setGender(rs.getString("gender"));
//	                lawer.setNrc(rs.getString("NRC"));
//	                lawer.setRole(rs.getString("role"));
//	                lawer.setCasetype_name(rs.getString("casetype_name"));
//	                lawers.add(lawer);
//	            }
//	        } catch (SQLException e) {
//	            System.out.println("Lawer find all error: " + e.getMessage());
//	        }
//	        return lawers;
//	    }
//	
//	
//}

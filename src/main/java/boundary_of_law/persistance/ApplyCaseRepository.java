package boundary_of_law.persistance;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import boundary_of_law.models.ApplyCase;

public class ApplyCaseRepository {
	
	public static Connection con=null;
	static {
		con=MyConnection.getConnection();	
	}

	public List<ApplyCase> getPendingList(int lawerId){
		List<ApplyCase> applyCases = new ArrayList<>();
		String sql = "SELECT " +
		        "apply_case.id AS id, " +
		        "enduser.status AS user_status, " +
		        "apply_case.status AS apply_case_status, " +
		        "user.user_id, " +
		        "user.name AS user_name, " +
		        "user.email, " +
		        "user.phone, " +
		        "user.gender, " +
		        "user.NRC, " +
		        "user.role, " +
		        "apply_case.endUser_id AS end_user_id, " +
		        "enduser.current_state, " +
		        "apply_case.name AS apply_case_name, " +
		        "apply_case.lawer_id AS lawer_id, " +
		        "apply_case.cases_id AS cases_id, " +
		        "cases.name AS case_name, " +
		        "cases.case_sub_code, " +
		        "casetype.name AS casetype_name, " +
		        "casetype.id AS case_type_id " +
		        "FROM apply_case " +
		        "INNER JOIN cases ON apply_case.cases_id = cases.id " +
		        "INNER JOIN casetype ON casetype.id = cases.caseType_id " +
		        "INNER JOIN enduser ON enduser.id = apply_case.endUser_id " +
		        "INNER JOIN user ON user.user_id = enduser.user_user_id " +
		        "WHERE apply_case.lawer_id = ? AND apply_case.status = 'pending';";

		try {
		    PreparedStatement ps = con.prepareStatement(sql);
		    ps.setInt(1, lawerId);  
		    ResultSet rs = ps.executeQuery();
		    while (rs.next()) {
		        ApplyCase applyCase = new ApplyCase();
		        applyCase.setId(rs.getInt("id"));
		        applyCase.setUser_status(rs.getString("user_status"));
		        applyCase.setApply_case_status(rs.getString("apply_case_status"));
		        applyCase.setUser_id(rs.getInt("user_id"));
		        applyCase.setUser_name(rs.getString("user_name"));;
		        applyCase.setEmail(rs.getString("email"));
		        applyCase.setPhone(rs.getString("phone"));
		        applyCase.setGender(rs.getString("gender"));
		        applyCase.setNRC(rs.getString("NRC"));
		        applyCase.setRole(rs.getString("role"));
		        applyCase.setEnd_user_id(rs.getInt("end_user_id"));
		        applyCase.setCurrent_state(rs.getString("current_state"));
		        applyCase.setApply_case_name(rs.getString("apply_case_name"));
		        applyCase.setLawer_id(rs.getInt("lawer_id"));
		        applyCase.setCases_id(rs.getInt("cases_id"));
		        applyCase.setCase_name(rs.getString("case_name"));
		        applyCase.setCase_sub_code(rs.getString("case_sub_code"));
		        applyCase.setCasetype_name(rs.getString("casetype_name"));
		        applyCase.setCase_type_id(rs.getInt("case_type_id"));
		        applyCases.add(applyCase);
		    }
		} catch (SQLException e) {
		    System.out.println("Lawer find all error: " + e.getMessage());
		}
		return applyCases;

	}
	public List<ApplyCase> getConfirmList(int lawerId){
		List<ApplyCase> applyCases = new ArrayList<>();
		String sql = "SELECT " +
		        "apply_case.id AS id, " +
		        "enduser.status AS user_status, " +
		        "apply_case.status AS apply_case_status, " +
		        "user.user_id, " +
		        "user.name AS user_name, " +
		        "user.email, " +
		        "user.phone, " +
		        "user.gender, " +
		        "user.NRC, " +
		        "user.role, " +
		        "apply_case.endUser_id AS end_user_id, " +
		        "enduser.current_state, " +
		        "apply_case.name AS apply_case_name, " +
		        "apply_case.lawer_id AS lawer_id, " +
		        "apply_case.cases_id AS cases_id, " +
		        "cases.name AS case_name, " +
		        "cases.case_sub_code, " +
		        "casetype.name AS casetype_name, " +
		        "casetype.id AS case_type_id " +
		        "FROM apply_case " +
		        "INNER JOIN cases ON apply_case.cases_id = cases.id " +
		        "INNER JOIN casetype ON casetype.id = cases.caseType_id " +
		        "INNER JOIN enduser ON enduser.id = apply_case.endUser_id " +
		        "INNER JOIN user ON user.user_id = enduser.user_user_id " +
		        "WHERE apply_case.lawer_id = ? AND apply_case.status = 'confirm';";

		try {
		    PreparedStatement ps = con.prepareStatement(sql);
		    ps.setInt(1, lawerId);  
		    ResultSet rs = ps.executeQuery();
		    while (rs.next()) {
		        ApplyCase applyCase = new ApplyCase();
		        applyCase.setId(rs.getInt("id"));
		        applyCase.setUser_status(rs.getString("user_status"));
		        applyCase.setApply_case_status(rs.getString("apply_case_status"));
		        applyCase.setUser_id(rs.getInt("user_id"));
		        applyCase.setUser_name(rs.getString("user_name"));;
		        applyCase.setEmail(rs.getString("email"));
		        applyCase.setPhone(rs.getString("phone"));
		        applyCase.setGender(rs.getString("gender"));
		        applyCase.setNRC(rs.getString("NRC"));
		        applyCase.setRole(rs.getString("role"));
		        applyCase.setEnd_user_id(rs.getInt("end_user_id"));
		        applyCase.setCurrent_state(rs.getString("current_state"));
		        applyCase.setApply_case_name(rs.getString("apply_case_name"));
		        applyCase.setLawer_id(rs.getInt("lawer_id"));
		        applyCase.setCases_id(rs.getInt("cases_id"));
		        applyCase.setCase_name(rs.getString("case_name"));
		        applyCase.setCase_sub_code(rs.getString("case_sub_code"));
		        applyCase.setCasetype_name(rs.getString("casetype_name"));
		        applyCase.setCase_type_id(rs.getInt("case_type_id"));
		        applyCases.add(applyCase);
		    }
		} catch (SQLException e) {
		    System.out.println("Lawer find all error: " + e.getMessage());
		}
		return applyCases;

	}
	
	public List<ApplyCase> getRejectList(int lawerId){
		List<ApplyCase> applyCases = new ArrayList<>();
		String sql = "SELECT " +
		        "apply_case.id AS id, " +
		        "enduser.status AS user_status, " +
		        "apply_case.status AS apply_case_status, " +
		        "user.user_id, " +
		        "user.name AS user_name, " +
		        "user.email, " +
		        "user.phone, " +
		        "user.gender, " +
		        "user.NRC, " +
		        "user.role, " +
		        "apply_case.endUser_id AS end_user_id, " +
		        "enduser.current_state, " +
		        "apply_case.name AS apply_case_name, " +
		        "apply_case.lawer_id AS lawer_id, " +
		        "apply_case.cases_id AS cases_id, " +
		        "cases.name AS case_name, " +
		        "cases.case_sub_code, " +
		        "casetype.name AS casetype_name, " +
		        "casetype.id AS case_type_id " +
		        "FROM apply_case " +
		        "INNER JOIN cases ON apply_case.cases_id = cases.id " +
		        "INNER JOIN casetype ON casetype.id = cases.caseType_id " +
		        "INNER JOIN enduser ON enduser.id = apply_case.endUser_id " +
		        "INNER JOIN user ON user.user_id = enduser.user_user_id " +
		        "WHERE apply_case.lawer_id = ? AND apply_case.status = 'reject';";

		try {
		    PreparedStatement ps = con.prepareStatement(sql);
		    ps.setInt(1, lawerId);  
		    ResultSet rs = ps.executeQuery();
		    while (rs.next()) {
		        ApplyCase applyCase = new ApplyCase();
		        applyCase.setId(rs.getInt("id"));
		        applyCase.setUser_status(rs.getString("user_status"));
		        applyCase.setApply_case_status(rs.getString("apply_case_status"));
		        applyCase.setUser_id(rs.getInt("user_id"));
		        applyCase.setUser_name(rs.getString("user_name"));;
		        applyCase.setEmail(rs.getString("email"));
		        applyCase.setPhone(rs.getString("phone"));
		        applyCase.setGender(rs.getString("gender"));
		        applyCase.setNRC(rs.getString("NRC"));
		        applyCase.setRole(rs.getString("role"));
		        applyCase.setEnd_user_id(rs.getInt("end_user_id"));
		        applyCase.setCurrent_state(rs.getString("current_state"));
		        applyCase.setApply_case_name(rs.getString("apply_case_name"));
		        applyCase.setLawer_id(rs.getInt("lawer_id"));
		        applyCase.setCases_id(rs.getInt("cases_id"));
		        applyCase.setCase_name(rs.getString("case_name"));
		        applyCase.setCase_sub_code(rs.getString("case_sub_code"));
		        applyCase.setCasetype_name(rs.getString("casetype_name"));
		        applyCase.setCase_type_id(rs.getInt("case_type_id"));
		        applyCases.add(applyCase);
		    }
		} catch (SQLException e) {
		    System.out.println("Lawer find all error: " + e.getMessage());
		}
		return applyCases;

	}

	
	
	public List<ApplyCase> getALlList(int lawerId){
		List<ApplyCase> applyCases = new ArrayList<>();
		String sql = "SELECT " +
		        "apply_case.id AS id, " +
		        "enduser.status AS user_status, " +
		        "apply_case.status AS apply_case_status, " +
		        "user.user_id, " +
		        "user.name AS user_name, " +
		        "user.email, " +
		        "user.phone, " +
		        "user.gender, " +
		        "user.NRC, " +
		        "user.role, " +
		        "apply_case.endUser_id AS end_user_id, " +
		        "enduser.current_state, " +
		        "apply_case.name AS apply_case_name, " +
		        "apply_case.lawer_id AS lawer_id, " +
		        "apply_case.cases_id AS cases_id, " +
		        "cases.name AS case_name, " +
		        "cases.case_sub_code, " +
		        "casetype.name AS casetype_name, " +
		        "casetype.id AS case_type_id " +
		        "FROM apply_case " +
		        "INNER JOIN cases ON apply_case.cases_id = cases.id " +
		        "INNER JOIN casetype ON casetype.id = cases.caseType_id " +
		        "INNER JOIN enduser ON enduser.id = apply_case.endUser_id " +
		        "INNER JOIN user ON user.user_id = enduser.user_user_id " +
		        "WHERE apply_case.lawer_id = ?";

		try {
		    PreparedStatement ps = con.prepareStatement(sql);
		    ps.setInt(1, lawerId);  
		    ResultSet rs = ps.executeQuery();
		    while (rs.next()) {
		        ApplyCase applyCase = new ApplyCase();
		        applyCase.setId(rs.getInt("id"));
		        applyCase.setUser_status(rs.getString("user_status"));
		        applyCase.setApply_case_status(rs.getString("apply_case_status"));
		        applyCase.setUser_id(rs.getInt("user_id"));
		        applyCase.setUser_name(rs.getString("user_name"));;
		        applyCase.setEmail(rs.getString("email"));
		        applyCase.setPhone(rs.getString("phone"));
		        applyCase.setGender(rs.getString("gender"));
		        applyCase.setNRC(rs.getString("NRC"));
		        applyCase.setRole(rs.getString("role"));
		        applyCase.setEnd_user_id(rs.getInt("end_user_id"));
		        applyCase.setCurrent_state(rs.getString("current_state"));
		        applyCase.setApply_case_name(rs.getString("apply_case_name"));
		        applyCase.setLawer_id(rs.getInt("lawer_id"));
		        applyCase.setCases_id(rs.getInt("cases_id"));
		        applyCase.setCase_name(rs.getString("case_name"));
		        applyCase.setCase_sub_code(rs.getString("case_sub_code"));
		        applyCase.setCasetype_name(rs.getString("casetype_name"));
		        applyCase.setCase_type_id(rs.getInt("case_type_id"));
		        applyCases.add(applyCase);
		    }
		} catch (SQLException e) {
		    System.out.println("Lawer find all error: " + e.getMessage());
		}
		return applyCases;

	}
	
	public ApplyCase getCaseDetail(int caseId){
		ApplyCase applyCase =null;
		
		String sql = "SELECT " +
		        "apply_case.id AS id, " +
		        "enduser.status AS user_status, " +
		        "apply_case.status AS apply_case_status, " +
		        "user.user_id, " +
		        "user.name AS user_name, " +
		        "user.email, " +
		        "user.phone, " +
		        "user.gender, " +
		        "user.NRC, " +
		        "user.role, " +
		        "apply_case.endUser_id AS end_user_id, " +
		        "enduser.current_state, " +
		        "apply_case.name AS apply_case_name, " +
		        "apply_case.lawer_id AS lawer_id, " +
		        "apply_case.cases_id AS cases_id, " +
		        "cases.name AS case_name, " +
		        "cases.case_sub_code, " +
		        "casetype.name AS casetype_name, " +
		        "casetype.id AS case_type_id " +
		        "FROM apply_case " +
		        "INNER JOIN cases ON apply_case.cases_id = cases.id " +
		        "INNER JOIN casetype ON casetype.id = cases.caseType_id " +
		        "INNER JOIN enduser ON enduser.id = apply_case.endUser_id " +
		        "INNER JOIN user ON user.user_id = enduser.user_user_id " +
		        "WHERE apply_case.id = ?;";

		try {
		    PreparedStatement ps = con.prepareStatement(sql);
		    ps.setInt(1, caseId);  
		    ResultSet rs = ps.executeQuery();
		    if (rs.next()) {
	            applyCase = new ApplyCase();
		        applyCase.setId(rs.getInt("id"));
		        applyCase.setUser_status(rs.getString("user_status"));
		        applyCase.setApply_case_status(rs.getString("apply_case_status"));
		        applyCase.setUser_id(rs.getInt("user_id"));
		        applyCase.setUser_name(rs.getString("user_name"));;
		        applyCase.setEmail(rs.getString("email"));
		        applyCase.setPhone(rs.getString("phone"));
		        applyCase.setGender(rs.getString("gender"));
		        applyCase.setNRC(rs.getString("NRC"));
		        applyCase.setRole(rs.getString("role"));
		        applyCase.setEnd_user_id(rs.getInt("end_user_id"));
		        applyCase.setCurrent_state(rs.getString("current_state"));
		        applyCase.setApply_case_name(rs.getString("apply_case_name"));
		        applyCase.setLawer_id(rs.getInt("lawer_id"));
		        applyCase.setCases_id(rs.getInt("cases_id"));
		        applyCase.setCase_name(rs.getString("case_name"));
		        applyCase.setCase_sub_code(rs.getString("case_sub_code"));
		        applyCase.setCasetype_name(rs.getString("casetype_name"));
		        applyCase.setCase_type_id(rs.getInt("case_type_id"));
		    }
		} catch (SQLException e) {
		    System.out.println("Lawer find all error: " + e.getMessage());
		}
		return applyCase;

	}
	
}

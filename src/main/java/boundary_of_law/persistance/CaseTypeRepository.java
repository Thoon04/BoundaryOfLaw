package boundary_of_law.persistance;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import boundary_of_law.models.CaseType;

public class CaseTypeRepository {

	public static Connection con = null;
	static {
		con = MyConnection.getConnection();
	}

	// insert
	public int add(CaseType casetype) {
		int result = 0;
		String sql = "INSERT INTO casetype(id, name) VALUES (?,?)";
		System.out.println("casetype " + casetype.getName());
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, casetype.getId());
			ps.setString(2, casetype.getName());

			result = ps.executeUpdate();

		} catch (SQLException e) {
			result = 0;
			System.out.println("casetype insert error :  " + e);
		}
		return result;

	}

	// Update
	public int edit(CaseType casetype) {
		int result = 0;
		String sql = "UPDATE casetype SET name=? where id=?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, casetype.getName());
			ps.setInt(2, casetype.getId());

			result = ps.executeUpdate();

		} catch (SQLException e) {
			result = 0;
			System.out.println("casetype edit error :  " + e);
		}
		return result;

	}

	// delete
	public int delete(int id) {
		int result = 0;
		String sql = "DELETE FROM casetype WHERE id=?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);

			result = ps.executeUpdate();

		} catch (SQLException e) {
			result = 0;
			System.out.println("casetype delete error " + e);
		}
		return result;

	}// getAll

	public List<CaseType> getAll() {

		List<CaseType> casetypes = new ArrayList<>();
		String sql = "SELECT * FROM casetype";

		try {
			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				CaseType casetype = new CaseType();
				casetype.setId(rs.getInt("id"));
				casetype.setName(rs.getString("name"));

				casetypes.add(casetype);
			}
		} catch (SQLException e) {
			System.out.println("enduser select error :  " + e);
			return casetypes;
		}
		return casetypes;
	}

	// getone

	public CaseType getById(int id) {
		CaseType casetype = null;
		String sql = "SELECT * FROM casetype WHERE id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				casetype = new CaseType();
				casetype.setId(rs.getInt("id"));
				casetype.setName(rs.getString("name"));
			}
		} catch (SQLException e) {
			casetype = null;

			System.out.println("casetype getByCode error :  " + e);

		}
		return casetype;

	}

}

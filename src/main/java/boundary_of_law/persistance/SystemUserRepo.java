package boundary_of_law.persistance;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import boundary_of_law.models.CheckEmail;
import boundary_of_law.models.Login;
import boundary_of_law.models.User;
@Repository
public class SystemUserRepo {
	public static Connection con = null;
	static {
		con = MyConnection.getConnection();
	}
	//insert
	public int add(User user) {
		int result=0;
		if (!checkEmailAndPassword(user.getPassword(),user.getEmail())) {
		String sql="INSERT INTO user(user_id,name,password,email,phone,gender,NRC,role) VALUES (?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1,user.getUser_id());
			ps.setString(2, user.getName());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getEmail());
			ps.setString(5, user.getPhone());
			ps.setString(6, user.getGender());
			ps.setString(7, user.getNRC());
			ps.setString(8, user.getRole());
			result=ps.executeUpdate();
		
		}catch(SQLException e) {
			result=0;
			System.out.println("User insert err: "+e);
		}
		}
		return result;
	}
	
	//update
	public int edit(User user) {
		int result=0;
		String sql="UPDATE user SET name=?, password=?, email=?, phone=?, gender=?, NRC=?, role=? WHERE user_id=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getEmail());
			ps.setString(4, user.getPhone());
			ps.setString(5, user.getGender());
			ps.setString(6, user.getNRC());
			ps.setString(7, user.getRole());
			ps.setInt(8, user.getUser_id());
			
			result=ps.executeUpdate();
		}catch(SQLException e) {
			result=0;
			System.out.println("User edit err: "+e);
		}
		return result;
	}
	
	//delete
		public int delete(int user_id) {
			int result=0;
			String sql="DELETE FROM user WHERE user_id=?";
			try {
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setInt(1, user_id);
				result=ps.executeUpdate();
				
			}catch(SQLException e) {
				result=0;
				System.out.println("User delete err: "+e);
			}
			return result;
		}
		
		//getAll
		public List<User>getAll(){
			List<User> users=new ArrayList<>();
			String sql="SELECT * FROM user";
			try {
				PreparedStatement ps=con.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					User user=new User();
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
				
			}catch(SQLException e) {
				System.out.println("User selec err: "+e);
			}
			return users;
		}
		
		
		
		//getByCode == getOne
		public User getById(int user_id) {
			User user=null;//initially null
			String sql="SELECT * FROM user WHERE user_id=?";
			try {
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setInt(1, user_id);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					user=new User();
					user.setUser_id(rs.getInt("user_id"));
					user.setName(rs.getString("name"));
					user.setPassword(rs.getString("password"));
					user.setEmail(rs.getString("email"));
					user.setPhone(rs.getString("phone"));
					user.setGender(rs.getString("gender"));
					user.setNRC(rs.getString("NRC"));
					user.setRole(rs.getString("role"));
				}
				
			}catch(SQLException e) {
				System.out.println("User getByCode err: "+e);
			}
			return user;
		}
		public User getByLogin(Login login) {
			User user = null;
			String sql="SELECT * FROM user where  password=? and email=?";
			try {
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1, login.getPassword());
				ps.setString(2, login.getEmail());
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					user=new User();
					user.setUser_id(rs.getInt("user_id"));
					user.setName(rs.getString("name"));
					user.setPassword(rs.getString("password"));
					user.setEmail(rs.getString("email"));
					user.setPhone(rs.getString("phone"));
					user.setGender(rs.getString("gender"));
					user.setNRC(rs.getString("NRC"));
					user.setRole(rs.getString("role"));
				}
				
			}catch(SQLException e) {
				System.out.println("User getByLogin err: "+e);
			}
			return user;
		}
		public boolean checkEmailAndPassword(String email, String password) {
			boolean status=false;
	        User user = null;
	        String sql = "SELECT * FROM user WHERE email=? AND password=?";
	        try (PreparedStatement ps = con.prepareStatement(sql)) {
	            ps.setString(1, password);
	            ps.setString(2, email);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                user = new User();
	                user.setUser_id(rs.getInt("user_id"));
	                user.setName(rs.getString("name"));	               
	                user.setPassword(rs.getString("password"));
	                user.setEmail(rs.getString("email"));
	                // set other properties as needed
	            }
	        } catch (SQLException e) {
	            System.out.println("Error fetching user by email and password: " + e);
	        }
	        return status;
	    }
		public User findByEmail(String email) {
			User user = null;
			String sql="SELECT * FROM user where  email=?";
			try {
				PreparedStatement ps=con.prepareStatement(sql);				
				ps.setString(1, email);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					user=new User();
					user.setUser_id(rs.getInt("user_id"));
					user.setName(rs.getString("name"));
					user.setPassword(rs.getString("password"));
					user.setEmail(rs.getString("email"));
					user.setPhone(rs.getString("phone"));
					user.setGender(rs.getString("gender"));
					user.setNRC(rs.getString("NRC"));
					user.setRole(rs.getString("role"));
				}
				
			}catch(SQLException e) {
				System.out.println("User findByEmail err: "+e);
			}
			return user;
		}

		

  }

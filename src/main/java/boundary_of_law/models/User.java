package boundary_of_law.models;

public class User {
    private int user_id;
    private String name;
    private String password;
    private String email;
    private String phone;
    private String gender;
    private String NRC;
    private String role;

    
    
    
    public User() {
		super();
	}
    
    

	public User(int user_id, String name, String password, String email, String phone, String gender, String NRC,
			String role) {
		super();
		this.user_id = user_id;
		this.name = name;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.NRC = NRC;
		this.role = role;
	}

	


	public User(String name, String password, String email, String phone, String gender, String NRC, String role) {
		super();
		this.name = name;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.NRC = NRC;
		this.role = role;
	}



	// Getters and Setters
    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getNRC() {
        return NRC;
    }

    public void setNRC(String NRC) {
        this.NRC = NRC;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}

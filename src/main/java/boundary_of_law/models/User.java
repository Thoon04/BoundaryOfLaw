package boundary_of_law.models;

public class User {
    private int userId;
    private String name;
    private String password;
    private String email;
    private String phone;
    private String gender;
    private String nrc;
    private String role;

    
    
    
    public User() {
		super();
	}
    
    

	public User(int userId, String name, String password, String email, String phone, String gender, String nrc,
			String role) {
		super();
		this.userId = userId;
		this.name = name;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.nrc = nrc;
		this.role = role;
	}

	


	public User(String name, String password, String email, String phone, String gender, String nrc, String role) {
		super();
		this.name = name;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.nrc = nrc;
		this.role = role;
	}



	// Getters and Setters
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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

    public String getNrc() {
        return nrc;
    }

    public void setNrc(String nrc) {
        this.nrc = nrc;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}

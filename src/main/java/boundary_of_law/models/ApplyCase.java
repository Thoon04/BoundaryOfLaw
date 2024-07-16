package boundary_of_law.models;

public class ApplyCase {
	private int id;
	private String user_status;
	private String apply_case_status;
	private int user_id;
	private String user_name;
	private String email;
	private String phone;
	private String gender;
	private String NRC;
	private String role;
	private int end_user_id;
	private String current_state;
	private String apply_case_name;
	private int lawer_id;
	private int cases_id;
	private String case_name;
	private String case_sub_code;
	private String casetype_name;
	private int case_type_id;
	
	public ApplyCase() {
		super();
	}

	public ApplyCase(int id, String user_status, String apply_case_status, int user_id, String user_name, String email,
			String phone, String gender, String nRC, String role, int end_user_id, String current_state,
			String apply_case_name, int lawer_id, int cases_id, String case_name, String case_sub_code,
			String casetype_name, int case_type_id) {
		super();
		this.id = id;
		this.user_status = user_status;
		this.apply_case_status = apply_case_status;
		this.user_id = user_id;
		this.user_name = user_name;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		NRC = nRC;
		this.role = role;
		this.end_user_id = end_user_id;
		this.current_state = current_state;
		this.apply_case_name = apply_case_name;
		this.lawer_id = lawer_id;
		this.cases_id = cases_id;
		this.case_name = case_name;
		this.case_sub_code = case_sub_code;
		this.casetype_name = casetype_name;
		this.case_type_id = case_type_id;
	}

	public ApplyCase(String user_status, String apply_case_status, int user_id, String user_name, String email,
			String phone, String gender, String nRC, String role, int end_user_id, String current_state,
			String apply_case_name, int lawer_id, int cases_id, String case_name, String case_sub_code,
			String casetype_name, int case_type_id) {
		super();
		this.user_status = user_status;
		this.apply_case_status = apply_case_status;
		this.user_id = user_id;
		this.user_name = user_name;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		NRC = nRC;
		this.role = role;
		this.end_user_id = end_user_id;
		this.current_state = current_state;
		this.apply_case_name = apply_case_name;
		this.lawer_id = lawer_id;
		this.cases_id = cases_id;
		this.case_name = case_name;
		this.case_sub_code = case_sub_code;
		this.casetype_name = casetype_name;
		this.case_type_id = case_type_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUser_status() {
		return user_status;
	}

	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}

	public String getApply_case_status() {
		return apply_case_status;
	}

	public void setApply_case_status(String apply_case_status) {
		this.apply_case_status = apply_case_status;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
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

	public void setNRC(String nRC) {
		NRC = nRC;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public int getEnd_user_id() {
		return end_user_id;
	}

	public void setEnd_user_id(int end_user_id) {
		this.end_user_id = end_user_id;
	}

	public String getCurrent_state() {
		return current_state;
	}

	public void setCurrent_state(String current_state) {
		this.current_state = current_state;
	}

	public String getApply_case_name() {
		return apply_case_name;
	}

	public void setApply_case_name(String apply_case_name) {
		this.apply_case_name = apply_case_name;
	}

	public int getLawer_id() {
		return lawer_id;
	}

	public void setLawer_id(int lawer_id) {
		this.lawer_id = lawer_id;
	}

	public int getCases_id() {
		return cases_id;
	}

	public void setCases_id(int cases_id) {
		this.cases_id = cases_id;
	}

	public String getCase_name() {
		return case_name;
	}

	public void setCase_name(String case_name) {
		this.case_name = case_name;
	}

	public String getCase_sub_code() {
		return case_sub_code;
	}

	public void setCase_sub_code(String case_sub_code) {
		this.case_sub_code = case_sub_code;
	}

	public String getCasetype_name() {
		return casetype_name;
	}

	public void setCasetype_name(String casetype_name) {
		this.casetype_name = casetype_name;
	}

	public int getCase_type_id() {
		return case_type_id;
	}

	public void setCase_type_id(int case_type_id) {
		this.case_type_id = case_type_id;
	}

	
	
}

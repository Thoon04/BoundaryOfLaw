package boundary_of_law.Controllers;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import boundary_of_law.models.CaseType;
import boundary_of_law.models.Lawer;
import boundary_of_law.models.LawerInfo;
import boundary_of_law.models.User;
import boundary_of_law.persistance.CaseTypeRepository;
import boundary_of_law.persistance.LawerInfoRepository;
import boundary_of_law.persistance.LawerRepository;
import boundary_of_law.persistance.UserRepository;

import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;

@Controller
public class LawerController {

    @Autowired
    CaseTypeRepository caseTypeRepo;
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private LawerRepository lawerRepository;
    
    @Autowired
    LawerInfoRepository lawerInfoRepo;

    @GetMapping("/")
    public String register(Model model)  {
    	
        List<CaseType> caseTypes = caseTypeRepo.getAll();
        model.addAttribute("case_types", caseTypes);
        return "lawers/register";
    }
    @PostMapping("/")
    public String submitForm(ModelMap map, 
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("NRC") String nrc,
            @RequestParam("phone") String phone,
            @RequestParam("gender") String gender,
            @RequestParam("current_state") String currentState,
            @RequestParam("price") String price,
            @RequestParam("photo") MultipartFile photo,
            @RequestParam("case_type_id") int caseTypeId,
            @RequestParam("password") String password,
            @RequestParam("confirmPassword") String confirmPassword,
            @RequestParam("status") String status,
            @RequestParam("role") String role,
            RedirectAttributes redirectAttributes) {

       
        // Create and populate User object
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setNRC(nrc);
        user.setPhone(phone);
        user.setGender(gender);
        user.setPassword(password);
        user.setRole(role);

        int result = userRepository.add(user);
        if (result > 0) {
        	
        	int user_id = userRepository.findIdWithEmail(email);
            // Create and populate Lawer object
            Lawer lawer = new Lawer();
            lawer.setCurrentState(currentState);
            lawer.setPrice(price);
            lawer.setUserUserId(user_id);
            lawer.setCaseTypeId(caseTypeId);
            lawer.setStatus(status);

            byte[] bytes = null;
            try {
              bytes = photo.getBytes();
            } catch (IOException e) {
              // TODO Auto-generated catch block
              e.printStackTrace();
            }
                   String encodedPhoto = Base64.getEncoder().encodeToString(bytes);
                   lawer.setPhoto(encodedPhoto);

            lawerRepository.add(lawer);
            
            
            if (result == 1062) {
            	
                map.addAttribute("lawer", lawer);
                map.addAttribute("user", user);
                
                 map.addAttribute("nrcError", "Your NRC is already exist.");
                 map.addAttribute("case_types", caseTypeRepo.getAll());
                 return "lawers/register";
            }
            else {
            	map.addAttribute("success_msg", "You can login your lawyer account a few days later when your information are accepted.");
            	return "lawers/register";

            }

        }
        return "redirect:/";
    }
    
  
    @RequestMapping("profile")
    public String profile(ModelMap map,HttpSession session) {
    	String userIdString=(String) session.getAttribute("LoginUserId"); 
    	if( userIdString==null||userIdString.isEmpty()||userIdString.isBlank()) {
    		userIdString="5";
    	
    	}
    	int userId= Integer.parseInt(userIdString); 
    	Lawer lawer=lawerRepository.findByUserId(userId);
    	LawerInfo lawerinfo=lawerRepository.lawerAllInfoById(lawer.getId());
    	map.addAttribute("lawer",lawerinfo);
    	return "lawers/profile";
    }
    
    @GetMapping("editLawer")
    	public String editLawer(ModelMap map,
    			  @RequestParam("id") int id) {
    	LawerInfo lawer=new LawerInfo();
    	lawer=lawerRepository.lawerAllInfoById(id);
    	 List<CaseType> caseTypes = caseTypeRepo.getAll();
         map.addAttribute("case_types", caseTypes);
         map.addAttribute("lawer",lawer);
    	return "lawers/registerEdit";
    		
    }
    
    @PostMapping("editLawer")
	public String editLawerPost(ModelMap map, 
			@RequestParam("id")int id,
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("NRC") String nrc,
            @RequestParam("phone") String phone,
            @RequestParam("gender") String gender,
            @RequestParam("current_state") String currentState,
            @RequestParam("price") String price,
            @RequestParam("case_type_id") int caseTypeId) {

			LawerInfo lawerInfo=lawerRepository.lawerAllInfoById(id);
			String photo=lawerInfo.getPhoto();
			String password=lawerInfo.getPassword();
			int userId=lawerInfo.getUserId();
			String status=lawerInfo.getStatus();
			String role=lawerInfo.getRole();
			
			User user=new User(userId,name,password,email,phone,gender,nrc,role);
			userRepository.edit(user);
			
			Lawer lawer=new Lawer();
			lawer.setId(id);
			lawer.setCurrentState(currentState);
			lawer.setPrice(price);
			lawer.setPhoto(photo);
			lawer.setStatus(status);
			lawer.setUserUserId(userId);
			lawer.setCaseTypeId(caseTypeId);
			lawerRepository.edit(lawer);
			
			LawerInfo newlawerinfo=lawerRepository.lawerAllInfoById(id);
	    	map.addAttribute("lawer",newlawerinfo);
			return "lawers/profile";
		
}
    
    @RequestMapping("dashboard")
    public String dashboard(ModelMap map,HttpSession session) {
    	String userIdString=(String) session.getAttribute("LoginUserId"); 
    	if( userIdString==null||userIdString.isEmpty()||userIdString.isBlank()) {
    		userIdString="5";
    	
    	}
    	int userId= Integer.parseInt(userIdString); 
    	Lawer lawer=lawerRepository.findByUserId(userId);
    	LawerInfo lawerinfo=lawerRepository.lawerAllInfoById(lawer.getId());
    	map.addAttribute("lawer",lawerinfo);
    	System.out.println(lawerinfo.getName());
    	return "lawers/dashboard";
    }
    
    
    
    
    
    
}



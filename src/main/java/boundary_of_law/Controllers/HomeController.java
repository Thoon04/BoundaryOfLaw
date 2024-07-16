package boundary_of_law.Controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boundary_of_law.models.Login;
import boundary_of_law.models.User;
import boundary_of_law.persistance.SystemUserRepo;

@Controller
public class HomeController {

	@RequestMapping("/")
	public ModelAndView home() {
		return new ModelAndView ("home","user",new User());
	}
	

	
//	@RequestMapping("/")
//	public ModelAndView index() {
//		return new ModelAndView ("login","user",new User());
//	}
////	@GetMapping("/login")
////	public ModelAndView home() {
////		return new ModelAndView ("login","user",new User());
////	}
//	@PostMapping("/")
//    public String doLogin(@ModelAttribute("user")Login login) {
//		SystemUserRepo userRepo=new SystemUserRepo();
//		User user=userRepo.getByLogin(login);
//		if(user!=null && user.getEmail()!=null) {
//			return "systemUserDisplay";
//		}else {
//			return "redirect:/";
//		}
//	}
}

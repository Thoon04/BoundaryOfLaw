package boundary_of_law.Controllers;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import boundary_of_law.persistance.EndUserRepository;
import boundary_of_law.models.User;
import boundary_of_law.persistance.SystemUserRepo;

@Controller
public class UserController {
	@Autowired
	SystemUserRepo systemUserRepo;

	@Autowired
	EndUserRepository enduserRepo;



	// get are write to the appear form
		@RequestMapping("systemusers")
		public String displayAll(ModelMap map) {
			List<User> users = systemUserRepo.getAll();

			map.addAttribute("user", users);// model
			List<User> systemusers = systemUserRepo.getAll();

			map.addAttribute("systemusers", systemusers);// model

			return "systemUserDisplay";// view
		}
		
		@RequestMapping("displayUser")
		public String displayUser(ModelMap map) {
			List<User> users = systemUserRepo.getAll();
			map.addAttribute("users", users);// models
			return "displayuser";// view
		}
		
		@GetMapping("addUser")
		public ModelAndView addUser() {
			return new ModelAndView("adduser","user",new User());
		}
		//post are wirte to get the data from form

		@PostMapping("addUser")
		public String addUser(@ModelAttribute("user") @Validated User user, BindingResult bResult, ModelMap map,RedirectAttributes rm) {
		    if (bResult.hasErrors()) {
		        return "adduser";
		    }
		    int rs = systemUserRepo.add(user);
			if(rs!=0) {
				rm.addFlashAttribute("message", "You have Registered Successfully");
			}if(rs==0) {
				map.addAttribute("error_msg","In Adding User, Database something wrong.");
				return "adduser";
			}
			else {
				return "redirect:/displayUser";
			}// Ensure proper redirection after adding the user
		}
		
		@GetMapping("editUser/{id}")
		public ModelAndView editAuthor(@PathVariable int id ) {
			User user=systemUserRepo.getById(id);//get old author from repo
			return new ModelAndView("edituser","user",user);
		}
		
		@PostMapping("editUser")
		public String editUser(@ModelAttribute("user")@Validated User user,BindingResult bResult,ModelMap map, RedirectAttributes rm) {
			if(bResult.hasErrors()) {
				return "edituser";
			}
			int rs=systemUserRepo.edit(user);
			map.addAttribute("result", "true");
			if(rs!=0) {
				rm.addFlashAttribute("message", "You have Updated Successfully");
			}
			//repo updating fail due to Sql error or connection timeout 
			if(rs==0) {
				map.addAttribute("error_msg","In Updating, Database something wrong.");
				return "edituser";
			}
			else {
				return "redirect:/displayUser";
			}
		}
		
		@GetMapping("deleteUser/{id}")
		public String deleteUser(@PathVariable int id ,ModelMap map,RedirectAttributes rm) {
			String message = "";
			int rs=systemUserRepo.delete(id);//get old author from repo
			if(rs!=0) {
				message="You have Deleted User Successfully";
				rm.addFlashAttribute("message", message);
			}
			return "redirect:/displayUser";
		}
}

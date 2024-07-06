package boundary_of_law.Controllers;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import boundary_of_law.persistance.EndUserRepository;
import boundary_of_law.models.User;
import boundary_of_law.persistance.SystemUserRepo;

@Controller
public class UserController {
	@Autowired
	SystemUserRepo systemUserRepo;

	@Autowired
	EndUserRepository enduserRepo;

//	@GetMapping("/enduser")
//	public String displayEndUser(ModelMap map) {
//		List<EndUser> endusers = enduserRepo.getAll();
//		// System.out.println("authors :" + authors.size());
//		map.addAttribute("endusers", endusers);
//		return "displayEnduser";
//	}

	// displayBookServlet

//		@RequestMapping("systemusers")
//		public String displayAll(HttpSession session,ModelMap map) {
//			String loggedInUser = (String) session.getAttribute("loggedInUser");
//	        if (loggedInUser != null) {
//	            map.addAttribute("username", loggedInUser);
//	            return "systemUserDisplay";
//	        } else {
//	            return "redirect:/systemusers";
//	        }
//		}
//		@GetMapping("/logout")
//	    public String logout(HttpSession session) {
//	        session.invalidate();
//	        return "redirect:/login";
//	}
//
//
//	@PostMapping("systemusers")
//	public String displayAll(ModelMap map) {
//		List<User> systemusers = systemUserRepo.getAll();
//
//		map.addAttribute("systemusers", systemusers);// model
//		return "systemUserDisplay";// view
//	}
//
//	@GetMapping("lawDisplay")
//	public String displayLaw(ModelMap map) {
//		List<User> systemusers = systemUserRepo.getAll();
//
//		map.addAttribute("systemusers", systemusers);// model
//		return "lawdisplay";// view
//	}

	// get are write to the appear form
		@RequestMapping("systemusers")
		public String displayAll(ModelMap map) {
			List<User> users = systemUserRepo.getAll();

			map.addAttribute("user", users);// model
			List<User> systemusers = systemUserRepo.getAll();

			map.addAttribute("systemusers", systemusers);// model

			return "systemUserDisplay";// view
		}
//		@RequestMapping("systemusers")
//		public String displayAll(HttpSession session,ModelMap map) {
//			String loggedInUser = (String) session.getAttribute("loggedInUser");
//	        if (loggedInUser != null) {
//	            map.addAttribute("username", loggedInUser);
//	            return "systemUserDisplay";
//	        } else {
//	            return "redirect:/systemusers";
//	        }
//		}
//		@GetMapping("/logout")
//	    public String logout(HttpSession session) {
//	        session.invalidate();
//	        return "redirect:/login";
//	}
		
		@RequestMapping("lawDisplay")
		public String displayLaw(ModelMap map) {
			return "lawdisplay";// view
		}
		

		@RequestMapping("displayUser")
		public String displayUser(ModelMap map) {
			List<User> users = systemUserRepo.getAll();
			map.addAttribute("users", users);// models
			return "displayuser";// view
		}

		
		//get are write to the appear form
//
//		@GetMapping("addUser")
//		public ModelAndView addAuthor() {
//			
//			return new ModelAndView("adduser","user",new User());
//		}
//		//post are wirte to get the data from form


//		@GetMapping("addauthor")
//		public ModelAndView addAuthor() {
//			return new ModelAndView("add_author","author",new Author());
//		}
	// post are wirte to get the data from form


		@GetMapping("addUser")
		public ModelAndView addAuthor() {
			return new ModelAndView("adduser","user",new User());
		}
		//post are wirte to get the data from form

//		@PostMapping("addauthor")
//		public String addAuthor(@ModelAttribute("author")@Validated Author author,BindingResult bResult,ModelMap map) {
//			if(bResult.hasErrors()) {
//				return "add_author";
//			}
//			int rs=authorRepo.add(author);
//			//repo adding fail due to Sql error or connection timeout 
//			if(rs==0) {
//				map.addAttribute("error_msg","Database Error");
//				return "add_author";
//			}
//			return "redirect:/authors";
//		}

		@PostMapping("addUser")
		public String addUser(@ModelAttribute("user")@Validated User user,BindingResult bResult,ModelMap map) {
			if(bResult.hasErrors()) {
				return "adduser";
			}
			int rs=systemUserRepo.add(user);
			//repo adding fail due to Sql error or connection timeout 
			if(rs==0) {
				map.addAttribute("error_msg","Database Error");
				return "adduser";
			}
			return "redirect:/displayUser";
		}
//		
//		@GetMapping("editauthor/{id}")
//		public ModelAndView editAuthor(@PathVariable int id ) {
//			Author author=authorRepo.getById(id);//get old author from repo
//			return new ModelAndView("edit_author","author",author);
//		}
//		@PostMapping("editauthor")
//		public String editAuthor(@ModelAttribute("author")@Validated Author author,BindingResult bResult,ModelMap map) {
//			if(bResult.hasErrors()) {
//				return "edit_author";
//			}
//			int rs=authorRepo.edit(author);
//			//repo updating fail due to Sql error or connection timeout 
//			if(rs==0) {
//				map.addAttribute("error_msg","In Updating, Database something wrong.");
//				return "edit_author";
//			}
//			else {
//				return "redirect:/authors";
//			}
//		}
//		
//		@GetMapping("deleteauthor/{id}")
//		public String deleteAuthor(@PathVariable int id ) {
//			authorRepo.delete(id);//get old author from repo
//			return "redirect:/authors";
//		}

}

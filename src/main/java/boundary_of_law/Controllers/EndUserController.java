package boundary_of_law.Controllers;

import java.util.List;

import javax.validation.Valid;

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

import boundary_of_law.models.EndUser;



@Controller
public class EndUserController {
	@Autowired
		boundary_of_law.persistance.EndUserRepository enduserRepo;


	
		@RequestMapping("enduser")
		public String diaplayAll(ModelMap map) {
			List<EndUser> endusers = enduserRepo.getAll();
			//System.out.println("authors :" + authors.size());
			map.addAttribute("endusers", endusers);
			return "display_enduser";
		}

		@GetMapping("addenduser")
		public ModelAndView addEnduser() {
			return new ModelAndView("enduser", "enduser", new EndUser());

		}

		@PostMapping("addenduser")
		public String addEndUser(@ModelAttribute("enduser") @Validated EndUser enduser, BindingResult bResult, ModelMap map) {
//			if(bResult.hasErrors()) {
//			
//					return "enduser";
//				}
				int rs=enduserRepo.add(enduser);
				if(rs==0) {
					map.addAttribute("enduser",enduser);
					map.addAttribute("error_msg", "SQL Error: ");
					
					return "enduser";
				}else {
					return "user_profile";
				}
		}

		@GetMapping("edituser/{id}")
		public ModelAndView editAuthor(@PathVariable int id) {
			EndUser enduser = enduserRepo.getById(id);
			return new ModelAndView("enduser", "enduser", enduser);

		}



		@PostMapping("editauthor")

		public String editAuthor(@ModelAttribute("author") @Validated EndUser enduser, BindingResult bResult, ModelMap map) {
			int rs = enduserRepo.edit(enduser);
			if (rs == 0) {
				map.addAttribute("error_msg", "SQL Update Error");
				map.addAttribute("enduser", enduser);
				return "edit_author";
			} else {
				return "redirect:/authors";
			}
		}

		@GetMapping("/deleteenduser/{id}")
		public String deleteEndUser(@PathVariable int id) {

			enduserRepo.delete(id);
			return "redirect:/enduser";
		}
		@RequestMapping("/createAcc")
		public String accountCreate() {
			
			return "createAccount";
		}

	}



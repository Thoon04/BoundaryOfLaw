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

import boundary_of_law.models.CaseType;
import boundary_of_law.persistance.CaseTypeRepository;

@Controller
public class CaseTypeController {
	
	@Autowired
	CaseTypeRepository casetypeRepo;
	
	@RequestMapping("casetype")
	public String displayAll(ModelMap map) {
		List<CaseType> casetypes = casetypeRepo.getAll();
		//System.out.println("authors :" + authors.size());
		map.addAttribute("casetypes", casetypes);
		return "display_casetypes";
	}

	@GetMapping("addcasetype")
	public ModelAndView addCaseType() {
		return new ModelAndView("add_casetype", "casetypes", new CaseType());

	}

	@PostMapping("addcasetype")
	public String addCaseType(@ModelAttribute("casetypes") @Validated CaseType casetype, BindingResult bResult, ModelMap map) {
		//if(bResult.hasErrors()) {
		
			//	return "add_casetype";
		// }
			int rs=casetypeRepo.add(casetype);
			if(rs==0) {
				map.addAttribute("casetype",casetype);
				map.addAttribute("error_msg", "SQL Error: ");
				
				return "add_casetype";
			}else {
				return "redirect:/casetype";
			}
	}

	@GetMapping("editcasetype/{id}")
	public ModelAndView editCaseType(@PathVariable int id) {
		CaseType casetype = casetypeRepo.getById(id);
		return new ModelAndView("edit_casetype", "casetype", casetype);

	}



	@PostMapping("editcasetype")
	public String editCaseType(@ModelAttribute("casetype") @Validated CaseType casetype, BindingResult bResult, ModelMap map) {
		if(bResult.hasErrors()) {
			
			return "edit_casetype";
	}
		int rs = casetypeRepo.edit(casetype);
		if (rs == 0) {
			map.addAttribute("error_msg", "SQL Update Error");
			map.addAttribute("casetype", casetype);
			return "edit_casetype";
		} else {
			return "redirect:/casetype";
		}
	}

	@GetMapping("/deletecasetype/{id}")
	public String deleteCaseType(@PathVariable int id) {

		casetypeRepo.delete(id);
		return "redirect:/casetype";
	}

}



package boundary_of_law.Controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import boundary_of_law.models.Login;
import boundary_of_law.models.User;
import boundary_of_law.persistance.SystemUserRepo;

@Controller
public class LoginController {

    @Autowired
    private SystemUserRepo systemUserRepo;

    @GetMapping("/createlogin")
    public ModelAndView showLogin() {
        return new ModelAndView("login", "login", new Login());
    }

    @PostMapping("/createlogin")
    public String checkLogin(@ModelAttribute("login") Login login, HttpSession session, Model model) {
        User user = systemUserRepo.getByLogin(login);

        if (user != null && user.getEmail() != null && user.getPassword() != null) {
            session.setAttribute("loggedInUser", user);
            return "redirect:/systemusers";
        } else {
            model.addAttribute("error", "Invalid email or password.");
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}

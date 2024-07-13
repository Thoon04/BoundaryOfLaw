package boundary_of_law.Controllers;

import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boundary_of_law.models.User;
import boundary_of_law.persistance.SystemUserRepo;

@Controller
	public class ValidateOTPController {
	    @Autowired
	    SystemUserRepo systemUserRepo;
	    // Check OTP //

	    @PostMapping("/validateOtp")
	    public String validateOtpPost(@RequestParam("otp") int enteredOtp, HttpSession session, Model model) {

	        int storedOtp = (int) session.getAttribute("otp");

	        String email = (String) session.getAttribute("email");

	         Optional<User> userOptional = Optional.ofNullable(systemUserRepo.findByEmail(email));
	        User user = userOptional.get();
	        if (enteredOtp == storedOtp && email.equals(user.getEmail())) {
	            return "newPassword";

	        } else if (enteredOtp == storedOtp && !email.equals(user.getEmail())) {
	            model.addAttribute("message", "Invalid OTP. Please try again.");
	            return "newPassword";

	        } else {
	            model.addAttribute("message", "Invalid OTP. Please try again.");
	            return "enterOTP";
	        }
	    }

	    @GetMapping("/validateOtp")
	    public String validateOtpGet(){
	        return "enterOTP";
	    }

}
	

package boundary_of_law.Controllers;

import java.util.Random;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boundary_of_law.models.User;
import boundary_of_law.persistance.SystemUserRepo;

@Controller
public class ForgetPasswordController {

    @Autowired
    SystemUserRepo systemUserRepo;

    @Autowired
    @Qualifier("mailSender")
    private JavaMailSender javaMailSender;

    @PostMapping("/forgetPasswordPost")
    public String forgetPasswordPost(@RequestParam("email") String email, Model model, HttpSession session) {
        try {
            // Check if email exists
            User user = systemUserRepo.findByEmail(email);

            if (user != null && user.getEmail() !=null) {
                // Generate OTP
                int otpValue = generateOtp();

                // Logic to send OTP to the email
                SimpleMailMessage message = createOtpEmail(email, otpValue);
                sendOtpByEmail(message, javaMailSender);

                model.addAttribute("message", "OTP is sent to your email id");
                model.addAttribute("otp", otpValue);
                model.addAttribute("email", email);

                session.setAttribute("otp", otpValue);
                session.setAttribute("email", email);

                return "enterOTP";
            } else {
                model.addAttribute("error", "Invalid email.");
                return "forgetPassword";
            }
        } catch (Exception e) {
            model.addAttribute("error", "Failed to send OTP. Please try again.");
            return "forgetPassword";
        }
    }

    private int generateOtp() {
        Random rand = new Random();
        return 100000 + rand.nextInt(900000); // Ensure 6-digit OTP
    }

    private SimpleMailMessage createOtpEmail(String toEmail, int otpValue) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("thoonshwesintheint@gmail.com");
        message.setTo(toEmail);
        message.setSubject("Your OTP for Password Reset");
        message.setText("Your OTP is: " + otpValue);
        return message;
    }

    private void sendOtpByEmail(SimpleMailMessage message, JavaMailSender javaMailSender) {
        javaMailSender.send(message);
        System.out.println("Email sent successfully!");
    }

    @GetMapping("/enterOTP")
    public String validateOtpGet() {
        return "enterOTP";
    }

    @GetMapping("/forgetPassword")
    public String forgotPasswordGet() {
        return "forgetPassword";
    }
}

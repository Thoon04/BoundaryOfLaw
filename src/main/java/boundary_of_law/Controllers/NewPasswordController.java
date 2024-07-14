package boundary_of_law.Controllers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class NewPasswordController {
    @GetMapping("/newPassword")
    public String newPassword(HttpSession session, Model model) {
        String email = (String) session.getAttribute("email");
        if (email == null) {
            model.addAttribute("message", "Session expired. Please try again.");
            return "redirect:/forgetPassword";
        }
        return "newPassword";
    }

    @PostMapping("/newPassword")
    public String resetPassword(@RequestParam String password1, HttpSession session, RedirectAttributes redirectAttributes) {
        String email = (String) session.getAttribute("email");

        if (email != null && password1 != null && !password1.isEmpty()) {
            try {
             
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lawdb", "root", "root");
                PreparedStatement ps = con.prepareStatement("UPDATE user SET password = ? WHERE email = ?");
                ps.setString(1, password1);
                ps.setString(2, email);
                int rowCount = ps.executeUpdate();
                if (rowCount > 0) {
                    redirectAttributes.addFlashAttribute("status", "resetSuccess");
                    return "redirect:/login";
                } else {
                    redirectAttributes.addFlashAttribute("status", "resetFailed");
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                redirectAttributes.addFlashAttribute("status", "resetFailed");
            }
        }
        return "newPassword";
    }
}

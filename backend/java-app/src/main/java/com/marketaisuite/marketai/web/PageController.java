package com.marketaisuite.marketai.web;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session) {
        if (session.getAttribute("user_id") == null) {
            return "redirect:/login";
        }

        return "forward:/index.html";
    }
}

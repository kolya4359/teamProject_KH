package com.bteam.test.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bteam.test.config.auth.PrincipalDetail;
import com.bteam.test.model.User;
import com.bteam.test.model.UserDto;
import com.bteam.test.service.MailService;
import com.bteam.test.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
public class UserController {
	
	
	
	@Autowired
	private UserService userService;

	@Autowired
	private MailService mailService;
	
	//회원가입 페이지
	@GetMapping("/auth/joinForm")
	public String main() {
		return "user/joinForm";
	}
	
	
	//로그인 페이지
	@GetMapping("/auth/loginForm")
	public String login(@RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "exception", required = false) String exception,
            Model model) {
		
		model.addAttribute("error",error);
        model.addAttribute("exception",exception);
		
		return "user/loginForm";
	}
	// 마이페이지
		// 유저정보 수정 페이지
		@GetMapping("/user/mypage")
		public String userInfo(Model model, @AuthenticationPrincipal PrincipalDetail principalDetail) {
			model.addAttribute("userid", principalDetail.getUsername());
			model.addAttribute("password", principalDetail.getPassword());
			model.addAttribute("name", principalDetail.getName());
			model.addAttribute("email", principalDetail.getEmail());
			model.addAttribute("birth", principalDetail.getBirth());
			model.addAttribute("id", principalDetail.getId());

			return "/user/myPage";
		}
		
		
	
	
	//아이디 찾기
	@RequestMapping(value="/find/email", method=RequestMethod.POST)
	public String findIdByEmail(HttpServletResponse response, @RequestParam("userEmail") String email, User user , Model model) throws Exception {
		
		model.addAttribute("userId", userService.findByEmail(response, user, email));
		
		return "/user/findUser";
	}
	
	//비밀번호 찾기
	@RequestMapping(value="/find/password", method=RequestMethod.POST)
	public String findPassword(HttpServletResponse response, @RequestParam("username") String username, @RequestParam("userEmail") String email, User user, Model model) throws Exception {
		
		model.addAttribute(userService.findByIdAndEmail(response, user ,username, email));
		
		mailService.mailSend(email, username);
		
		
		return "redirect:/";
	}
	
}

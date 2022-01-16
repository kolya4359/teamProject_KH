package com.bteam.test.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.bteam.test.UserRepository;
import com.bteam.test.model.ResponseDto;
import com.bteam.test.model.User;
import com.bteam.test.model.UserDto;
import com.bteam.test.service.UserService;

import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@RestController
public class UserApiController {

	@Autowired
	private final UserService userService;
	private final UserRepository userRepository;

	@PostMapping("/auth/joinProc")
	public ResponseDto<Integer> save(@RequestBody User user) { // username, password, name, email, birth
		System.out.println("UserApiController : save 호출됨");
		userService.signUp(user);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1); // 자바오브젝트를 JSON으로 변환해서 리턴 (Jackson)
	}

	// 회원정보 수정
	@PutMapping("/userinfo/modify/{id}")
	public String userModify(@PathVariable Long id, @RequestBody UserDto userdto) {
	
		userService.update(id, userdto);
	
		return "redirect:/";
	}
	@DeleteMapping("/userinfo/modify/{id}")
	public Long userdrop(@PathVariable Long id) {
		userRepository.deleteById(id);
		return id;
	}
	

}

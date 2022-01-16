package com.bteam.test.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.bteam.test.config.auth.PrincipalDetail;
import com.bteam.test.model.Faq;
import com.bteam.test.service.FaqService;
import com.bteam.test.model.Reply;
import com.bteam.test.model.ResponseDto;
import com.bteam.test.model.UserRole;
import com.bteam.test.model.User;
import com.bteam.test.service.UserService;

@RestController
public class FaqApiController {
	
	@Autowired
	private FaqService faqService;
	
	@PostMapping("/api/faq")
	public ResponseDto<Integer> save(@RequestBody Faq faq, @AuthenticationPrincipal PrincipalDetail principal) {
		faqService.글쓰기(faq,principal.getUser());
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@DeleteMapping("/api/faq/{id}")
	public ResponseDto<Integer> deleteById(@PathVariable int id){
		faqService.글삭제하기(id);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PutMapping("/api/faq/{id}")
	public ResponseDto<Integer> update(@PathVariable int id, @RequestBody Faq faq){
		faqService.글수정하기(id,faq);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	//데이터 받을 때 컨트롤러에서 dto를 만들어서 받는게 좋다.
	@PostMapping("/api/faq/{faqId}/reply")
	public ResponseDto<Integer> replySave(@PathVariable int faqId, @RequestBody Reply reply, @AuthenticationPrincipal PrincipalDetail principal) {
		
		faqService.댓글쓰기(principal.getUser(), faqId, reply);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@DeleteMapping("/api/faq/{faqId}/reply/{replyId}")
	public ResponseDto<Integer> replyDelete(@PathVariable int replyId){
		faqService.댓글삭제(replyId);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	
}

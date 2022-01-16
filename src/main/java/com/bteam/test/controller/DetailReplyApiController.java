package com.bteam.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.bteam.test.config.auth.PrincipalDetail;
import com.bteam.test.model.DetailReply;
import com.bteam.test.model.ResponseDto;
import com.bteam.test.service.DetailReplyService;

@RestController
public class DetailReplyApiController {
	
	@Autowired
	DetailReplyService detailReplyService;
	
	@PostMapping("/detail/{titleId}/reply")
	public ResponseDto<Integer> replySave(@PathVariable String titleId, @RequestBody DetailReply reply, @AuthenticationPrincipal PrincipalDetail principal) {
		
		detailReplyService.댓글쓰기(principal.getUser(), titleId, reply);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@DeleteMapping("/detail/{titleId}/reply/{replyId}")
	public ResponseDto<Integer> replyDelete(@PathVariable Long replyId){
		
		detailReplyService.댓글삭제(replyId);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

}

package com.bteam.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bteam.test.DetailReplyRepository;
import com.bteam.test.model.DetailReply;
import com.bteam.test.model.Faq;
import com.bteam.test.model.Reply;
import com.bteam.test.model.TourData;
import com.bteam.test.model.User;

@Service
public class DetailReplyService {
	
	@Autowired
	DetailReplyRepository detailRepo;
	
	@Autowired
	ApiRepository apiRepository;
	
	@Transactional
	public void 댓글쓰기(User user, String titleid, DetailReply detailReply) {
		
		TourData tourdata = apiRepository.findById(titleid).orElseThrow(()->{
			return new IllegalArgumentException("댓글 쓰기 실패: 게시글 id를 찾을 수 없습니다.");
		});//영속화 완료
		
		detailReply.setUser(user); 
		detailReply.setTourdata(tourdata);
		
		detailRepo.save(detailReply);
	}
	
	@Transactional
	public void 댓글삭제(Long replyId) {
		detailRepo.deleteById(replyId);
	}

}

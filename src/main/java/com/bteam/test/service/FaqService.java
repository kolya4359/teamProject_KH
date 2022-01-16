package com.bteam.test.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bteam.test.model.Faq;
import com.bteam.test.model.Reply;
import com.bteam.test.model.User;
import com.bteam.test.FaqRepository;
import com.bteam.test.ReplyRepository;

@Service
public class FaqService {

	@Autowired
	private FaqRepository faqRepository;
	
	@Autowired
	private ReplyRepository replyRepository;
	
	@Transactional
	public void 글쓰기(Faq faq,User user) { //title,content
		faq.setCount(0);
		faq.setUser(user);
		faqRepository.save(faq);
	}
	
	@Transactional(readOnly = true)
	public Page<Faq> 글목록(Pageable pageable){
		return faqRepository.findAll(pageable);
	}
	
	@Transactional(readOnly = true)
	public Faq 글상세보기(int id) {
		return faqRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
				});
	}
	
	@Transactional
	public void 글삭제하기(int id) {
		System.out.println("글삭제하기 : "+id);
		faqRepository.deleteById(id);
	}
	
	@Transactional
	public void 글수정하기(int id,Faq requestFaq) {
		Faq faq = faqRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 찾기 실패: 아이디를 찾을 수 없습니다.");
				});//영속화 완료
		faq.setTitle(requestFaq.getTitle());
		faq.setContent(requestFaq.getContent());
		// 해당함수로 종료시(Service가 종료될 때) 트랜잭션이 종료굅니다. 이때 더티체킹 -자동 업데이트가 됨. db flush
	}
	
	@Transactional
	public void 댓글쓰기(User user, int faqId, Reply requestReply) {
		
		Faq faq = faqRepository.findById(faqId).orElseThrow(()->{
			return new IllegalArgumentException("댓글 쓰기 실패: 게시글 id를 찾을 수 없습니다.");
		});//영속화 완료
		
		requestReply.setUser(user);
		requestReply.setFaq(faq);
		
		replyRepository.save(requestReply);
	}
	
	@Transactional
	public void 댓글삭제(int replyId) {
		replyRepository.deleteById(replyId);
	}
}

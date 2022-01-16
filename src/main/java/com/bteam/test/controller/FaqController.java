package com.bteam.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.bteam.test.service.FaqService;
import com.bteam.test.config.auth.PrincipalDetail;

@Controller
public class FaqController {

	@Autowired
	private FaqService faqService;
	
	//@AuthenticationPrincipal PrincipalDetail principal
	@GetMapping("/faq")
	public String index(Model model,@PageableDefault(size=3,sort="id",direction=Sort.Direction.DESC)Pageable pageable) {
		model.addAttribute("faqs",faqService.글목록(pageable));
		return "index/faqindex"; //viewResolver 작동
	}
	
	@GetMapping("/faq/{id}")
	public String findByid(@PathVariable int id, Model model) {
		model.addAttribute("faq",faqService.글상세보기(id));
		return "faq/detail";
	}
	
	@GetMapping("/faq/{id}/updateForm")
	public String updateForm(@PathVariable int id, Model model) {
		model.addAttribute("faq", faqService.글상세보기(id));
		return "faq/updateForm";
	}
	
	@GetMapping("/faq/saveForm")
	public String saveForm() {
		return "faq/saveForm";
	}
}

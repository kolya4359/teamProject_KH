package com.bteam.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.bteam.test.DetailReplyRepository;
import com.bteam.test.model.DetailReply;
import com.bteam.test.model.Infodto;
import com.bteam.test.service.InfoService;


@Controller
public class InfoController {

	
	@Autowired
	InfoService infoService;
	
	@Autowired
	DetailReplyRepository detailRepo;
	
	@GetMapping("/detail/{title}")
	public String showContent(@PathVariable String title, Model model) {
		Infodto content = infoService.readContent(title);
		
		model.addAttribute("content",content);

		return "index/detail";
	}
}

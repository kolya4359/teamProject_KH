package com.bteam.test;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bteam.test.model.Reply;


public interface ReplyRepository extends JpaRepository<Reply, Integer> {

}

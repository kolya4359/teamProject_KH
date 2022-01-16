package com.bteam.test;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bteam.test.model.DetailReply;

@Repository
public interface DetailReplyRepository extends JpaRepository<DetailReply, Long>{

}

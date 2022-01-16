package com.bteam.test;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bteam.test.model.Faq;


@Repository //생략가능
public interface FaqRepository extends JpaRepository<Faq, Integer> {
}


package com.bteam.test.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
@Entity
@Table(name="tourdata")
public class TourData {
	
	@Id
	private String title;
	
	@Column
	private String address;

	@Column
	private String instruction;

	@Column
	private double latitude;

	@Column
	private double longitude;

	@Column
	private String imgpath;

	@Column
	private String thumbnailpath;
	
	@OneToMany(mappedBy="tourdata",fetch=FetchType.EAGER, cascade = CascadeType.REMOVE) //mappedBy 연관관계의 주인이 아니다(FK가 아니다) DB칼럼 만들지마시오.
	@JsonIgnoreProperties({"tourdata"})
	@OrderBy("id desc")
	private List<DetailReply> replys;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="userid")
	private User user;
}

package com.bteam.test.model;

import java.util.List;

import lombok.Data;

@Data
public class Infodto {
	
	private String title;
	private String address;
	private String instruction;
	private double latitude;
	private double longitude;
	private String imgpath;
	private List<DetailReply> replys;

}

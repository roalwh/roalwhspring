package com.example.test1.model;

import lombok.Data;

@Data
public class Comment {
	private int commentNo;
	private int boardNo;
	private String id;
	private String content;
	private String cdatetime;
	private String udatetime;
	private String delYn;
	private String commentReno;
}

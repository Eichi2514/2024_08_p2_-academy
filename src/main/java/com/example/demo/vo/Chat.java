package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Chat {

	private int id;
	private String regDate;
	private int memberId;
	private String body;
	
	private String extra__writer;
}
package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Scoreboard {

	private int id;
	private String regDate;
	private int memberId;
	private int floor;
	private int room;
		
	private String extra__user;	
}
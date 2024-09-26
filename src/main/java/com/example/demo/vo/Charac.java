package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Charac {

	private int id;
	private String regDate;
	private String updateDate;
	private int memberId;
	private int floor;
	private int room;
	private int hp;
	private int power;
	private int speed;
	private int weaponId;
	private int clearTime;
	
	private String extra__weapon;		
}
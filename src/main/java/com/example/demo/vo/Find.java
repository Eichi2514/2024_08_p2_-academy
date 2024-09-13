package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Find {

	private int id;
	private String img;
	private String updateDate;
	private int memberId;
	private int weaponId;		
}
package com.example.demo.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface WeaponRepository {	
	@Select("""
			SELECT img
			FROM weapon
            WHERE id = #{weaponId} 		
			""")
	public String weaponImg(int weaponId);
	
}
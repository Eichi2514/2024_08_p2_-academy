package com.example.demo.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.Member;

@Mapper
public interface WeaponRepository {

	@Select("""
			SELECT img
			FROM weapon
            WHERE id = #{num} 		
			""")
	public String randomWeapon(int num);
}
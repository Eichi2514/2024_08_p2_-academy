package com.example.demo.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.Member;

@Mapper
public interface MobRepository {

	@Select("""
			SELECT img
			FROM mob
            WHERE id = #{floor} 		
			""")
	public String mobData(int floor);
}
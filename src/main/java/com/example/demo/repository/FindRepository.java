package com.example.demo.repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.Find;

@Mapper
public interface FindRepository {	
	@Select("""
			SELECT IF(COUNT(weaponId) > 0, weaponId, 0)
            FROM find
            WHERE memberId = #{memberId} AND weaponId = #{weaponId};  		
			""")
	public int weaponFind(int memberId, int weaponId);

	@Select("""
			SELECT W.*, F.*
            FROM weapon W
            LEFT JOIN find F
            ON W.id = F.weaponId
            WHERE F.memberId = #{loginedMemberId};
			""")
	public ArrayList<Find> weaponImgs(int loginedMemberId);
}
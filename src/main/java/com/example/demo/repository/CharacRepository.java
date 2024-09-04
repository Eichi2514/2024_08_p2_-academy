package com.example.demo.repository;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.Charac;
@Mapper
public interface CharacRepository {
		

	@Insert("""
			INSERT INTO charac 
			SET regDate = NOW(), 
			updateDate = NOW(),
			memberId = #{loginedMemberId}
			""")    
	public void characCreation(int loginedMemberId);

	@Select("""
			SELECT C.*, W.img extra__weapon
            FROM charac C
            INNER JOIN weapon W
            ON C.weaponId = W.id
            WHERE memberId = #{loginedMemberId}			
				""")
	public Charac characChack(int loginedMemberId);

	@Update("""
			UPDATE charac
			SET updateDate = NOW(),
			hp = #{hp},
			`floor` = #{floor},
			room = #{room},
			weaponId = #{weaponId}
			WHERE memberId = #{memberId}
			""")
	public void update(int hp, int floor, int room, int weaponId, int memberId);		
}
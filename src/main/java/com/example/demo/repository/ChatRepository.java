package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.Chat;

@Mapper
public interface ChatRepository {

	@Select("""
			SELECT C.*, M.nickname extra__writer
			FROM chat C
			INNER JOIN `member` M
			ON C.memberId = M.id
			""")	
	public List<Chat> chatList();

	@Insert("""
			INSERT INTO chat
			SET regDate = NOW(),
			memberId = #{loginedMemberId},
			`body` = #{body};
			""")
	public void write(int loginedMemberId, String body);

	@Select("""
			SELECT C.*, M.nickname extra__writer
			FROM chat C
			INNER JOIN `member` M
			ON C.memberId = M.id
			ORDER BY C.id
			DESC
			LIMIT 1
			""")
	public Chat update();

	
}
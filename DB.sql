DROP DATABASE IF EXISTS `24_08_p2`;
CREATE DATABASE `24_08_p2`;
USE `24_08_p2`;

CREATE TABLE `member`(
      id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
      regDate DATETIME NOT NULL,
      updateDate DATETIME NOT NULL,
      loginId CHAR(30) NOT NULL,
      loginPw CHAR(100) NOT NULL,
      `authLevel` SMALLINT(2) UNSIGNED DEFAULT 3 COMMENT '권한 레벨 (3=일반, 7=관리자)',
      `name` CHAR(20) NOT NULL,
      nickname CHAR(20) NOT NULL,
      gender TINYINT(1) UNSIGNED NOT NULL COMMENT '성별 (0=여자, 1=남자)',
      delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '탈퇴 여부 (0=탈퇴 전, 1=탈퇴 후)',
      delDate DATETIME COMMENT '탈퇴 날짜'
);

CREATE TABLE `charac`(
      id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
      regDate DATETIME NOT NULL,
      updateDate DATETIME NOT NULL,
      memberId INT(10) NOT NULL,
      `floor` INT(10) NOT NULL DEFAULT 0 COMMENT '캐릭터 도달 층 수',
      room INT(10) NOT NULL DEFAULT 0 COMMENT '캐릭터 도달 층 수',
      hp INT(10) NOT NULL DEFAULT 1 COMMENT '생명력',
      weapon TEXT NOT NULL DEFAULT "" COMMENT '무기',
      weaponNumber INT(10) NOT NULL DEFAULT 1 COMMENT '무기번호'
);

## 테스트 회원 생성
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'asd',
loginPw = 'asd',
`authLevel` = 7,
`name` = '관리자',
nickname = '관리자',
gender = 1;

INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'qwe',
loginPw = 'qwe',
`name` = '회원',
nickname = '회원',
gender = 0;

SELECT *
FROM `member`;
DROP DATABASE IF EXISTS `24_08_p2`;
CREATE DATABASE `24_08_p2`;
USE `24_08_p2`;

CREATE TABLE `member`(
      id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
      regDate DATETIME NOT NULL,
      updateDate DATETIME NOT NULL,
      loginId CHAR(30) NOT NULL,
      loginPw CHAR(100) NOT NULL,
      authLevel SMALLINT(2) UNSIGNED DEFAULT 3 COMMENT '권한 레벨 (3=일반, 7=관리자)',
      `name` CHAR(20) NOT NULL,
      nickname CHAR(20) NOT NULL,
      gender TINYINT(1) UNSIGNED NOT NULL COMMENT '성별 (0=여자, 1=남자)',
      delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '탈퇴 여부 (0=탈퇴 전, 1=탈퇴 후)',
      delDate DATETIME COMMENT '탈퇴 날짜'
);

CREATE TABLE charac(
      id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
      regDate DATETIME NOT NULL,
      updateDate DATETIME NOT NULL,
      memberId INT(10) NOT NULL,
      `floor` INT(10) NOT NULL DEFAULT 1 COMMENT '캐릭터 도달 층 수',
      room INT(10) NOT NULL DEFAULT 0 COMMENT '캐릭터 도달 방 번호',
      hp INT(10) NOT NULL DEFAULT 3 COMMENT '생명력',      
      weaponId INT(10) NOT NULL DEFAULT 1 COMMENT '무기번호'
);

CREATE TABLE weapon(
      id INT(10) UNSIGNED NOT NULL PRIMARY KEY,
      img TEXT NOT NULL
);

CREATE TABLE scoreboard(
      id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
      regDate DATETIME NOT NULL,
      memberId INT(10) NOT NULL,
      `floor` INT(10) NOT NULL COMMENT '캐릭터 도달 층 수',
      room INT(10) NOT NULL COMMENT '캐릭터 도달 방 번호'      
);

CREATE TABLE mob(
      id INT(10) UNSIGNED NOT NULL PRIMARY KEY,
      img TEXT NOT NULL
);

## 테스트 회원 생성
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'asd',
loginPw = 'asd',
authLevel = 7,
`name` = '관리자',
nickname = '관리자',
gender = 1;

INSERT INTO `member`
SET regDate = '2024-09-05 13:59:06',
updateDate = '2024-09-05 13:59:06',
loginId = 'asdf',
loginPw = 'asdf',
`name` = 'asdf',
nickname = 'asdf',
gender = 1;

## 테스트 캐릭터 생성
INSERT INTO charac 
SET regDate = NOW(),
updateDate = NOW(),
hp = 1000000000, 
memberId = 1;

## 테스트 기록 생성
INSERT INTO scoreboard
SET regDate = '2024-09-05 13:59:52',
memberId = 2,
`floor` = 1,
room = 4;

INSERT INTO scoreboard
SET regDate = '2024-09-05 14:35:58',
memberId = 1,
`floor` = 7,
room = 1;

## INSERT INTO scoreboard
## SET regDate = NOW(),
## memberId = 1,
## `floor` = 1,
## room = 1;

## INSERT INTO scoreboard
## SET regDate = NOW(),
## memberId = 2,
## `floor` = 3,
## room = 2;

## INSERT INTO scoreboard
## SET regDate = NOW(),
## memberId = 1,
## `floor` = 99,
## room = 5;

SELECT *
FROM `member`;

SELECT *
FROM charac;

SELECT *
FROM weapon;

SELECT *
FROM scoreboard;

SELECT *
FROM mob;

INSERT INTO weapon SET id = 1, img = "https://github.com/user-attachments/assets/c4959d84-7072-44dc-9d2b-77399066448c";
INSERT INTO weapon SET id = 2, img = "https://github.com/user-attachments/assets/69c14b43-19b2-4d02-82b4-539353cfd1dc";
INSERT INTO weapon SET id = 3, img = "https://github.com/user-attachments/assets/cda1e10a-5f17-4d5a-8f86-ccfe0007dfef";
INSERT INTO weapon SET id = 4, img = "https://github.com/user-attachments/assets/80856b84-4971-4401-a57d-8f37562711dd";
INSERT INTO weapon SET id = 5, img = "https://github.com/user-attachments/assets/d82d6b9b-8ea0-4b89-a19b-792aee0a8bd3";
INSERT INTO weapon SET id = 6, img = "https://github.com/user-attachments/assets/f0827f0c-41e6-45b4-907e-3bc6a806d45c";
INSERT INTO weapon SET id = 7, img = "https://github.com/user-attachments/assets/7455a6ee-b319-44a7-9052-a0110205b2d7";
INSERT INTO weapon SET id = 8, img = "https://github.com/user-attachments/assets/1a4d573e-752a-4801-b2e6-284ad76f3b60";
INSERT INTO weapon SET id = 9, img = "https://github.com/user-attachments/assets/2225ee6a-f091-4866-a4f2-a21e3b4e3743";

INSERT INTO mob SET id = 1, img = "https://github.com/user-attachments/assets/71e26463-fd7c-46d7-9364-273a363ac839";
INSERT INTO mob SET id = 2, img = "https://github.com/user-attachments/assets/76d8bc9f-d814-4f60-b99f-e6688a60acd5";
INSERT INTO mob SET id = 3, img = "https://github.com/user-attachments/assets/b7a6c561-9176-4f1e-98c5-0d6723bcca2b";
INSERT INTO mob SET id = 4, img = "https://github.com/user-attachments/assets/cfbe7f09-078b-4056-82f9-2f70983d0f52";
INSERT INTO mob SET id = 5, img = "https://github.com/user-attachments/assets/0bc0f092-e535-4c6d-8631-07c87e80014f";
INSERT INTO mob SET id = 6, img = "https://github.com/user-attachments/assets/397fa4af-9a52-48d1-8bd0-629f575198c2";

SELECT C.*, W.img extra__weapon
FROM charac C
INNER JOIN weapon W
ON C.weaponId = W.id
WHERE memberId = 1;

SELECT S.*, M.nickname extra__user
FROM scoreboard S
LEFT JOIN `member` M
ON m.id = S.memberId
ORDER BY `floor` DESC, room DESC, regDate ASC
LIMIT 0, 3;

## 스코어 테스트 데이터 랜덤 생성
## INSERT INTO scoreboard
## SET regDate = NOW(),
## memberId = FLOOR ((RAND()*2)+1),
## `floor` = FLOOR ((RAND()*99)+1),
## room = FLOOR ((RAND()*5)+1);
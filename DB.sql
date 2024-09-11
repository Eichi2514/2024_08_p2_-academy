
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
      delDate DATETIME COMMENT '탈퇴 날짜',
      `floor` INT(10) NOT NULL DEFAULT 0 COMMENT '캐릭터 도달 층 수'
);

CREATE TABLE charac(
      id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
      regDate DATETIME NOT NULL,
      updateDate DATETIME NOT NULL,
      memberId INT(10) NOT NULL,
      `floor` INT(10) NOT NULL DEFAULT 1 COMMENT '캐릭터 도달 층 수',
      room INT(10) NOT NULL DEFAULT 0 COMMENT '캐릭터 도달 방 번호',
      hp INT(10) NOT NULL DEFAULT 1 COMMENT '생명력',      
      weaponId INT(10) NOT NULL DEFAULT 1 COMMENT '무기번호'
);

CREATE TABLE weapon(
      id INT(10) UNSIGNED NOT NULL PRIMARY KEY,
      img TEXT NOT NULL
);

CREATE TABLE weaponClear(
      id INT(10) UNSIGNED NOT NULL PRIMARY KEY,
      memberId INT(10) NOT NULL,
      weaponId INT(10) NOT NULL DEFAULT 0 COMMENT '무기번호'
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
hp = 1, 
memberId = 1,
weaponId = 68;

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

## 무기 이미지 URL
INSERT INTO weapon SET id = 1, img = "https://github.com/user-attachments/assets/d3b5fb90-b21e-42a3-8964-a866132ace38";
INSERT INTO weapon SET id = 2, img = "https://github.com/user-attachments/assets/a75eb20d-7588-42c0-b517-c5cfa38293a1";
INSERT INTO weapon SET id = 3, img = "https://github.com/user-attachments/assets/bab07e9b-6bcc-4cc6-9782-d2e5491ed42e";
INSERT INTO weapon SET id = 4, img = "https://github.com/user-attachments/assets/351cb011-e0d8-4b97-ade0-e591aecd63f2";
INSERT INTO weapon SET id = 5, img = "https://github.com/user-attachments/assets/df28a7ef-027e-4b9c-9dfe-5333945f79b4";
INSERT INTO weapon SET id = 6, img = "https://github.com/user-attachments/assets/402dde9c-aeba-4543-a5a2-77d95ec25bba";
INSERT INTO weapon SET id = 7, img = "https://github.com/user-attachments/assets/c9258612-c30a-4e6b-8f43-d63518485e72";
INSERT INTO weapon SET id = 8, img = "https://github.com/user-attachments/assets/f26c953d-9444-48fb-b21a-6f5e320b7b6f";
INSERT INTO weapon SET id = 9, img = "https://github.com/user-attachments/assets/ead726f4-fa9f-4fd8-935a-0c665b173069";
INSERT INTO weapon SET id = 10, img = "https://github.com/user-attachments/assets/a6dcabfb-34c7-41bc-ad0e-94228de15519";

INSERT INTO weapon SET id = 11, img = "https://github.com/user-attachments/assets/2e6e4dc2-3b84-4521-b9c1-7eb469d8d861";
INSERT INTO weapon SET id = 12, img = "https://github.com/user-attachments/assets/44dc4242-4cc1-4bd9-bf1d-501625f79981";
INSERT INTO weapon SET id = 13, img = "https://github.com/user-attachments/assets/e0cd5573-f9ae-4a94-98b8-933b0317f6cd";
INSERT INTO weapon SET id = 14, img = "https://github.com/user-attachments/assets/221e2115-c9fe-4777-90de-b690b272268b";
INSERT INTO weapon SET id = 15, img = "https://github.com/user-attachments/assets/90731980-1fc7-49cb-8a99-f103082727ac";
INSERT INTO weapon SET id = 16, img = "https://github.com/user-attachments/assets/74c267ea-fa2f-494b-923e-fd8728e7346c";
INSERT INTO weapon SET id = 17, img = "https://github.com/user-attachments/assets/e3ac88c9-4c23-4f76-8a66-4780e32afcf7";
INSERT INTO weapon SET id = 18, img = "https://github.com/user-attachments/assets/a7f55691-d69a-4088-82c3-d0c437a712a0";
INSERT INTO weapon SET id = 19, img = "https://github.com/user-attachments/assets/6435b887-2b87-4367-a088-28e13d0a9b59";
INSERT INTO weapon SET id = 20, img = "https://github.com/user-attachments/assets/fceed0f8-5b68-4263-b9f2-63d9dcb9eaa8";

INSERT INTO weapon SET id = 21, img = "https://github.com/user-attachments/assets/a08e3986-994d-4449-adb1-10e575714188";
INSERT INTO weapon SET id = 22, img = "https://github.com/user-attachments/assets/e8f0f8ed-0d14-4bed-8f14-d58a6ce6c537";
INSERT INTO weapon SET id = 23, img = "https://github.com/user-attachments/assets/5f99f1a8-cce0-43f4-9bd0-b01aff7ed337";
INSERT INTO weapon SET id = 24, img = "https://github.com/user-attachments/assets/b007b848-66f2-404f-9452-e4ca17e4ebf2";
INSERT INTO weapon SET id = 25, img = "https://github.com/user-attachments/assets/c6d3d271-dc7c-4cc1-908b-1960ece2ed80";
INSERT INTO weapon SET id = 26, img = "https://github.com/user-attachments/assets/157e3ef6-ca2b-47f8-96ba-4a4451534fec";
INSERT INTO weapon SET id = 27, img = "https://github.com/user-attachments/assets/40a08051-7223-4472-ab42-42bdbfeca35c";
INSERT INTO weapon SET id = 28, img = "https://github.com/user-attachments/assets/427ce5f1-bca2-430d-9c88-45db15db9c1e";
INSERT INTO weapon SET id = 29, img = "https://github.com/user-attachments/assets/d3e44839-8d46-4c0f-9e26-169bab080fdd";
INSERT INTO weapon SET id = 30, img = "https://github.com/user-attachments/assets/1afae587-dff3-42dd-a663-6730f5766187";

INSERT INTO weapon SET id = 31, img = "https://github.com/user-attachments/assets/a114d57e-9995-4036-93be-e73087b93dee";
INSERT INTO weapon SET id = 32, img = "https://github.com/user-attachments/assets/fefa8e4d-6ce4-4258-9988-c6bee58defa6";
INSERT INTO weapon SET id = 33, img = "https://github.com/user-attachments/assets/44fc98a6-87f8-4444-b6af-6fb31c513ed9";
INSERT INTO weapon SET id = 34, img = "https://github.com/user-attachments/assets/2de1f608-83ba-42ad-b0b1-8ac51dea567a";
INSERT INTO weapon SET id = 35, img = "https://github.com/user-attachments/assets/a8369e91-a67f-44f0-9c4a-ef8fbb8cfe2a";
INSERT INTO weapon SET id = 36, img = "https://github.com/user-attachments/assets/388af076-05e8-452f-a501-a56f64c992c9";
INSERT INTO weapon SET id = 37, img = "https://github.com/user-attachments/assets/96270c25-7a7b-4086-ac06-5634555b70ef";
INSERT INTO weapon SET id = 38, img = "https://github.com/user-attachments/assets/4db8e897-789e-476f-9cc5-120d740c5d2e";
INSERT INTO weapon SET id = 39, img = "https://github.com/user-attachments/assets/87a96719-bbac-410c-8a33-d7f67d39a2a2";
INSERT INTO weapon SET id = 40, img = "https://github.com/user-attachments/assets/4c81b6d8-1ab6-41e3-99e8-e289eb7510de";

INSERT INTO weapon SET id = 41, img = "https://github.com/user-attachments/assets/34b8096b-643c-4323-adb9-384198f35a05";
INSERT INTO weapon SET id = 42, img = "https://github.com/user-attachments/assets/e745c414-919e-45a0-8ee8-b6708c677c97";
INSERT INTO weapon SET id = 43, img = "https://github.com/user-attachments/assets/98c2a891-0148-4b10-8ce8-1509fecdb511";
INSERT INTO weapon SET id = 44, img = "https://github.com/user-attachments/assets/417ceca3-7c5a-4b46-b7ba-597320a7280b";
INSERT INTO weapon SET id = 45, img = "https://github.com/user-attachments/assets/076ae1bc-5a66-4db3-be82-6f22e0b52155";
INSERT INTO weapon SET id = 46, img = "https://github.com/user-attachments/assets/c5b27034-7754-4a7c-b212-67bb919e60c1";
INSERT INTO weapon SET id = 47, img = "https://github.com/user-attachments/assets/6e8c1158-10dd-4769-8d3f-27d0df7e1ac6";
INSERT INTO weapon SET id = 48, img = "https://github.com/user-attachments/assets/d24b5a94-a1dc-4eea-adaf-78efea4fede6";
INSERT INTO weapon SET id = 49, img = "https://github.com/user-attachments/assets/7b8523d2-e443-44fc-9f79-dbebcf385b29";
INSERT INTO weapon SET id = 50, img = "https://github.com/user-attachments/assets/2ea0d667-6c8b-42c2-9eac-435e19422256";

INSERT INTO weapon SET id = 51, img = "https://github.com/user-attachments/assets/330ad6aa-ead1-485b-900e-dea99d69abbc";
INSERT INTO weapon SET id = 52, img = "https://github.com/user-attachments/assets/4ba220d2-1c7f-4f84-bb1e-bc5eb8b4f531";
INSERT INTO weapon SET id = 53, img = "https://github.com/user-attachments/assets/791c3025-5ee3-4528-8cc2-8bbe8daf4bc0";
INSERT INTO weapon SET id = 54, img = "https://github.com/user-attachments/assets/1dd703a6-d7be-48ad-8eec-11960337c59c";
INSERT INTO weapon SET id = 55, img = "https://github.com/user-attachments/assets/87660691-5b05-427a-9471-94af0105d66d";
INSERT INTO weapon SET id = 56, img = "https://github.com/user-attachments/assets/c1776b21-dae8-4890-a91c-c93198a28d2a";
INSERT INTO weapon SET id = 57, img = "https://github.com/user-attachments/assets/03def50a-b4a8-4ccc-80de-e9f570d03dc5";
INSERT INTO weapon SET id = 58, img = "https://github.com/user-attachments/assets/5b0aa8ce-90bf-4a83-b498-f3671aa4d4ff";
INSERT INTO weapon SET id = 59, img = "https://github.com/user-attachments/assets/3e3ebf0f-e700-4a6f-91f5-ffbf9f16d69f";
INSERT INTO weapon SET id = 60, img = "https://github.com/user-attachments/assets/383a1c05-7a15-4974-8842-a4f0d3f3b747";

INSERT INTO weapon SET id = 61, img = "https://github.com/user-attachments/assets/98a45b38-4cb3-4ee4-b8f7-28205ff39cb6";
INSERT INTO weapon SET id = 62, img = "https://github.com/user-attachments/assets/ca527de8-3ca6-44bb-9845-625e9f30ab89";
INSERT INTO weapon SET id = 63, img = "https://github.com/user-attachments/assets/91200c6c-bd4d-44eb-98df-96a7af967552";
INSERT INTO weapon SET id = 64, img = "https://github.com/user-attachments/assets/7403b724-19d1-49bf-9781-f97ac6936d68";
INSERT INTO weapon SET id = 65, img = "https://github.com/user-attachments/assets/eafa86a5-ff3c-4a3d-86e9-8f485c4905e1";
INSERT INTO weapon SET id = 66, img = "https://github.com/user-attachments/assets/fd1692a4-c906-4f24-b47d-1e2ac54fed56";
INSERT INTO weapon SET id = 67, img = "https://github.com/user-attachments/assets/f4621a93-e6db-4003-9e49-02fe7543491f";
INSERT INTO weapon SET id = 68, img = "https://github.com/user-attachments/assets/8f9df90b-6e2d-4304-9649-941ef896fa9e";
INSERT INTO weapon SET id = 69, img = "https://github.com/user-attachments/assets/f531f906-2147-45b5-8af9-e0877201552c";
INSERT INTO weapon SET id = 70, img = "https://github.com/user-attachments/assets/dcc3fdaa-fa09-42a9-a929-3e7904925b41";

## 몬스터 이미지 URL
INSERT INTO mob SET id = 1, img = "https://github.com/user-attachments/assets/2ab0ec46-1847-4c87-9b6c-b485ffd5bcc0";
INSERT INTO mob SET id = 2, img = "https://github.com/user-attachments/assets/76d8bc9f-d814-4f60-b99f-e6688a60acd5";
INSERT INTO mob SET id = 3, img = "https://github.com/user-attachments/assets/b7a6c561-9176-4f1e-98c5-0d6723bcca2b";
INSERT INTO mob SET id = 4, img = "https://github.com/user-attachments/assets/49a90ef1-1246-4a74-933e-b78e180e2f30";
INSERT INTO mob SET id = 5, img = "https://github.com/user-attachments/assets/34ce9a88-ab95-45a8-956b-a6c8ee129674";
INSERT INTO mob SET id = 6, img = "https://github.com/user-attachments/assets/1314824d-d8a6-44f2-9672-ba5a0e7f3d6c";
INSERT INTO mob SET id = 7, img = "https://github.com/user-attachments/assets/c5004b20-a313-41cd-b012-33c91f271664";
INSERT INTO mob SET id = 8, img = "https://github.com/user-attachments/assets/d7afdd47-5dfe-4824-b456-841439908a6b";
INSERT INTO mob SET id = 9, img = "https://github.com/user-attachments/assets/b39165ea-6d79-434c-a885-dc7aca00ac7a";
INSERT INTO mob SET id = 10, img = "https://github.com/user-attachments/assets/11b950e4-9387-4547-8439-cc68568ee4d4";

INSERT INTO mob SET id = 11, img = "https://github.com/user-attachments/assets/0814b836-a0a2-4a26-8f1e-caafee604a3b";
INSERT INTO mob SET id = 12, img = "https://github.com/user-attachments/assets/30d1131c-5db0-4abb-97a1-b5bb9127f19d";
INSERT INTO mob SET id = 13, img = "https://github.com/user-attachments/assets/b43717db-90e0-49cb-a80f-5d9144e8555d";
INSERT INTO mob SET id = 14, img = "https://github.com/user-attachments/assets/6a623aaa-ebf6-4b76-b55b-cc4a80576060";
INSERT INTO mob SET id = 15, img = "https://github.com/user-attachments/assets/7765f401-da7e-4d07-9ce2-a565e92a6651";
INSERT INTO mob SET id = 16, img = "https://github.com/user-attachments/assets/80eb8427-67d6-41bb-831e-9fc95e0dc718";
INSERT INTO mob SET id = 17, img = "https://github.com/user-attachments/assets/9c5464fa-5de4-475a-a601-8313e9d4070c";
INSERT INTO mob SET id = 18, img = "https://github.com/user-attachments/assets/b86834e5-65d3-4e7a-91b0-96cf616dc0c1";
INSERT INTO mob SET id = 19, img = "https://github.com/user-attachments/assets/24af62fa-4b25-4db8-83ca-edcd8b2a1cdd";
INSERT INTO mob SET id = 20, img = "https://github.com/user-attachments/assets/1af80f91-f449-45f0-8553-0914dfa0e9a3";

INSERT INTO mob SET id = 21, img = "https://github.com/user-attachments/assets/efc773bc-aa2d-4586-baa1-3cc313d2a059";
INSERT INTO mob SET id = 22, img = "https://github.com/user-attachments/assets/05ca3139-c237-4110-86fa-ec1797db2d96";
INSERT INTO mob SET id = 23, img = "https://github.com/user-attachments/assets/d120300e-a485-45b4-b4f0-e833092fe7a5";
INSERT INTO mob SET id = 24, img = "https://github.com/user-attachments/assets/1c76742c-b8c8-4985-ac61-1ed71152ba6d";
INSERT INTO mob SET id = 25, img = "https://github.com/user-attachments/assets/76d03e1c-9456-4edc-97be-2dbe41ef2ab0";
INSERT INTO mob SET id = 26, img = "https://github.com/user-attachments/assets/5ee073e4-e111-4712-aea9-d07c4e00cf13";
INSERT INTO mob SET id = 27, img = "https://github.com/user-attachments/assets/3760b544-5e2b-4c11-ac17-417c81dfe4f2";
INSERT INTO mob SET id = 28, img = "https://github.com/user-attachments/assets/c711a2ae-ba08-431d-9695-bd198f19f0e0";
INSERT INTO mob SET id = 29, img = "https://github.com/user-attachments/assets/064a8937-beb2-4dee-8ae5-ae4dd5fe6c24";
INSERT INTO mob SET id = 30, img = "https://github.com/user-attachments/assets/136cda85-bf27-4d0d-8e79-5fbe36b7ac1f";

INSERT INTO mob SET id = 31, img = "https://github.com/user-attachments/assets/cfbe7f09-078b-4056-82f9-2f70983d0f52";
INSERT INTO mob SET id = 32, img = "https://github.com/user-attachments/assets/0bc0f092-e535-4c6d-8631-07c87e80014f";
INSERT INTO mob SET id = 33, img = "https://github.com/user-attachments/assets/397fa4af-9a52-48d1-8bd0-629f575198c2";
INSERT INTO mob SET id = 34, img = "https://github.com/user-attachments/assets/e426c503-1da8-4ad1-865a-a4fb6b9db70c";
INSERT INTO mob SET id = 35, img = "https://github.com/user-attachments/assets/e815cb6a-6778-4110-9934-9a64f3174b98";
INSERT INTO mob SET id = 36, img = "https://github.com/user-attachments/assets/75270bfd-b910-4e23-9e3a-b71af9cb0761";
INSERT INTO mob SET id = 37, img = "https://github.com/user-attachments/assets/0df7b7a3-6625-4485-b3bc-646992ff0641";
INSERT INTO mob SET id = 38, img = "https://github.com/user-attachments/assets/13d39b53-ee46-461d-a57d-06d54b5bb6f2";
INSERT INTO mob SET id = 39, img = "https://github.com/user-attachments/assets/f6be058b-d91c-46a7-9eac-cf168701c133";
INSERT INTO mob SET id = 40, img = "https://github.com/user-attachments/assets/fed7ffa9-3a4e-4aef-b6dd-40b715089f21";

INSERT INTO mob SET id = 41, img = "https://github.com/user-attachments/assets/2672c70c-8d37-46de-acba-e9b1c2f4fbfc";
INSERT INTO mob SET id = 42, img = "https://github.com/user-attachments/assets/1a25b242-de00-4b05-8bb8-47901f9e15b8";
INSERT INTO mob SET id = 43, img = "https://github.com/user-attachments/assets/923bf658-6ded-439f-80a9-173689429f47";
INSERT INTO mob SET id = 44, img = "https://github.com/user-attachments/assets/f7ac2d6e-1ae5-4b0e-988c-b1b7471f312a";
INSERT INTO mob SET id = 45, img = "https://github.com/user-attachments/assets/50a96d00-65d3-422c-8ad0-01aef2c29ae7";
INSERT INTO mob SET id = 46, img = "https://github.com/user-attachments/assets/648819e7-cbdb-43a3-a1dc-3bac31332dfc";
INSERT INTO mob SET id = 47, img = "https://github.com/user-attachments/assets/e3d332b0-4a6c-473f-b6ac-0ade6db763aa";
INSERT INTO mob SET id = 48, img = "https://github.com/user-attachments/assets/3aa893dd-fe2e-440c-a114-70d1290119f3";
INSERT INTO mob SET id = 49, img = "https://github.com/user-attachments/assets/0c363b9c-6048-4e07-b304-d1a0283fb35b";
INSERT INTO mob SET id = 50, img = "https://github.com/user-attachments/assets/66b9b527-566c-4a76-8a1b-3c7be2c695ef";

INSERT INTO mob SET id = 51, img = "https://github.com/user-attachments/assets/b9dac1d9-afc9-4ce8-a6df-1c945dbc68db";
INSERT INTO mob SET id = 52, img = "https://github.com/user-attachments/assets/53fd6e00-c519-41e2-adc1-3d848d34f3a7";
INSERT INTO mob SET id = 53, img = "https://github.com/user-attachments/assets/1f52c6f6-40e8-48b6-907e-4e64b8907a27";

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

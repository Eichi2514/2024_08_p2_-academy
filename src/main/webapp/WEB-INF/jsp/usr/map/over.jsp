<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="게임 오버 : ${param.stage}"></c:set>

<%@ include file="../common/ingame_head.jspf"%>

<!-- p2 게임오버화면 -->
<img class="bg_img"
	src="https://github.com/user-attachments/assets/6189d3bf-ab54-4bc9-acbb-42b964b6ecb3"
	alt="" />
<div class="over absolute z-10">
	<a class="over_bt absolute" href="../home/main">GAME OVER</a>
</div>

<%@ include file="../common/foot.jspf"%>
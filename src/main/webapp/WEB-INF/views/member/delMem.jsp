<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 삭제</title>

<!-- css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="./css/member/findid.css" type="text/css">

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	function check() {
		if ($.trim($("#userPw").val()) == "") {
			alert("비밀번호를 입력하세요.");
			$("#userPw").val("").focus();
			return false;
		}
	}
</script>
</head>
<body class="d-flex align-items-center py-4 bg-body-tertiary">
	<main class="form-findid w-500 m-auto">
		<form method="post" action="delCheckOk.do" onsubmit="return check()">
			<br> <img src="./images/logo.png" alt="Logo" width="100px" height="40px"
					onclick="location.href='home.do'" style="cursor: pointer;">
			<br> <br>
			<h1 class="h4 mb-2">
				<b>오브리</b>&nbsp; 회원 탈퇴
			</h1>
			<br>
			<h2 class="h6 mb-2"><b>"&nbsp;정말 탈퇴하시겠습니까? "</b></h2>
			<br>
			<h2 class="h6 mb-3">
				탈퇴를 원하시면 마지막으로<br>비밀번호를 인증해주시기 바랍니다.
			</h2>

			<div class="row mb-3" hidden>
				<label for="userId" class="form-label mb-0" align="left">아이디</label>
				<div class="row mb-0 g-1 align-items-center">
					<div class="col-9 mb-1">
						<input type="text" class="form-control" id="userId" name="userId"
							value="${userId}" readonly>
					</div>
				</div>
			</div>

			<div class="form-floating">
				<input type="password" class="form-control" id="userPw"
					name="userPw" placeholder="pw"> <label for="userPw">비밀번호</label>
			</div>

			<button class="btn w-100 pr-100 fw-bold" type="submit">확인</button>
		</form>

		<p class="mt-5 mb-3 text-body-secondary" align="center"
			style="font-size: 80%">&copy; 2023. 1조</p>
	</main>
</body>
</html>
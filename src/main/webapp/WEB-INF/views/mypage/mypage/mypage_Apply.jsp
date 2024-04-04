<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ include file="../layout/header.jsp"%>

<head>
<link href="${path}/css/mypage/mypage.css" rel="stylesheet" />
<link href="${path}/css/mypage/mypage_jobBoard_manage.css" rel="stylesheet" />
			
<%-- <script src="${path}/js/mypage/mypageShift.js" /> --%>
	
<script>
	function changePage() {
		var select = document.getElementById("my_manage_option_select");
		var selectedValue = select.options[select.selectedIndex].value;

		if (selectedValue === "applyStatus_main") {
			window.location.href = "mypage_Apply.do";
		} else if (selectedValue === "recruitStatus_main") {
			window.location.href = "mypage_JobBoard.do";
		}
	}
</script>

<!-- 쪽지 알림 -->
<script type="text/javascript">
	var socket = null;
	var sock = new SockJS("/our-websocket");
	
	function connect() {
		socket = sock;
		
		sock.onopen = function() {
			console.log("connection opened.");
		};
		
		sock.onmessage = function(e) {
			var split
		}
	}
</script>
			
</head>


<div id="wrap">
	<div id="my_main_wrap">
		<div class="mypage">
			<p class="mypage_title">My Page</p>

			<div class="my_main_info">
				<div class="my_main_account">
					<c:forEach var="userInfoVOs" items="${infoAllDto.userInfoVOs}">
						<div class="my_main_img"></div>
						<div class="my_main_acc">
							<p class="my_main_name">${userInfoVOs.userName}</p>
							<p class="my_main_call">${userInfoVOs.userPhone}</p>
							<p class="my_main_email">${userInfoVOs.userEmail}</p>
						</div>
						<div class="my_main_acc_setting">
							<button>
								<a href="editCheck.do">계정 설정하기</a>
							</button>
						</div>
					</c:forEach>
				</div>

				<div class="my_manage_menu">
					<select name="my_manage_option" id="my_manage_option_select" onchange="changePage()">
						<option value="applyStatus_main" selected="selected">지원 공고 관리</option>
						<option value="recruitStatus_main">작성 공고 관리</option>
					</select>
				</div>

				<div class="my_main_status">
					<c:forEach var="infoCountVOs" items="${infoAllDto.infoCountVOs}">
						<ul>
							<li>
								<a href="applyStatusAll.do">
									<div class="my_main_status_li1">지원 현황</div>
									<p class="application_notifications"></p>
									<div>${infoCountVOs.applystatusAll}</div>
								</a>
							</li>
							<li>
								<a href="likeListsComm.do">
									<div class="my_main_status_li2">좋아요 한 커뮤니티</div>
									<div>${infoCountVOs.commlikesCount}</div>
								</a>
							</li>
							<li>
								<a href="messagebox_rcv.do">
									<div class="my_main_status_li3">쪽지함</div>
									<p class="proposal_notifications"></p>
									<div>${infoCountVOs.messagesCount}</div>
								</a>
							</li>
							<li>
								<a href="commWroteAll.do">
									<div class="my_main_status_li4">커뮤니티 글 관리</div>
									<div>${infoCountVOs.commCountAll}</div>
								</a>
							</li>
							<li>
								<a href="myQnALists.do">
									<div class="my_main_status_li4">문의 글 관리</div>
									<div>${infoCountVOs.qnaCountAll}</div>
								</a>
							</li>
						</ul>
					</c:forEach>
				</div>
			</div>

			<div class="logout">
				<button>
					<a href="logout.do">로그아웃</a>
				</button>
			</div>
		</div>

		<div class="my_main_contents">
			<div class="my_main_applications">
				<c:forEach var="statusCountVOs" items="${infoAllDto.statusCountVOs}">
					<p class="my_main_application_title">지원 현황</p>
					<div class="my_main_application_counts">
						<div class="my_main_app_all">
							<a href="applyStatusAll.do">
								<p class="my_main_all_count">${statusCountVOs.appstatusAll}</p>
								<p class="my_main_all_text">전체</p>
							</a>
						</div>

						<div class="my_main_app">
							<a href="applyStatus.do">
								<p class="my_main_count">${statusCountVOs.appstatusCont}</p>
								<p class="my_main_text">지원 완료</p>
							</a>
						</div>

						<div class="my_main_app_final">
							<a href="applyStatusFin.do">
								<p class="my_main_final_count">${statusCountVOs.appstatusFin}</p>
								<p class="my_main_final_text">최종 합격</p>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>

			<div class="my_main_position">
				<p class="my_main_position_title">프로필</p>
				<div class="my_main_pro_contents">
					<c:forEach var="userInfoVOs" items="${infoAllDto.userInfoVOs}">
						<c:choose>
							<c:when test="${userInfoVOs.userPosition == 'none'}">
								<p class="my_main_profile_position">선호하는 <span>포지션</span>을 설정해주세요</p>
								<button>
									<a href="prInsertForm.do">PR 글 작성하기</a>
								</button>
							</c:when>
							<c:when test="${userInfoVOs.prNo == -1}">
								<p class="my_main_profile_position">선호하는 <span>포지션</span>을 설정해주세요</p>
								<button>
									<a href="prInsertForm.do">PR 글 작성하기</a>
								</button>
							</c:when>
							<c:when test="${userInfoVOs.userPosition != none && userInfoVOs.prNo != -1}">
								<p class="my_main_profile_position">현재 설정한 포지션은 <span><b>${userInfoVOs.userPosition}</b></span></p>
								<button>
									<a href="prUpdateForm.do?prNo=${userInfoVOs.prNo}">프로필 수정하기</a>
								</button>
							</c:when>
						</c:choose>
					</c:forEach>
				</div>
			</div>

			<div class="my_main_recommend">
				<p class="my_main_reco_title">추천 구인 공고</p>
				<div class="my_main_recos">
					<c:forEach var="jobInfoVOs" items="${infoAllDto.jobInfoVOs}">
						<div class="my_main_reco${jobInfoVOs.no}">
							<a href="#?jobNo=${jobInfoVOs.jobNo}">
								<div class="my_main_reco${jobInfoVOs.no}_1">
									<img src="https://via.placeholder.com/250x250" />
<!-- 									<img src="https://picsum.photos/250/250" /> -->
								</div>
	
								<p class="my_main_reco_com_title">${jobInfoVOs.jobSub}</p>
								<p class="my_main_reco_com_content">${jobInfoVOs.jobText}</p>
	
								<div class="my_main_company">
									<p class="my_main_company_name">${jobInfoVOs.userId}</p>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- .mprecommend -->
		</div>
		<!--.mpcontents -->
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>

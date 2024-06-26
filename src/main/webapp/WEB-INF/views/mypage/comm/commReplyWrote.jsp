<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<head>
<link href="${path}/css/mypage/contLists.css?after" rel="stylesheet">

<%-- <script src="${path}/js/mypage/commWroteList.js"></script> --%>

<script type="text/javascript">
 	// 전체 선택
	function toggleAllCheckboxes() {
		var selectAllCheckbox = document.getElementById("selectAll");
		var NoCheckboxes = document.getElementsByName("check_commReNo");
		
		for (var i = 0; i < NoCheckboxes.length; i++) {
			NoCheckboxes[i].checked = selectAllCheckbox.checked;
        }
	}
	
 	// 삭제 버튼
 	function selectOneDel(commReNo) {
		if(!confirm("정말 삭제하시겠습니까?")) {
			return;
		}
		
		// 선택한 commNo 저장해 둘 배열 선언
		var NoArray = new Array();
		NoArray.push(commReNo);
		console.log("NoArray : " + NoArray);
		
		if(NoArray.length == 1) {
			// 삭제 실행
			$.ajax({
				type: "DELETE",
				url: "deleteSelectReComm.do?commReNo=" + NoArray[0],
				success: function(result) {
			     	if (result.code == 1) {
			     		// 성공
			    	} else if(result.code == -1) {
						alert("항목 선택 삭제 실패");
			        }
				},
				error:function(e){
			    	// alert("data error : "+e);
			    },
				complete: function() {
					alert("1개 데이터 삭제 성공!");
	        		location.reload();
				}
			});
		} else {
			alert("항목 선택 삭제 실패");
		}
 	}
	
 	// 체크박스 다중 선택 삭제
	function check_selectDel() {
		if($("input[name='check_commReNo']:checked").length == 0 ){
			alert("선택된 항목이 없습니다.");
			return;
		}
		
		if(confirm("정말 삭제하시겠습니까?")==false) {
			return;
		}
				
		// 선택한 commNo 저장해 둘 배열 선언
		var NoArray = new Array();
 		$("input[name='check_commReNo']:checked").each(function() {
		      // 선택된 체크박스 값(commNo)을 배열에 추가
		      NoArray.push($(this).val());
		});
		console.log("NoArray : " + NoArray);
		
		var deleteCount = 0; // 삭제된 항목 수
        // 삭제 요청이 완료될 때마다 호출되는 함수
        function onDeleteComplete() {
            deleteCount++;

            // 모든 삭제 요청이 완료되면 페이지 리로드
            if (deleteCount === NoArray.length) {
            	console.log("deleteCount : " + deleteCount);
            	alert("선택 항목 삭제 성공!");
            	location.reload();
            }
        }		
		
		// 반복문으로 삭제 진행
		for(var i = 0; i < NoArray.length; i++) {
			$.ajax({
				type: "DELETE",
				url: "deleteSelectReComm.do?commReNo=" + NoArray[i],
				success: function(result) {
		            if (result.code == 1) {
		                // 삭제 성공
		            } else if(result.code == -1) {
						alert("항목 선택 삭제 실패");
		            }
				},
				error:function(e){
		    		// alert("data error : "+e);
		    	},
				complete: onDeleteComplete // AJAX 요청이 완료되면 호출될 콜백 함수
			});
		}
	}
</script>

<style type="text/css">
	.comm_item_bot {
		width: 100%;
		text-align: center;
	}
	
	.comm_item_bot_Left {
		width: 100%;
		text-align: left;
	}
	
	.comm_item_bot .comm_wanted_modify {
		font-size: 12px;
		color: rgb(64, 64, 64);
		line-height: 2em;
		text-align: center;
		border: 1px solid rgb(190, 190, 190);
		border-radius: 4px;
		padding: 5px;
		box-sizing: border-box;
	}
	
	.comm_item_bot_Left .comm_wanted_modify {
		font-size: 12px;
		color: rgb(64, 64, 64);
		line-height: 2em;
		text-align: center;
		border: 1px solid rgb(190, 190, 190);
		border-radius: 4px;
		padding: 5px;
		box-sizing: border-box;
	}

</style>


</head>

<div id="wrap">
	<div id="list_wrap">
		<div class="list_menu">
			<p class="list_title">커뮤니티 글 관리</p>
			<ul>
				<li class="list_position"><a href="commWroteAll.do">작성 글</a></li>
				<li class="list_proposal"><a href="commReplyWrote.do">작성 댓글</a></li>
				<li class="list_position"><a href="likeListsComm.do">좋아요 한 글</a></li>
			</ul>
		</div>

		<div class="list_contents">
			<p class="list_sub_title">작성 댓글</p>
			<div class="list_search">
				<form name="searchProposal" action="commReplyWrote.do">
					<input id="keyword" type="text" placeholder="글 제목/내용 검색" name="keyword"
					 value="${sessionScope.referer != null ? sessionScope.referer.keyword : ''}">
					<%-- <input type="hidden" name="id" value="${commReplysVO.id}" /> --%>
					<button class="btn_search" type="submit"></button>
				</form>
			</div>
			
			<!-- 삭제버튼 -->
			<div class="list_search">
				<div class="comm_item_bot_Left">
					<a href="#" class="comm_wanted_modify" id="deleteBtnReComm" onclick="check_selectDel();">선택 삭제</a>
				</div>			
			</div>

			<div>
				<form action="deleteReplyComm.do" name="deleteReplyComm" id="deleteReplyComm">
					<table class="list_table">
						<thead>
							<tr>
								<th><input type="checkbox" id="selectAll" onclick="toggleAllCheckboxes()"></th>
								<th>작성한 댓글 내용</th>
								<th>댓글단 글 제목</th>
								<th>댓글수</th>
								<th>댓글 수정(작성)일</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="commReplyInfoVOs" items="${commReplysVO.commReplyInfoVOs}">
								<tr>
									<td>
										<label>
											<input type="checkbox" name="check_commReNo" value="${commReplyInfoVOs.commReNo}">
											<span style="font-size: 12px"></span>
										</label>
									</td>								
									<td><a href="?commReNo=${commReplyInfoVOs.commReNo}">${commReplyInfoVOs.commReText}</a></td>
									<td>${commReplyInfoVOs.commSub}</td>
									<td><p class="cnt_highlight">${commReplyInfoVOs.commreplyCnt}</p></td>
									<td>${commReplyInfoVOs.commReUpdate}</td>
									<td>
										<div class="comm_item_bot">
											<a href="#" class="comm_wanted_modify">수정</a>
										</div>
									</td>
									<td>
										<div class="comm_item_bot">
											<a href="#" class="comm_wanted_modify" onclick="selectOneDel('${commReplyInfoVOs.commReNo}');">삭제</a>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
	#panel {
    padding: 50px;
    display: none;
}

</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	<!--  모달 다이얼로그 -->
		 <input type="hidden" id="newProfileUrl" name="new_profile_url">
		<div id="profileModal" class="modal fade bs-example-modal-sm" role="dialog" aria-hidden="true">
	      <div class="modal-dialog" style="width:570px">
	        <div class="modal-content" style="padding:0;">
	          <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><img src="http://recipe1.ezmember.co.kr/img/btn_close.gif" alt="닫기"></span></button>
	            <h4 class="modal-title">프로필 사진 편집</h4>
	          </div>
	          <div class="modal-body" style="padding:10px;text-align:center;">
	          <c:choose>				
					<c:when test="${jobList.picture!=null }">
		            	<img id="vProfileImageModalSrc" src="resources/member_profile/${jobList.picture }" style="max-width:550px;max-height:500px;">
		            </c:when>
					<c:otherwise>
						<img alt="" src="resources/img/noimg.jpg" width="200" height="200">
					</c:otherwise>				
				</c:choose>	
	            <div style="margin-top:10px;">
	            <input type="file" name="file" id="file_1" style="display:none;" />
	            <button type="button" onClick="document.getElementById('file_1').click();" class="btn btn-primary">프로필 사진 바꾸기</button>
	            <button type="button" id="profileSubmitBtn" onClick="doProfileImageSubmit()" class="btn btn-primary" disabled="disabled">저장</button>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div> <!-- div id="vProfileImageModal" 끝 -->
	    
	<div style="margin: 10px; ">
		<div id="myPicture" style="display: inline-block;">
			<a href="javascript:void(0);" onClick="$('#profileModal').modal('show')">
			<c:choose>				
				<c:when test="${jobList.picture!=null }">
					<img alt="" src="resources/member_profile/${jobList.picture }" width="200" height="200">
				</c:when>
				<c:otherwise>
					<img alt="" src="resources/img/noimg.jpg" width="200" height="200">
				</c:otherwise>
			</c:choose>	
			</a>		
		</div>
		<div style="display: inline-block; font-size: 15pt; color: gray;">${jobList.name }</div>
		<div>
			<script type="text/javascript">
				function memberOut(m_num){
					if(confirm('정말로 탈퇴하시겠습니까?')) {
						location.href="memberOut?m_num="+m_num;
					}					
				}
			</script>
			<button onclick="memberOut(${sessionScope.loginUser.m_num })">회원탈퇴</button>
		</div>
	</div> 
	
	<!--------------------- 거주지 profile Start------------------------------------- -->
	<table class="table">
		<tr class="active"><th align="center">거주지</th></tr>
		<tr>
			<td>
				<hr>
				<div id="bornflip"><a style="cursor: pointer;"><img src="resources/plus.png" width="20px">&nbsp;&nbsp;거주지  추가</a></div>
				<div id="bornpanel" style="display: none;" >
					<element>
						<form id="bornForm">
							<table>
								<tr>
									<th>거주지</th>
									<td>
										 <input type="hidden"
											id="bornsample3_postcode" placeholder="우편번호">
										<br>
										<div id="bornwrap"
											style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
											<img
												src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
												id="btnFoldWrap"
												style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1"
												onclick="foldDaumPostcode2()" alt="접기 버튼">
										</div>
										<input type="text"
											id="bornsample3_address" class="d_form large" placeholder="주소">
											<input type="button"
											onclick="execDaumPostcode()" value="우편번호 찾기">
								</tr>
								<tr>
									<td colspan="2">
										<input type="submit" value="변경내용 저장하기" class="btn btn-default" id="bornInfoSaveBtn">
										<input type="button" value="취소" class="btn btn-default" id="bornInfoCancleBtn">
									</td>
								</tr>
							</table>
						</form>
					</element>
				</div>
			</td>
		</tr>
	</table>
	
	
	<!-- 거주지 관한 profile Start -->
	<!-- 거주지 추가될때마다 생성될 줄 -->
		<div id="appendbornContent" >
			<div id="borndiv" style="display: block;">
						<!-- <div class="btn-group" style="margin-left: 200px;">
							  <button  type="button" id="borndivBtn" style="display: none;" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
							  	 옵션 <span class="caret"></span>
							  </button>
								  <ul class="dropdown-menu" role="menu">
								    <li><a onclick="bornModi()">수정</a></li>
								    <li class="divider"></li>
								    <li><a onclick="bornDel()">삭제</a></li>
								  </ul>
						</div> -->
				<c:if test="${jobList.born ne null }">
					<div id="bornprofile">
								<div style="display: table-cell; vertical-align: middle;">
									<img src="resources/friendIcon/house.png" width="60px">
								</div>
								<div style="display: table-cell; vertical-align: middle; width: 400px;">
									<span id="bornSpan" style="color: blue;">${jobList.born }</span>
									<font color="#848484"></font> 거주 <br>
									<font size="1px" color="#848484">현재 거주지</font>
								</div>
								
								<div id="borndivBtn" style="display: none; vertical-align: middle;"  >
									<a onclick="bornModi()">
									<img alt="수정" src="resources/friendIcon/modify.png" width="20px" style="cursor: pointer;">수정</a>
									&nbsp;&nbsp;
									<span  m_num="${list.m_num }" onclick="bornDel()" onmouseover="changeBackground(this)" 
									onmouseout="changeBackground2(this)"  style="float: right;  margin-right: 30px; 
									color: black; cursor: pointer;"><b>x</b></span>
								</div>
					</div>
				</c:if>
			</div>
		</div>
	
	<!-- 직장에 관한 profile Start -->
	<table class="table">
		<tr class="active"><th align="center">직장</th></tr>
		<tr>
			<td>
				<hr>
				<div id="jobflip"><a style="cursor: pointer;"><img src="resources/plus.png" width="20px">&nbsp;&nbsp;직장  추가</a></div>
				<div id="jobpanel" style="display: none;" >
					<element>
						<form id="jobForm">
							<table>
								<tr>
									<th>회사</th>
									<td>
										<input type="text"
											placeholder="근무했던 직장이 어디인가요?" id="autocomplete" class="autocomplete"></td>
								</tr>
								<tr>
									<th>직책</th>
									<td>
										<input type="text"
											placeholder="직책이 무엇인가요?" id="autocompletePosition" ></td>
								</tr>
								<tr>
									<th>도시/지역</th>
									<td>
										 <input type="hidden"
											id="sample3_postcode" placeholder="우편번호">
										<br>
										<div id="wrap"
											style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
											<img
												src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
												id="btnFoldWrap"
												style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1"
												onclick="foldDaumPostcode()" alt="접기 버튼">
										</div>
										<input type="text"
											id="sample3_address" class="d_form large" placeholder="주소">
											<input type="button"
											onclick="sample3_execDaumPostcode()" value="우편번호 찾기">
									</td>
								</tr>
								<tr>
									<th>설명</th>
									<td><textarea cols="23" rows="5" id="job_desc"></textarea></td>
								</tr>
								<tr>
									<td colspan="2">
										<input type="submit" value="변경내용 저장하기" class="btn btn-default" id="joinInfoSaveBtn">
										<input type="button" value="취소" class="btn btn-default" id="jobInfoCancleBtn">
									</td>
								</tr>
							</table>
						</form>
					</element>
				</div>
			</td>
		</tr>
	</table>
	<!-- 직장에 관한 profile Start -->
	<!-- 직장 추가될때마다 생성될 줄 -->
		<div id="appendJobContent" >
			<div id="jobdiv" style="display: block;">
						<!-- <div class="btn-group" style="margin-left: 200px;">
							  <button  type="button" id="jobdivBtn" style="display: none;" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
							  	 옵션 <span class="caret"></span>
							  </button>
								  <ul class="dropdown-menu" role="menu">
								    <li><a onclick="jobModi()">수정</a></li>
								    <li class="divider"></li>
								    <li><a onclick="jobDel()">삭제</a></li>
								  </ul>
						</div> -->
				<c:if test="${jobList.job ne null }">
							<div id="jobprofile">
								<div style="display: table-cell; vertical-align: middle;">
									<img src="resources/friendIcon/job.png" width="60px">
								</div>
								<div style="display: table-cell; vertical-align: middle; width: 400px;">
									<span id="jobSpan" style="color: blue;">${jobList.job }</span> 근무 <br>
									<img src="resources/friendIcon/grade2.png" width="30px">
									<span id="jobSpan2" style="color: #848484;">${jobList.job_position }</span> <br>
									<img src="resources/friendIcon/location.png" width="30px">
									<span id="jobSpan3" style="color: #848484;">${jobList.job_addr }</span><br>
									<span id="jobSpan4" style="color: #848484;">${jobList.job_desc }</span>
								</div>
								
								<div id="jobdivBtn" style="display: none; vertical-align: middle;"  >
									<a onclick="jobModi()">
									<img alt="수정" src="resources/friendIcon/modify.png" width="20px" style="cursor: pointer;">수정</a>
									&nbsp;&nbsp;
									<span  m_num="${list.m_num }" onclick="jobDel()" onmouseover="changeBackground(this)" 
									onmouseout="changeBackground2(this)"  style="float: right;  margin-right: 30px; 
									color: black; cursor: pointer;"><b>x</b></span>
								</div>
							</div>
				</c:if>
			</div>
		</div>

<!-- 고등학교학교정보 START -->
<table class="table">
		<tr class="active"><th align="center">고등학교</th></tr>
		<!--  고등학교학교정보 profile Start -->
		<tr>
			<td>
				<hr>
				<div id="schoolflip"><a style="cursor: pointer;"><img src="resources/plus.png" width="20px">&nbsp;&nbsp;고등학교 추가</a></div>
				<div id="schoolpanel" style="display: none;" >
					<element>
							<table>
								<tr>
									<th>학교</th>
									<td>
										<input type="text"
											placeholder="어느 학교에 다니셨나요?" id="school"  class="autocomplete_school"></td>
								</tr>
								<tr>
									<th>기간</th>
									<td>
										<a id="school_into_year">+입학일 추가</a>
										<input id="school_into_year_Input" type="date" style="display: none;">-<br>
										<a id="school_out_year">+졸업일 추가</a>
										<input id="school_out_year_Input" type="date" style="display: none;">
									</td>
								</tr>
								<tr>
									<th>설명</th>
									<td><textarea cols="23" rows="5" id="school_desc"></textarea></td>
								</tr>
								<tr>
									<td colspan="2">
										<input type="submit" value="변경내용 저장하기" class="btn btn-default" id="schoolInfoSave">
										<input type="button" value="취소" class="btn btn-default" id="schoolInfoCancleBtn">
									</td>
								</tr>
							</table>
					</element>
				</div>
			</td>
		</tr>
	</table>
	
	<!-- 고등학교 관한 profile Start -->
	<!-- 고등학교 추가될때마다 생성될 줄 -->
		<div id="appendSchoolContent" >
			<div id="schooldiv" style="display: block;">
				<c:if test="${jobList.school_desc ne null}">
							<div id="schoolprofile">
								<div style="display: table-cell; vertical-align: middle;">
									<img src="resources/friendIcon/profile_school.png" width="60px">
								</div>
								<div style="display: table-cell; vertical-align: middle; width: 400px;">
									<span id="schoolSpan" style="color: blue;">${jobList.school }</span>  <br>
									<span id="schoolSpan2" style="color: #848484; ">${jobList.school_out }</span>졸업 <br>
									<span id="schoolSpan3" style="color: #848484; ">${jobList.school_desc }</span><br>
								</div>
								<div id="shooldivBtn" style="display: none; vertical-align: middle;"  >
									<a onclick="schoolModi()">
									<img alt="수정" src="resources/friendIcon/modify.png" width="20px" style="cursor: pointer;">수정</a>
									&nbsp;&nbsp;
									<span  m_num="${list.m_num }" onclick="schoolDel()" onmouseover="changeBackground(this)" 
									onmouseout="changeBackground2(this)"  style="float: right;  margin-right: 30px; 
									color: black; cursor: pointer;"><b>x</b></span>
								</div>
							</div>
				</c:if>
			</div>
		</div>
		
		
		
		
		
		
<!-- --------------------대학정보 START -->	
<!-- 대학정보 START -->
<table class="table">
		
		<tr class="active"><th align="center">대학교</th></tr>
		<!--  대학정보 profile Start -->
		<tr>
			<td>
				<hr>
				<div id="highschoolflip"><a style="cursor: pointer;"><img src="resources/plus.png" width="20px">&nbsp;&nbsp;대학교 추가</a></div>
				<div id="highschoolpanel" style="display: none;" >
					<element>
							<table>
								<tr>
									<th>학교</th>
									<td>
										<input type="text"
											placeholder="어느 학교에 다니셨나요?" id="highschool"  class="highautocomplete_school"></td>
								</tr>
								<tr>
									<th>기간</th>
									<td>
										<a id="highschool_into_year">+입학일 추가</a>
										<input id="highschool_into_year_Input" type="date" style="display: none;">-<br>
										<a id="highschool_out_year">+졸업일 추가</a>
										<input id="highschool_out_year_Input" type="date" style="display: none;">
									</td>
								</tr>
								<tr>
									<th>설명</th>
									<td><textarea cols="23" rows="5" id="highschool_desc"></textarea></td>
								</tr>
								<tr>
								<tr>
									<th>전공</th>
									<td><input type="text" id="highschoolmajor" placeholder="전공이 무엇인가요?"></td>
								</tr>
								<tr>
									<td colspan="2">
										<input type="submit" value="변경내용 저장하기" class="btn btn-default" id="highschoolInfoSave">
										<input type="button" value="취소" class="btn btn-default" id="highschoolInfoCancleBtn">
									</td>
								</tr>
							</table>
					</element>
				</div>
			</td>
		</tr>
	</table>
	
	<!-- 대학정보 관한 profile Start -->
	<!-- 대학정보 추가될때마다 생성될 줄 -->
		<div id="appendhighSchoolContent" >
			<div id="highschooldiv" style="display: block;">
						<!-- <div class="btn-group" style="margin-left: 200px;">
							  <button  type="button" id="highshooldivBtn" style="display: none;" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
							  	 옵션 <span class="caret"></span>
							  </button>
								  <ul class="dropdown-menu" role="menu">
								    <li><a onclick="highschoolModi()">수정</a></li>
								    <li class="divider"></li>
								    <li><a onclick="highschoolDel()">삭제</a></li>
								  </ul>
						</div> -->
				<c:if test="${jobList.highschool ne null }">
							<div id="hischoolprofile">
							
								<div style="display: table-cell; vertical-align: middle;">
										<img src="resources/friendIcon/profile_highschool.png" width="60px">
								</div>
								<div style="display: table-cell; vertical-align: middle; width: 400px;">
										<span id="highschoolSpan" style="color: blue;">${jobList.highschool }</span>  <br>
										<span id="highschoolSpan2" style="color: #848484; ">${jobList.highschool_out }</span>졸업
									    -<span id="highschoolSpan3" style="color: #848484; ">${jobList.highschoolmajor }</span>과
										 <br>
										<span id="highschoolSpan4" style="color: #848484; ">${jobList.highschool_desc }</span><br>
								</div>
								<div id="highshooldivBtn" style="display: none; vertical-align: middle;"  >
										<a onclick="highschoolModi()">
										<img alt="수정" src="resources/friendIcon/modify.png" width="20px" style="cursor: pointer;">수정</a>
										&nbsp;&nbsp;
										<span  m_num="${list.m_num }" onclick="highschoolDel()" onmouseover="changeBackground(this)" 
										onmouseout="changeBackground2(this)"  style="float: right;  margin-right: 30px; 
										color: black; cursor: pointer;"><b>x</b></span>
								</div>
							</div>
				</c:if>
			</div>
		</div>	
		
		
		
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/memberInfomation.js"></script>
<script type="text/javascript">
   
    var imageFile = null;
   
   // 저장 버튼을 클릭한 경우에 작동하는 함수
   function doProfileImageSubmit() {
      var m_num = $("[m_num]").attr("m_num");
      //alert("저장버튼클릭");
      // 로드된 이미지가 없을 경우 알림창 띄우고 리턴
      if(!$("#newProfileUrl").val()) {
         alert('새 프로필 이미지를 올려주세요.');
           return ;
       }

      // 서버로 보낼 데이타를 구성함: 이미지파일과 회원번호
      var data = new FormData();
      data.append("file", imageFile);
      data.append("m_num", m_num);
      
      // 데이터를 서버로 전송
      uploadToServer(data);
      
   };
   
   // 데이터를 ajax방식으로 서버에 전송
   function uploadToServer(formData) {

      //Uncomment when you server ready

      xhr = new XMLHttpRequest();
      xhr.open("post", "http://localhost:8080/pro/memberPictureUpload",
            true);
      xhr.onreadystatechange = function() {
         if (xhr.readyState == 4) {
            //alert(xhr.responseText);
            self.location.reload();
         }
      };
      xhr.send(formData);
   }
   
   // 이미지 파일을 열어서 로드하는 함수
   function handlePhotoFiles(e){
      imageFile = e.target.files[0];
      //alert(imageFile);
      
      // 이미지 파일 크기 제한
       if (e.target.files[0].size > (2*1024*1024)) {
           alert("사진은 2MB까지만 허용됩니다.");
           return false;
       }

       $('#submit_btn').attr('type','button').attr('onClick','alert("파일을 올리는 중입니다.");');

       var reader = new FileReader();
       reader.onload = function(evt) {
           var img = new Image();
           img.src = reader.result;
           img.onload = function () {
               var fileData = reader.result;
               // 모달창의 이미지 변경
               $("#vProfileImageModalSrc").attr("src",fileData);
              // 버튼 활성화
               $('#profileSubmitBtn').prop('disabled',false);
              // URL 설정
               $("#newProfileUrl").val(fileData);
           }
       }
       // URL로 데이터를 읽어옴.
       reader.readAsDataURL(e.target.files[0]);
       
   };

   $(document).ready(function()
   {
      // 파일 엘리먼트가 바뀌면 (파일 열기를 눌러서 선택했을 때)
      $("#file_1").change(function(e) {
           handlePhotoFiles(e);
       });

   }); 
   
   </script>
</body>
</html>
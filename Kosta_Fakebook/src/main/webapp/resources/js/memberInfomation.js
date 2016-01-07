	 //////////////////////////////////////////////////////////////////////////////////
	     /////////////////////직업 START/////////////////////////////////////////////////
	      ///////////////////////////////////////////////////////////////////////////////// 
	//우편 주소 찾기 method start!!

	// 우편번호 찾기 찾기 화면을 넣을 element
	    var element_wrap = document.getElementById('wrap');
	
	     function foldDaumPostcode() {
	    	 
	        // iframe을 넣은 element를 안보이게 한다.
	        element_wrap.style.display = 'none';
	    } 

     function sample3_execDaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample3_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample3_address').value = fullAddr;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);					
	        
        // iframe을 넣은 element를 보이게 한다.
	        element_wrap.style.display = 'block';
   		 } 
     
     	//우편 주소 찾기 method END!!
     
     
     //////////////////////////거주지 우편찾기 START///////////////////////////////////////////
     //////////////////////////거주지 우편찾기 START///////////////////////////////////////////
     //////////////////////////거주지 우편찾기 START///////////////////////////////////////////
   //우편 주소 찾기 method start!!

 	// 우편번호 찾기 찾기 화면을 넣을 element
 	    var element_wrap2 = document.getElementById('bornwrap');
 	
 	     function foldDaumPostcode2() {
 	        // iframe을 넣은 element를 안보이게 한다.
 	        element_wrap2.style.display = 'none';
 	    } 

      function execDaumPostcode() {
         // 현재 scroll 위치를 저장해놓는다.
         var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
         new daum.Postcode({
             oncomplete: function(data) {
                 // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                 // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                 // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                 var fullAddr = data.address; // 최종 주소 변수
                 var extraAddr = ''; // 조합형 주소 변수

                 // 기본 주소가 도로명 타입일때 조합한다.
                 if(data.addressType === 'R'){
                     //법정동명이 있을 경우 추가한다.
                     if(data.bname !== ''){
                         extraAddr += data.bname;
                     }
                     // 건물명이 있을 경우 추가한다.
                     if(data.buildingName !== ''){
                         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                     }
                     // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                     fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                 }

                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
                 document.getElementById('bornsample3_postcode').value = data.zonecode; //5자리 새우편번호 사용
                 document.getElementById('bornsample3_address').value = fullAddr;

                 // iframe을 넣은 element를 안보이게 한다.
                 // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                 element_wrap2.style.display = 'none';

                 // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                 document.body.scrollTop = currentScroll;
             },
             // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
             onresize : function(size) {
                 element_wrap2.style.height = size.height+'px';
             },
             width : '100%',
             height : '100%'
         }).embed(element_wrap2);					
 	        
         // iframe을 넣은 element를 보이게 한다.
 	        element_wrap2.style.display = 'block';
    		 } 
      
      	//우편 주소 찾기 method END!!
     
     /////////////////////////////거주지 우편찾기 END/////////////////////////////////////////
      /////////////////////////////거주지 우편찾기 END/////////////////////////////////////////
      /////////////////////////////거주지 우편찾기 END/////////////////////////////////////////
     
		   //job 관련 method START
			$("#jobflip").click(function(){
				if($("#jobSpan").text()==""){
					$("#jobflip").css('display','none');
			        $("#jobpanel").css('display','block');
				}else{
					alert("하나의 직업 정보만 입력가능합니다.");
				}
		    });
		    
			//정보입력창에서 취소시
		    $("#jobInfoCancleBtn").click(function(){
		    	$('#jobdiv').css('display','block');
		    	$("#jobflip").css('display','block');
		    	$("#jobpanel").css('display','none');
		    });
		  
		    //정보입력창에서 정보 입력완료시
		    $("#joinInfoSaveBtn").click(function(){
		    	var job = $("#autocomplete").val();
		    	var jobPosition = $("#autocompletePosition").val();
		    	var addr = $("#sample3_address").val();
		    	var desc=$('#job_desc').val();
		    	$("#autocomplete").val("");
		    	$("#autocompletePosition").val("");
		    	$("#sample3_address").val("");
		    	$("#job_desc").val("");
		    	if(job=="" || jobPosition==""||addr==""||desc==""){
		    		alert("모든 정보를 입력해주세요.");
		    		return false;
		    	}else{
			    	 $.ajax({
		                    type: 'post',
		                    url: "saveJobProfile",
		                    dataType: "text",
		                    data: { job : job,jobPosition:jobPosition,addr : addr,desc:desc},
		                    success: function(data) { //중복체크 후 반환 값
		                    	if(jQuery.trim(data)=='YES'){
		                    		$("#jobflip").css('display','none');
		      					    $("#jobpanel").css('display','block');
		                    		$('#jobdiv').append(
		                    				'<div id="jobprofile">'+
		    								'<div style="display: table-cell; vertical-align: middle;">'+
		    									'<img src="resources/friendIcon/job.png" width="60px">'+
		    								'</div>'+
		    								'<div style="display: table-cell; vertical-align: middle; width: 400px;">'+
		    									'<span id="jobSpan" style="color: blue;">${jobList.job }</span> 근무 <br>'+
		    									'<img src="resources/friendIcon/grade2.png" width="30px">'+
		    									'<span id="jobSpan2" style="color: #848484;">${jobList.job_position }</span> <br>'+
		    									'<img src="resources/friendIcon/location.png" width="30px">'+
		    									'<span id="jobSpan3" style="color: #848484;">${jobList.job_addr }</span><br>'+
		    									'<span id="jobSpan4" style="color: #848484;">${jobList.job_desc }</span>'+
		    								'</div>'+
		    								
		    								'<div id="jobdivBtn" style="display: none; vertical-align: middle;"  >'+
		    									'<a onclick="jobModi()">'+
		    									'<img alt="수정" src="resources/friendIcon/modify.png" width="20px" style="cursor: pointer;">수정</a>'+
		    									'&nbsp;&nbsp;'+
		    									'<span  m_num="${list.m_num }" onclick="jobDel()" onmouseover="changeBackground(this)" '+
		    									'onmouseout="changeBackground2(this)"  style="float: right;  margin-right: 30px; '+
		    									'color: black; cursor: pointer;"><b>x</b></span>'+
		    								'</div>'+
		    							'</div>'
		                    		);
		                    		$('#jobdiv').css('display','block');
						         }
						      }//success
		               }); //ajax end
		    	}//if end
		    })// $("#joinInfoSaveBtn").click(function() END
		    
		    
		    ///////////직업 수정 삭제 버튼 생성 메소드및 css
		    $('#jobdiv').mouseover(function(){
		    	$('#jobdivBtn').css('display','table-cell');
		    	$('#jobprofile').css('background-color','#E6E6E6');
		    })
		    
		     $('#jobdiv').hover(function(){
		    	$('#jobdivBtn').css('display','none');
		    	$('#jobprofile').css('background-color',"white");
		    	
		    })
		    //삭제 x표 클릭시 바탕화면 변화
			    function changeBackground(object){
				var obj = object;
				$(obj).css("background-color","#CEDEFB");
				$(obj).css("color","white");
				}
				
				function changeBackground2(object){
					var obj = object;
					$(obj).css("background-color","#E6E6E6");
					$(obj).css("color","black");
				}
				 //삭제 x표 클릭시 바탕화면 변화 끝
				 ///////////직업 수정 삭제 버튼 생성 메소드및 css 끝
		   
		    //수정버튼 눌렀을시 단순히 입력창에 입력해주는 메소드
		    function jobModi(){
		    	$('#jobdiv').css('display','none');
		    	var job = $("#jobSpan").text();
		    	var jobPosition = $("#jobSpan2").text();
		    	var addr = $("#jobSpan3").text();
		    	var desc = $("#jobSpan4").text();
		    	  $("#jobpanel").css('display','block');
		    	  $('#autocomplete').val(job);
		    	  $('#autocompletePosition').val(jobPosition);
		    	  $('#sample3_address').val(addr);
		    	  $('#job_desc').val(desc);
			}
		    
		    function jobDel(){
		    	var job = $("#jobSpan").text();
		    	var jobPosition = $("#jobSpan2").text();
		    	var addr = $("#jobSpan3").text();
		    	var desc = $("#jobSpan4").text();
			      $("#jobSpan").text("");			$("#jobSpan2").text("");
			      $("#jobSpan3").text("");			$("#jobSpan4").text("");
		    	  $('#autocomplete').val();    $('#autocompletePosition').val();
		    	  $('#sample3_address').val(); $('#job_desc').val();
		    	  $.ajax({
	                    type: 'post',
	                    url: "delJobProfile",
	                    dataType: "text",
	                    data: { job : job,jobPosition:jobPosition,addr : addr,desc:desc},
	                    success: function(data) { //중복체크 후 반환 값
	                    	if(jQuery.trim(data)=='YES'){
	                    		$("#jobflip").css('display','block');
	                    		$('#jobdivBtn').css('display','none');
	                    		$('#jobprofile').remove();
					         }else{
					        	 
					         }
					      }//success
	               }); //ajax end
		    }
		    //job 관련 method END
		    
								
		//직업 자동화 완성 Ajax를 이용한 json으로 데이터 받아오기
		$( "#autocomplete" ).autocomplete({
		        source : function( request, response ) {
		             $.ajax({
		                    type: 'post',
		                    url: "autocomplete",
		                    dataType: "json",
		                    //request.term = $("#autocomplete").val()
		                    data: { value : request.term },
		                    success: function(data) {
		                        //서버에서 json 데이터 response 후 목록에 뿌려주기 위함
		                        response( 
		                            $.map(data, function(item) {
		                                return {
		                                  // 디코딩하여 변수에 담는다.
		                                  label:   decodeURIComponent( item.data ),
		                                  value:   decodeURIComponent( item.data )
		                                  /*   label: item.data, */
		                                    /* value: item.data */
		                                }
		                            })
		                        );
		                    }
		               });
		            },
		        //조회를 위한 최소글자수
		        minLength: 2,
		        select: function( event, ui ) {
		            // 만약 검색리스트에서 선택하였을때 선택한 데이터에 의한 이벤트발생
		        }
		    });		
		//직책 자동화 완성
		  var autocompletePosition_text = ["사장","회장","사원","계장","주임","대리","과장","부장","차장","이사"];
	         $("#autocompletePosition").autocomplete({
	            source: autocompletePosition_text
	         });
	         //////////////////////////////////////////////////////////////////////////////////
		     /////////////////////직업 END/////////////////////////////////////////////////
		      ///////////////////////////////////////////////////////////////////////////////// 
	         
	         
	         //////////////////////////////////////////////////////////////////////////////////
		     /////////////////////고등학교 자동화 완성 START/////////////////////////////////////////////////
		      ///////////////////////////////////////////////////////////////////////////////// 
	         $( "#school" ).autocomplete({
			        source : function( request, response ) {
			             $.ajax({
			                    type: 'post',
			                    url: "autocompleteschool",
			                    dataType: "json",
			                    //request.term = $("#autocomplete_school").val()
			                    data: { value : request.term },
			                    success: function(data) {
			                        //서버에서 json 데이터 response 후 목록에 뿌려주기 위함
			                        response( 
			                            $.map(data, function(item) {
			                                return {
			                                  // 디코딩하여 변수에 담는다.
			                                  label:   decodeURIComponent( item.data ),
			                                  value:   decodeURIComponent( item.data )
			                                  /*   label: item.data, */
			                                    /* value: item.data */
			                                }
			                            })
			                        );
			                    }
			               });
			            },
			        //조회를 위한 최소글자수
			        minLength: 2,
			        select: function( event, ui ) {
			            // 만약 검색리스트에서 선택하였을때 선택한 데이터에 의한 이벤트발생
			        }
			    });		
	         
	         //////////////////////////////////////////////////////////////////////////////////
		     /////////////////////고등학교 자동화 완성 END/////////////////////////////////////////////////
		      ///////////////////////////////////////////////////////////////////////////////// 
	         
	         //////////////////////////////////////////////////////////////////////////////////
		     /////////////////////대학교 자동화 완성 END/////////////////////////////////////////////////
		      ///////////////////////////////////////////////////////////////////////////////// 
	         $( "#highschool" ).autocomplete({
			        source : function( request, response ) {
			             $.ajax({
			                    type: 'post',
			                    url: "autocompletehighschool",
			                    dataType: "json",
			                    //request.term = $("#autocomplete_school").val()
			                    data: { value : request.term },
			                    success: function(data) {
			                        //서버에서 json 데이터 response 후 목록에 뿌려주기 위함
			                        response( 
			                            $.map(data, function(item) {
			                                return {
			                                  // 디코딩하여 변수에 담는다.
			                                  label:   decodeURIComponent( item.data ),
			                                  value:   decodeURIComponent( item.data )
			                                  /*   label: item.data, */
			                                    /* value: item.data */
			                                }
			                            })
			                        );
			                    }
			               });
			            },
			        //조회를 위한 최소글자수
			        minLength: 2,
			        select: function( event, ui ) {
			            // 만약 검색리스트에서 선택하였을때 선택한 데이터에 의한 이벤트발생
			        }
			    });	
	         //////////////////////////////////////////////////////////////////////////////////
		     /////////////////////대학교 자동화 완성 END/////////////////////////////////////////////////
		      ///////////////////////////////////////////////////////////////////////////////// 
	         
	         //////////////////////////////////////////////////////////////////////////////////
		     /////////////////////전공 자동화 완성 END/////////////////////////////////////////////////
		      ///////////////////////////////////////////////////////////////////////////////// 
	         $( "#highschoolmajor" ).autocomplete({
			        source : function( request, response ) {
			             $.ajax({
			                    type: 'post',
			                    url: "autocompletehighschoolmajor",
			                    dataType: "json",
			                    //request.term = $("#autocomplete_school").val()
			                    data: { value : request.term },
			                    success: function(data) {
			                        //서버에서 json 데이터 response 후 목록에 뿌려주기 위함
			                        response( 
			                            $.map(data, function(item) {
			                                return {
			                                  // 디코딩하여 변수에 담는다.
			                                  label:   decodeURIComponent( item.data ),
			                                  value:   decodeURIComponent( item.data )
			                                  /*   label: item.data, */
			                                    /* value: item.data */
			                                }
			                            })
			                        );
			                    }
			               });
			            },
			        //조회를 위한 최소글자수
			        minLength: 2,
			        select: function( event, ui ) {
			            // 만약 검색리스트에서 선택하였을때 선택한 데이터에 의한 이벤트발생
			        }
			    });	
	         
	         //////////////////////////////////////////////////////////////////////////////////
		     /////////////////////전공 자동화 완성 END/////////////////////////////////////////////////
		      ///////////////////////////////////////////////////////////////////////////////// 
	         
	         
	         
	    //////////////////////////////////////////////////////////////////////////////////
	     /////////////////////고등학교에 START/////////////////////////////////////////////////
	      /////////////////////////////////////////////////////////////////////////////////   
	         
	         $("#schoolflip").click(function(){
					if($("#schoolSpan").text()==""){
						$("#schoolflip").css('display','none');
				        $("#schoolpanel").css('display','block');
				        
					}else{
						alert("하나의 직업 정보만 입력가능합니다. 입력하시길 원하시면 삭제후 눌러주세요.");
						return false;
					}
	        	 $("#schoolflip").css('display','none');
			        $("#schoolpanel").css('display','block');
			    });
	         $("#schoolInfoCancleBtn").click(function(){
			    	$("#schoolflip").css('display','block');
			    	$("#schoolpanel").css('display','none');
			    }) 
			    
			  $("#school_into_year").click(function(){
				  $("#school_into_year").css('display','none');
				  $("#school_into_year_Input").css('display','block');
			  })
			  $("#school_out_year").click(function(){
				  $("#school_out_year").css('display','none');
				  $("#school_out_year_Input").css('display','block');
			  })
			  
			    $("#schoolInfoSave").click(function(){
		    	var school = $("#school").val();
		    	var school_into_year_Input = $("#school_into_year_Input").val();
		    	var school_out_year_Input = $("#school_out_year_Input").val();
		    	var school_desc=$('#school_desc').val();
		    	$("#school").val("");
		    	$("#school_into_year_Input").val("");
		    	$("#school_out_year_Input").val("");
		    	$("#school_desc").val("");
		    	if(school=="" || school_into_year_Input==""||school_out_year_Input==""||school_desc==""){
		    		alert("모든 정보를 입력하셔야 합니다.");
		    		return false;
		    	}else{
			    	 $.ajax({
		                    type: 'post',
		                    url: "schoolInfoSave",
		                    dataType: "text",
		                    data: { school : school,school_into_year_Input:school_into_year_Input,school_out_year_Input : school_out_year_Input,school_desc:school_desc},
		                    success: function(data) { //중복체크 후 반환 값
		                    		$("#schoolflip").css('display','block');
		      					    $("#schoolpanel").css('display','none');
		                    		$('#schooldiv').append(
		        							'<div id="schoolprofile">'+
												'<div style="display: table-cell; vertical-align: middle;">'+
													'<img src="resources/friendIcon/profile_school.png" width="60px">'+
												'</div>'+
												'<div style="display: table-cell; vertical-align: middle; width: 400px;">'+
													'<span id="schoolSpan" style="color: blue;">'+school+'</span>  <br>'+
													'<span id="schoolSpan2" style="color: #848484; ">'+school_out_year_Input+'</span>졸업 <br>'+
													'<span id="schoolSpan3" style="color: #848484; ">'+school_desc+'</span><br>'+
											  '</div>'+
												'<div id="shooldivBtn" style="display: none; vertical-align: middle;"  >'+
													'<a onclick="schoolModi()">'+
													'<img alt="수정" src="resources/friendIcon/modify.png" width="20px" style="cursor: pointer;">수정</a>'+
													'&nbsp;&nbsp;'+
													'<span  m_num="${list.m_num }" onclick="schoolDel()" onmouseover="changeBackground(this)" '+
													'onmouseout="changeBackground2(this)"  style="float: right;  margin-right: 30px; '+
													'color: black; cursor: pointer;"><b>x</b></span>'+
												'</div>'+
											'</div>');
		                    		$('#schooldiv').css('display','block');
						      }//success
		               }); //ajax end
		    	}//if end
		    })// $("#schoolInfoSave").click(function() END
		    
		    
		    
		    $('#schooldiv').mouseover(function(){
		    	$('#shooldivBtn').css('display','table-cell');
		    	$('#schoolprofile').css('background-color','#E6E6E6');
		    })
		    
		    $('#schooldiv').hover(function(){
		    	$('#shooldivBtn').css('display','none');
		    	$('#schoolprofile').css('background-color','white');
		    	
		    })
		    
		    function schoolModi(){
	        	$('#schoolprofile').css('display','none');
		    	var school = $("#schoolSpan").text();
		    	var school_out = $("#schoolSpan2").text();
		    	var school_desc = $("#schoolSpan3").text();
		    	  $("#schoolpanel").css('display','block');
		    	  $('#autocomplete_school').val(school);
		    	  $('#school_desc').val(school_desc);
		    }
	         
	         function schoolDel(){
				      $("#schoolSpan").text("");			$("#schoolSpan2").text("");
				      $("#schoolSpan3").text("");			
			    	  $('#autocomplete_school').val();    $('#school_desc').val();
			    	  $.ajax({
		                    type: 'post',
		                    url: "delSchoolProfile",
		                    success: function(data) { //중복체크 후 반환 값
		                    	if(jQuery.trim(data)=='YES'){
		                    		$("#schoolflip").css('display','block');
		                    		$('#shooldivBtn').css('display','none');
		                    		$('#schoolprofile').remove();
						         }
						      }//success
		               }); //ajax end
			    }
	         
	         
	         //////////////////////////////////////////////////////////////////////////////////
		     /////////////////////고등학교에 END/////////////////////////////////////////////////
		      ///////////////////////////////////////////////////////////////////////////////// 
	         
	         
	         //////////////////////////////////////////////////////////////////////////////////
		     /////////////////////대학교 START/////////////////////////////////////////////////
		      ///////////////////////////////////////////////////////////////////////////////// 
	         
	         $("#highschoolflip").click(function(){
					if($("#highschoolSpan").text()==""){
						$("#highschoolflip").css('display','none');
				        $("#highschoolpanel").css('display','block');
					}else{
						alert("하나의 직업 정보만 입력가능합니다.");
						return false;
					}
					$("#highschoolflip").css('display','none');
			        $("#highschoolpanel").css('display','block');
			    });
	         $("#highschoolInfoCancleBtn").click(function(){
			    	$("#highschoolflip").css('display','block');
			    	$("#highschoolpanel").css('display','none');
			    }) 
			    
			  $("#highschool_into_year").click(function(){
				  $("#highschool_into_year").css('display','none');
				  $("#highschool_into_year_Input").css('display','block');
			  })
			  $("#highschool_out_year").click(function(){
				  $("#highschool_out_year").css('display','none');
				  $("#highschool_out_year_Input").css('display','block');
			  })
			  
			    $("#highschoolInfoSave").click(function(){
		    	var highschool = $("#highschool").val();
		    	var highschool_into_year_Input = $("#highschool_into_year_Input").val();
		    	var highschool_out_year_Input = $("#highschool_out_year_Input").val();
		    	var highschool_desc=$('#highschool_desc').val();
		    	var highschoolmajor=$('#highschoolmajor').val();
		    	$("#school").val("");
		    	$("#school_into_year_Input").val("");
		    	$("#school_out_year_Input").val("");
		    	$("#school_desc").val("");
		    	$('#highschoolmajor').val("");
		    	if(highschool=="" || highschool_into_year_Input==""||highschool_out_year_Input==""||highschool_out_year_Input==""||highschool_desc==""||highschoolmajor==""){
		    		alert("모든 정보를 입력해주세요.");
		    		return false;
		    	}else{
			    	 $.ajax({
		                    type: 'post',
		                    url: "highschoolInfoSave",
		                    dataType: "text",
		                    data: { highschool : highschool, highschool_into_year_Input:highschool_into_year_Input, highschool_out_year_Input : highschool_out_year_Input, highschool_desc: highschool_desc , highschoolmajor:highschoolmajor},
		                    success: function(data) { //중복체크 후 반환 값
		                    		$("#highschoolflip").css('display','block');
		      					    $("#highschoolpanel").css('display','none');
		                    		$('#highschooldiv').append(
											'<div id="hischoolprofile">'+
											'<div style="display: table-cell; vertical-align: middle;">'+
													'<img src="resources/friendIcon/profile_highschool.png" width="60px">'+
											'</div>'+
											'<div style="display: table-cell; vertical-align: middle; width: 400px;">'+
													'<span id="highschoolSpan" style="color: blue;">'+highschool+'</span>  <br>'+
													'<span id="highschoolSpan2" style="color: #848484; ">'+highschool_out_year_Input+'</span>졸업'+
												    '-<span id="highschoolSpan3" style="color: #848484; ">'+highschoolmajor+'</span>과'+
													 '<br>'+
													'<span id="highschoolSpan4" style="color: #848484; ">'+highschool_desc+'</span><br>'+
											'</div>'+
											'<div id="highshooldivBtn" style="display: none; vertical-align: middle;"  >'+
													'<a onclick="highschoolModi()">'+
													'<img alt="수정" src="resources/friendIcon/modify.png" width="20px" style="cursor: pointer;">수정</a>'+
													'&nbsp;&nbsp;'+
													'<span  m_num="${list.m_num }" onclick="highschoolDel()" onmouseover="changeBackground(this)" '+
													'onmouseout="changeBackground2(this)"  style="float: right;  margin-right: 30px;'+ 
													'color: black; cursor: pointer;"><b>x</b></span>'+
											'</div>'+
										'</div>');
						      }//success
		               }); //ajax end
		    	}//if end
		    })// $("#schoolInfoSave").click(function() END
		    
		    
		    $('#highschooldiv').mouseover(function(){
		    	$('#highshooldivBtn').css('display','table-cell');
		    	$('#hischoolprofile').css('background-color','#E6E6E6');
		    })
		    
		    $('#highschooldiv').hover(function(){
		    	$('#highshooldivBtn').css('display','none');
		    	$('#hischoolprofile').css('background-color','white');
		    	
		    })
		    
		    function highschoolModi(){
	        	$('#hischoolprofile').css('display','none');
		    	var highschool = $("#highschoolSpan").text();
		    	var highschool_out = $("#highschoolSpan2").text();
		    	var highschoolmajor = $("#highschoolSpan3").text();
		    	  $("#highschoolpanel").css('display','block');
		    	  $('#highautocomplete_school').val(highschool);
		    	  $('#highschoolmajor').val(highschoolmajor);
		    }
	         
	         function highschoolDel(){
				      $("#highschoolSpan").text("");			$("#highschoolSpan2").text("");
				      $("#highschoolSpan3").text("");			$("#highschoolSpan4").text("");
			    	  $('#highautocomplete_school').val();    $('#highschool_desc').val();
			    	  $.ajax({
		                    type: 'post',
		                    url: "delhighSchoolProfile",
		                    success: function(data) { //중복체크 후 반환 값
		                    	if(jQuery.trim(data)=='YES'){
		                    		$("#highschoolflip").css('display','block');
		                    		$('#highshooldivBtn').css('display','none');
		                    		$('#hischoolprofile').remove();
						         }
						      }//success
		               }); //ajax end
			    }
	         
	         //////////////////////////////////////////////////////////////////////////////////
		     /////////////////////대학교 END/////////////////////////////////////////////////
		      ///////////////////////////////////////////////////////////////////////////////// 
	         
	         
	         //////////////////////////////////////////////////////////////////////////////////
		     /////////////////////거주지 START/////////////////////////////////////////////////
		      ///////////////////////////////////////////////////////////////////////////////// 
	         $("#bornflip").click(function(){
	        	 	if($('#bornSpan').val()== null){
	        	 		$("#bornflip").css('display','none');
				        $("#bornpanel").css('display','block');
	        	 	}else{
						alert("거주지 정보는 한 곳만 입력 가능합니다.");
						return false;
					}
			    });
			    
			    $("#bornInfoCancleBtn").click(function(){
			    	$("#bornflip").css('display','block');
			    	$("#bornpanel").css('display','none');
			    }) 
			    
			    
			    $("#bornInfoSaveBtn").click(function(){
			    	var sample3_address=$('#bornsample3_address').val();
			    	$('#bornsample3_address').val("");
			    	if(sample3_address==""){
			    		alert("거주지 정보를 바르게 입력해주세요.");
			    		return false;
			    	}else{
				    	 $.ajax({
			                    type: 'post',
			                    url: "bornInfoSave",
			                    dataType: "text",
			                    data: { sample3_address:sample3_address},
			                    success: function(data) { //중복체크 후 반환 값
			                    		$("#bornflip").css('display','block');
			      					    $("#bornpanel").css('display','none');
			                    		$('#borndiv').append(
			                    				'<div id="bornprofile">'+
			    								'<div style="display: table-cell; vertical-align: middle;">'+
			    									'<img src="resources/friendIcon/house.png" width="60px">'+
			    								'</div>'+
			    								'<div style="display: table-cell; vertical-align: middle; width: 400px;">'+
			    									'<span id="bornSpan" style="color: blue;">${jobList.born }</span>'+
			    									'<font color="#848484"></font> 거주 <br>'+
			    									'<font size="1px" color="#848484">현재 거주지</font>'+
			    								'</div>'+
			    								
			    								'<div id="borndivBtn" style="display: none; vertical-align: middle;"  >'+
			    									'<a onclick="bornModi()">'+
			    									'<img alt="수정" src="resources/friendIcon/modify.png" width="20px" style="cursor: pointer;">수정</a>'+
			    									'&nbsp;&nbsp;'+
			    									'<span  m_num="${list.m_num }" onclick="bornDel()" onmouseover="changeBackground(this)" '+
			    									'onmouseout="changeBackground2(this)"  style="float: right;  margin-right: 30px; '+
			    									'color: black; cursor: pointer;"><b>x</b></span>'+
			    								'</div>'+
			    					'</div>'
			                    				);
			                    		$('#borndiv').css('display','block');
							      }//success
			               }); //ajax end
			    	}//if end
			    })// $("#schoolInfoSave").click(function() END
			    
			    $('#borndiv').mouseover(function(){
		    	$('#borndivBtn').css('display','table-cell');
		    	$('#borndiv').css('background-color','#E6E6E6');
			    })
			    
			    $('#borndiv').hover(function(){
			    	$('#borndivBtn').css('display','none');
			    	$('#borndiv').css('background-color','white');
			    	
			    })
			    
			    
			    
			    
			    function bornModi(){
		    	$('#borndiv').css('display','none');
		    	var bornSpan = $("#bornSpan").text();
		    	  $("#bornpanel").css('display','block');
		    	  $('#bornsample3_address').val(bornSpan);
			    
			    }
		         
		         function bornDel(){
					      $("#bornsample3_address").text("");		
				    	  $.ajax({
			                    type: 'post',
			                    url: "delBornProfile",
			                    success: function(data) { //중복체크 후 반환 값
			                    	if(jQuery.trim(data)=='YES'){
			                    		$("#bornflip").css('display','block');
			                    		$('#borndivBtn').css('display','none');
			                    		$('#bornprofile').remove();
							         }
							      }//success
			               }); //ajax end
				    }
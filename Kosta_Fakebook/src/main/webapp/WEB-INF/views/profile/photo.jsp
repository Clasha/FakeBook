<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.*, edu.kosta.com.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
function openContent(board_num) {
    $('.mw_layer').addClass('open');
    // $('#layer').html(board_num);
    $.ajax({
       type : "GET",
       url : "detail",
       data : ({board_num : board_num}),
       success : function(data) {
          $('#layer').html(data);
       }
    });
 };

 jQuery(function($) {

    var layerWindow = $('.mw_layer');
    // ESC Event
    $(document).keydown(function(event) {
       if (event.keyCode != 27)
          return true;

       if (layerWindow.hasClass('open')) {
          layerWindow.removeClass('open');
       }
       return false;
    });
    // Hide Window

    layerWindow.find('>.bg').mousedown(function(event) {
       var myVideo = document.getElementById("videos");
       if (!$("video:empty")) {
           if (myVideo.paused) {
              myVideo.play();
           } else {
              myVideo.pause();
           }
        }
       layerWindow.removeClass('open');
       
       return false;
    });
 });
</script>

<style>
.mw_layer {
	display: none;
	position: fixed;
	_position: absolute;
	top: 0;
	left: 0;
	z-index: 10000;
	width: 100%;
	height: 100%
}

.mw_layer.open {
	display: block;
}

.mw_layer .bg {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: #000;
	opacity: .5;
	filter: alpha(opacity = 50)
}

#layer {
	position: absolute;
	top: 20px;
	left: 100px;
	width: 1100px;
	height: 600px;
	margin: 0 0;
	padding: 28px 28px 0 28px;
	border: 2px solid #555;
	background: #fff;
	font-size: 12px;
	font-family: Tahoma, Geneva, sans-serif;
	color: #767676;
	line-height: normal;
	white-space: normal
}


ul{ 
	list-style-type: none;	/* 점 없애기*/
 	font-size: 20px;
	padding: 0px;
}

li{ 
	display:inline;		/*  메뉴 모양(세로 -> 가로) 변경 */
	margin:0px;
	padding: 1px;
	font-size: 9pt;
	text-align: center;
	color: white;
}
</style>


<div class="proifile_center">

	<div style="height:80px; background-color:#f6f7f8; ">
		<span style="font-size:16pt;  display: inline-block; margin-left: 20px; margin-top: 20px; font-weight: bold; color: #373e4d;">
			<img alt="" src="${pageContext.request.contextPath}/resources/img/picture_mini.png" style="vertical-align: middle;">
			사진
		</span>
		<!-- <span style="display: inline-block; ">함께 아는 친구</span> -->
	</div>

	<div class="friendList" style="padding: 4px;">
		<c:forEach items="${mypicture}" var="mypicture">
			<div style="width:206px; margin: 1px;  display: inline-block; ">
				<a style="cursor: pointer;" href="#layer" onclick="openContent('${mypicture.board_num}')">
					<img alt="" src="${pageContext.request.contextPath}/resources/upload/${mypicture.picture}" width="206" height="206">
				</a>
			</div>
		</c:forEach>
	</div>
	
</div>

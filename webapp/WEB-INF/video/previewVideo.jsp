<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<div class="modal-body">
	<div class="row-fluid" id="videoList">
		
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn">关闭</button>
	</div>
</div>
<script>
previewVideo("${id}");
function previewVideo(id){
	$.ajax({
		type : 'POST',
		url : './previewVideo',
		dataType : "json",
		data : {
			id : id
		},
		success : function(data) {
			var html = "";
			if(data != null){
				$.each(data, function(tindex, telement) {
					html +=  '<object class id="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="300" height="240">';
					html +=  '<param name="movie" value="'+telement+'">';
					html +=  '<param name="quality" value="high">';
					html +=  '<param name="allowFullScreen" value="true">';
					html +=  '<param name="FlashVars" value="vcastr_file=../media/1234.flv&BufferTime=3&IsAutoPlay=1">';
					html +=  '<embed src="../media/flvplayer.swf" allowfullscreen="true" flashvars="vcastr_file='+telement+'&IsAutoPlay=1" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="500" height="300"></embed>'
					html +=  '</object>';
				});
				document.getElementById("videoList").innerHTML = html;
			}else{
				document.getElementById("videoList").innerHTML = "视频错误";
			}
		}
	})
}
</script>
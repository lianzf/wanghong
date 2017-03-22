<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<div class="modal-body" data-width="720">
	<form id="form_sample_1" action="#" class="form-horizontal dialog" onsubmit="return false;" enctype="multipart/form-data">
		<div class="portlet-body form row-fluid">
			<input type="hidden" id="initID" name="id" value="${video.id}" />
			<div class="control-group">
				<label class="control-label" for="firstName">主播ID<span class="required">*</span></label>
				<div class="controls">
					<input type="text" id="actorId" name="actorId" class="m-wrap span10" placeholder="主播ID" value="${video.actorId}" onblur="getActor();">
					<span id="actorName" class="help-inline"></span>
					<span class="help-inline">从主播库中查找主播ID,必须填写平台中已存在的主播</span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="firstName">视频名称<span class="required">*</span></label>
				<div class="controls">
					<input type="text" name="name" class="m-wrap span10" placeholder="视频名称" value="${video.name}" maxlength="50">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="firstName">所属网站</label>
				<div class="controls">
					<select id="websiteId" name="websiteId" class="m-wrap span10">
						<option value="">所属网站</option>
						<c:forEach items="${websiteList}" var="websiteRegister">
							<c:if test="${websiteRegister.id == video.websiteId }">
								<option value="${websiteRegister.id}" selected="selected">${websiteRegister.websiteName}</option>
							</c:if>
							<c:if test="${websiteRegister.id != video.websiteId }">
								<option value="${websiteRegister.id}">${websiteRegister.websiteName}</option>
							</c:if>
						</c:forEach>
					</select> <span class="help-inline">来源类型请勿修改，尤其是自有直播主播</span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label"><span class="required">*</span>视频预览图</label>
				<div class="controls">
					<div class="fileupload fileupload-new" data-provides="fileupload">
						<div class="fileupload-new thumbnail"
							style="width: 150px; height: 115px;">
							<img src="${video.printscreenPath != null && video.printscreenPath != '' ? imageHref : '../media/image/default-img.png'}" alt="" />
						</div>
						<div class="fileupload-preview fileupload-exists thumbnail"
							style="max-width: 100px; max-height: 75px; line-height: 20px;"></div>
						<div>
							<span class="btn btn-file"> <span class="fileupload-new">选择图片</span>
								<span class="fileupload-exists">更改</span> <input type="file"
								class="default" name="printscreenPath" />
							</span> <a href="#" class="btn fileupload-exists"
								data-dismiss="fileupload">删除</a>
						</div>
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="firstName">是否编辑推荐</label>
				<div class="controls">
					<select id="recommend" name="recommend" class="m-wrap span10"></select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="firstName">视频类型<span
					class="required">*</span></label>
				<div class="controls">
					<select id="mode" name="mode" class="m-wrap span10" onchange="getVideoType()">
					</select>
				</div>
			</div>
			<div id="videoType">
			</div>
		</div>
	</form>
</div>
<div class="modal-footer">
	<button type="button" class="btn green" id="submit_btn">保存</button>
	<button type="button" data-dismiss="modal" class="btn">关闭</button>
</div>
<script>
constructDictionaryOption("RECOMMENT","${video.recommend}","recommend","编辑推荐");
constructDictionaryOption("VIDEO_DOWN_TYPE","${video.mode}","mode","视频类型");
getVideoType();
function getVideoType(){
	var mode = $("#mode").val();
	if("${video != null}"){
		if(mode == '1'){
			$("#videoType").load('../common/doWorkVideo.html',function(){
				$("#videoUrl").attr("src","${videoHref}");
				$("#playCount").val("${video.playCount}");
			});
		}else if(mode == '2'){
			$("#videoType").load('../common/doSpiderVideo.html', function(){
				$("#watchingUrl").val("${video.watchingUrl}");			
			});
		}
	}
}
function getActor(){
	var actorId = $("#actorId").val();
	var isExists = true;
	$.ajax({
		type : 'POST',
		url : "../actor/getActorById",
		dataType : "json",
		async : false,
		data : {id : actorId},
		success : function(obj) {
			if(obj != null){
				$("#actorName").html(obj.nickname);
			}else{
				isExists = false;
			}
		}
	});
	if(!isExists){
		$("#actorName").html("主播不存在");
		$("#actorId").val("");
		$("#actorId").focus();
	}
}

$("#submit_btn").click(function() {
	var id = $("#initID").val();
	if (id != "" && id != null) {
		$("#form_sample_1").attr("action", "./editVideo");
	} else {
		$("#form_sample_1").attr("action", "./addVideo");
	}
	if ($('#form_sample_1').valid()) {
		App.Ajax.submit('form_sample_1', {
			fn : function(json) {
				App.Tables.refresh('portlet');
			}
		});
	}
});
App.validate('form_sample_1', {
	rules : {
		"actorId" : {
			required : true
		},
		"name" : {
			required : true
		},
		"recommend" : {
			required : true
		}
	}
});
</script>
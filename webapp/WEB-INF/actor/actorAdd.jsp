<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<div class="modal-body" data-width="720" >
		<div class="portlet-body form row-fluid">
	<form id="form_sample_1" action="#" class="form-horizontal dialog"
		onsubmit="return false;" enctype="multipart/form-data">
		<input type="hidden" id="initID" name="id" value="${actor.id}" />
		<div class="portlet-body">
			<div class="accordion in collapse" id="accordion1"
				style="height: auto;">
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapse_1"> 主播基本信息
							<i class="icon-angle-right"></i>
						</a>
					</div>
					<div id="collapse_1" class="accordion-body collapse"
						style="height: 0px;">
						<div class="accordion-inner">
							<div class="control-group">
								<label class="control-label">图片<span class="required">*</span></label>
								<div class="controls">
									<div class="fileupload fileupload-new"
										data-provides="fileupload">
										<div class="fileupload-new thumbnail" style="width: 150px; height: 115px;">
											<img src="${actor.icon != null && actor.icon != '' ? imageHref : '../media/image/default-img.png'}" alt="" />
										</div>
										<div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 100px; max-height: 75px; line-height: 20px;"></div>
										<div>
											<span class="btn btn-file"> 
												<span class="fileupload-new">选择图片</span> 
												<span class="fileupload-exists">更改</span> 
												<input type="file" class="default" name="icon" />
											</span> 
											<a href="#" class="btn fileupload-exists" data-dismiss="fileupload">删除</a>
										</div>
									</div>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="firstName">姓名<span class="required">*</span></label>
								<div class="controls">
									<input type="text" name="name" class="m-wrap span10" placeholder="姓名" value="${actor.name}">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="firstName">网名/昵称<span class="required">*</span></label>
								<div class="controls">
									<input type="text" name="nickname" class="m-wrap span10" placeholder="网名/昵称" value="${actor.nickname }">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="firstName">来源<span class="required">*</span></label>
								<div class="controls">
									<select id="websiteId" name="websiteId" class="m-wrap span10">
										<option value="">所属网站</option>
										<c:forEach items="${websiteList}" var="websiteRegister">
											<c:if test="${websiteRegister.id == actor.websiteId }">
												<option value="${websiteRegister.id}" selected="selected">${websiteRegister.websiteName}</option>
											</c:if>
											<c:if test="${websiteRegister.id != actor.websiteId }">
												<option value="${websiteRegister.id}">${websiteRegister.websiteName}</option>
											</c:if>
										</c:forEach>
									</select>
									<span class="help-inline">来源类型请勿修改，尤其是自有直播主播</span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="firstName">性别</label>
								<div class="controls">
									<select id="sex" name="sex" class="m-wrap span10">
										<option value=""></option>
										<option value="1" ${actor.sex == 1 ? "selected" : ""  }>男</option>
										<option value="2" ${actor.sex == 2 ? "selected" : ""  }>女</option>
									</select>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="firstName">生日</label>
								<div class="controls">
									<input type="text" name="birthday" class="m-wrap span10" placeholder="生日" value="${actor.birthday}">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="firstName">星座</label>
								<div class="controls">
									<select id="starSign" name="starSign" class="m-wrap span10">
										<option value=""></option>
										<option value="白羊座" ${actor.starSign == "白羊座" ? "selected" : ""  }>白羊座</option>
										<option value="金牛座" ${actor.starSign == "金牛座" ? "selected" : ""  }>金牛座</option>
										<option value="双子座" ${actor.starSign == "双子座" ? "selected" : ""  }>双子座</option>
										<option value="巨蟹座" ${actor.starSign == "巨蟹座" ? "selected" : ""  }>巨蟹座</option>
										<option value="狮子座" ${actor.starSign == "狮子座" ? "selected" : ""  }>狮子座</option>
										<option value="处女座" ${actor.starSign == "处女座" ? "selected" : ""  }>处女座</option>
										<option value="天秤座" ${actor.starSign == "天秤座" ? "selected" : ""  }>天秤座</option>
										<option value="天蝎座" ${actor.starSign == "天蝎座" ? "selected" : ""  }>天蝎座</option>
										<option value="射手座" ${actor.starSign == "射手座" ? "selected" : ""  }>射手座</option>
										<option value="摩羯座" ${actor.starSign == "摩羯座" ? "selected" : ""  }>摩羯座</option>
										<option value="水瓶座" ${actor.starSign == "水瓶座" ? "selected" : ""  }>水瓶座</option>
										<option value="双鱼座" ${actor.starSign == "双鱼座" ? "selected" : ""  }>双鱼座</option>
									</select>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="firstName">城市</label>
								<div class="controls">
									<input id="city" name="city" class="m-wrap span10" value="${actor.city }" placeholder="30个字以内" maxlength="30" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="firstName">职业</label>
								<div class="controls">
									<input id="job" name="profession" class="m-wrap span10" value="${actor.profession }" maxlength="30" placeholder="30个字以内" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="firstName">爱好</label>
								<div class="controls">
									<input id="hobby" name="fun" class="m-wrap span10" value="${actor.fun }" maxlength="30" placeholder="30个字以内" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="firstName">身高</label>
								<div class="controls">
									<input type="number" class="m-wrap span10" name="hight" value="${actor.hight}" maxlength="4" placeholder="厘米" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="firstName">体重</label>
								<div class="controls">
									<input type="number" class="m-wrap span10" name="weight" value="${actor.weight}" maxlength="4" placeholder="千克" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="firstName">微博</label>
								<div class="controls">
									<input id="hobby" name="blogurl" class="m-wrap span10" value="${actor.blogurl }" maxlength="50" placeholder="50个字以内" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapse_2"> 
						主播平台信息<i class="icon-angle-right"></i>
						</a>
					</div>
					<div id="collapse_2" class="accordion-body collapse" style="height: 0px;">
						<div class="accordion-inner">
							<div class="control-group">
								<label class="control-label" for="firstName">状态</label>
								<div class="controls">
									<select id='ostate' name="state" class="m-wrap span10">
										<c:forEach items="${stateGroupList}" var="selectGroup">
											<c:if test="${selectGroup.id == actor.state }">
												<option value="${selectGroup.id}" selected="selected">${selectGroup.name}</option>
											</c:if>
											<c:if test="${selectGroup.id != actor.state }">
												<option value="${selectGroup.id}">${selectGroup.name}</option>
											</c:if>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="firstName">是否编辑推荐</label>
								<div class="controls">
									<select id="orecommend" name="recommend" class="m-wrap span10">
										<c:forEach items="${recommentGroupList}" var="selectGroup">
											<c:if test="${selectGroup.id == actor.recommend }">
												<option value="${selectGroup.id}" selected="selected">${selectGroup.name}</option>
											</c:if>
											<c:if test="${selectGroup.id != actor.recommend }">
												<option value="${selectGroup.id}">${selectGroup.name}</option>
											</c:if>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="firstName">房间地址</label>
								<div class="controls">
									<input name="roomUrl" type="text" class="m-wrap span10" placeholder="房间地址" value="${actor.roomUrl }">
									<span class="help-inline">自有直播主播内容不要修改房间地址</span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="firstName">评论1</label>
								<div class="controls">
									<input type="hidden" name="comment1Id" value="${comment1.id }">
									<textarea name="comment1" rows="" cols="" class="m-wrap span10">${comment1.content }</textarea>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="firstName">评论2</label>
								<div class="controls">
									<input type="hidden" name="comment2Id" value="${comment2.id }">
									<textarea name="comment2" rows="" cols="" class="m-wrap span10">${comment2.content }</textarea>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="firstName">简介</label>
								<div class="controls">
									<textarea name="introduction" rows="" cols=""
										class="m-wrap span10">${actor.introduction }</textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<div class="modal-footer">
	<button type="button" class="btn green" id="submit_btn">保存</button>
	<button type="button" data-dismiss="modal" class="btn">关闭</button>
</div>
<script>
	$("#submit_btn").click(function() {
		var id = $("#initID").val();
		if (id != "" && id != null) {
			$("#form_sample_1").attr("action", "./editActor");
		} else {
			$("#form_sample_1").attr("action", "./addActor");
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
			"name" : {
				required : true
			},
			"nickname" : {
				required : true
			},
            "websiteId" : {
                required : true
        	}
		}
	});
</script>
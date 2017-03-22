<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal-body" data-width="720" >
		<div class="portlet-body form row-fluid">
	<form id="form_sample_1" action="#" class="form-horizontal dialog"
		onsubmit="return false;" enctype="multipart/form-data">
		<div class="portlet-body">
			<div class="accordion in collapse" id="accordion1"
				style="height: auto;">
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapse_1"> 主播基本信息
							<i class="icon-angle-right"></i>
						</a>
					</div>
					<!-- http://www.runoob.com/bootstrap/bootstrap-collapse-plugin.html 折叠控件 
					我在代码分析中，点中accordion-body in collapse属性，可以看到点击前后的变化。
					虽然加了 in 还是不能默认打开，后来发现是height没有设置auto的问题
					-->
					<div id="collapse_1" class="accordion-body in collapse"
						style="height: auto;">
							<div class="accordion-inner">
 							<div class="control-group">
								<label class="control-label">图片<span class="required">*</span></label>
								<div class="controls">
									<div class="fileupload fileupload-new"
										data-provides="fileupload">
										<div class="fileupload-new thumbnail" style="width:150px; height: 115px;">
											<img src="../media/image/default-img.png" alt="" />
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
								<label class="control-label" for="firstName">真实姓名<span class="required">*</span></label>
								<div class="controls">
									<input type="text" name="name" class="m-wrap span10" placeholder="真实姓名，18字符以内" value="" maxlength="18">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="firstName">网名/昵称<span class="required">*</span></label>
								<div class="controls">
									<input type="text" name="nickname" class="m-wrap span10" placeholder="网名/昵称，18字符以内" value="" maxlength="18">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="firstName">手机号<span class="required">*</span></label>
								<div class="controls">
									<input type="number" name="phone" class="m-wrap span10" placeholder="手机号，11字符以内" value="" maxlength="11">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="firstName">初始密码<span class="required">*</span></label>
								<div class="controls">
									<input type="text" name="password" class="m-wrap span10" placeholder="" value="" maxlength="32">
								</div>
							</div>
						
							<div class="control-group">
								<label class="control-label" for="firstName">个性签名</span></label>
								<div class="controls">
									<input type="text" name="signature" class="m-wrap span10" placeholder="个性签名，最长54字符" value="" maxlength="54">
								</div>
							</div>
						
							<div class="control-group">
								<label class="control-label" for="firstName">自我介绍</label>
								<div class="controls">
									<textarea name="introduction" rows="" cols="" class="m-wrap span10"  placeholder="自我介绍，最长128字符" maxlength="128"></textarea>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="firstName">性别</label>
								<div class="controls">
									<select id="sex" name="sex" class="m-wrap span10">
										<option value="2" selected}>女</option>
										<option value="1" }>男</option>
									</select>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="firstName">年龄</label>
								<div class="controls">
									<select id="sex" name="sex" class="m-wrap span10">
										<option value="16" }>16岁</option>
										<option value="17" }>17岁</option>
										<option value="18" }>18岁</option>
										<option value="19" }>19岁</option>
										<option value="20" }>20岁</option>
										<option value="21" }>21岁</option>
										<option value="22" }>22岁</option>
										<option value="23" }>23岁</option>
										<option value="24" }>24岁</option>
										<option value="25" }>25岁</option>
										<option value="26" }>26岁</option>
										<option value="27" }>27岁</option>
										<option value="28" }>28岁</option>
										<option value="29" }>29岁</option>
										<option value="30" }>30岁</option>
										<option value="31" }>31岁</option>
										<option value="32" }>32岁</option>
										<option value="33" }>33岁</option>
										<option value="34" }>34岁</option>
										<option value="35" }>35岁</option>
										<option value="36" }>36岁</option>
									</select>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="firstName">省</label>
								<div class="controls">
									<input id="provice" name="provice" class="m-wrap span10" value="" placeholder="16个字以内" maxlength="16" />
								</div>
							</div>								
							<div class="control-group">
								<label class="control-label" for="firstName">城市</label>
								<div class="controls">
									<input id="city" name="city" class="m-wrap span10" value="" placeholder="30个字以内" maxlength="30" />
								</div>
							</div>
							
					</div>
				</div>			
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapse_2"> 
						平台运营信息<i class="icon-angle-right"></i>
						</a>
					</div>
					<div id="collapse_2" class="accordion-body in collapse" style="height: auto;">
						<div class="accordion-inner">
							<!-- 这里开始 -->
							<div class="control-group">
								<label class="control-label" for="firstName">渠道<span class="required">*</span></label>
								<div class="controls">
									<input type="text" name="channel" class="m-wrap span10" placeholder="" value="" maxlength="32">
								</div>
							</div>	
							<div class="control-group">
								<label class="control-label" for="firstName">价格</span></label>
								<div class="controls">
									<input type="number" name="price" class="m-wrap span10" placeholder="打包购买价格(元)，整数" value="" maxlength="3">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="firstName">分成比例</label>
								<div class="controls">
									<input type="number" name="fenchengbi" class="m-wrap span10" placeholder="分成比例，整数，32%则填入32" value="" maxlength="2">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="firstName">银行账户信息</label>
								<div class="controls">
									<input type="text" name="bankAccount" class="m-wrap span10" placeholder="主播结算账号信息" value="" maxlength="32">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="firstName">状态</label>
								<div class="controls">
									<select id="state" name="state" class="m-wrap span10">
										<option value="1" selected}>启用账号</option>
										<option value="2" }>停用账号</option>
										
									</select>
								</div>
							</div>							
							<div class="control-group">
								<label class="control-label" for="firstName">信息备注</label>
								<div class="controls">
									<textarea name="remarks" rows="" cols="" class="m-wrap span10"  placeholder="备注" maxlength="128"></textarea>
								</div>
							</div>																		
						</div>
					</div>
				</div>												
				<!-- div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapse_2"> 
						主播平台信息<i class="icon-angle-right"></i>
						</a>
					</div>
					
				</div-->
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
            "phone" : {
                required : true
        	},
            "password" : {
                required : true
        	},
            "channel" : {
                required : true
        	}
		}
	});
</script>
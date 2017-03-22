package com.wanghong.po;


public class Actor {
	private Integer id;
	private String name;
	private String nickname;
	private String icon;
	private String signature;
	private String introduction;
	private Integer price;
	private Integer state;
	private Integer sex;
	private Integer age;
	private String provice;
	private String city;
	private String phone;
	private String password;
	private String channel;
	private Integer fenchengbi;
	private String bankAccount;
	private String remarks;
	private String qq;
	private String wechat;
	private String creator;
	private java.util.Date createTime;
	private java.util.Date updateTime;
	
	public void setId(Integer value) {
		this.id = value;
	}
	
	public Integer getId() {
		return this.id;
	}
	public void setName(String value) {
		this.name = value;
	}
	
	public String getName() {
		return this.name;
	}
	public void setNickname(String value) {
		this.nickname = value;
	}
	
	public String getNickname() {
		return this.nickname;
	}
	public void setIcon(String value) {
		this.icon = value;
	}
	
	public String getIcon() {
		return this.icon;
	}
	public void setSignature(String value) {
		this.signature = value;
	}
	
	public String getSignature() {
		return this.signature;
	}
	public void setIntroduction(String value) {
		this.introduction = value;
	}
	
	public String getIntroduction() {
		return this.introduction;
	}
	public void setPrice(Integer value) {
		this.price = value;
	}
	
	public Integer getPrice() {
		return this.price;
	}
	public void setState(Integer value) {
		this.state = value;
	}
	
	public Integer getState() {
		return this.state;
	}
	public void setSex(Integer value) {
		this.sex = value;
	}
	
	public Integer getSex() {
		return this.sex;
	}
	public void setProvice(String value) {
		this.provice = value;
	}
	
	public String getProvice() {
		return this.provice;
	}
	public void setCity(String value) {
		this.city = value;
	}
	
	public String getCity() {
		return this.city;
	}
	public void setPhone(String value) {
		this.phone = value;
	}
	
	public String getPhone() {
		return this.phone;
	}
	public void setPassword(String value) {
		this.password = value;
	}
	
	public String getPassword() {
		return this.password;
	}
	public void setChannel(String value) {
		this.channel = value;
	}
	
	public String getChannel() {
		return this.channel;
	}
	public void setFenchengbi(Integer value) {
		this.fenchengbi = value;
	}
	
	public Integer getFenchengbi() {
		return this.fenchengbi;
	}
	public void setBankAccount(String value) {
		this.bankAccount = value;
	}
	
	public String getBankAccount() {
		return this.bankAccount;
	}
	public void setRemarks(String value) {
		this.remarks = value;
	}
	
	public String getRemarks() {
		return this.remarks;
	}
	public void setQq(String value) {
		this.qq = value;
	}
	
	public String getQq() {
		return this.qq;
	}
	public void setWechat(String value) {
		this.wechat = value;
	}
	
	public String getWechat() {
		return this.wechat;
	}
	public void setCreator(String value) {
		this.creator = value;
	}
	
	public String getCreator() {
		return this.creator;
	}
	public void setCreateTime(java.util.Date value) {
		this.createTime = value;
	}
	
	public java.util.Date getCreateTime() {
		return this.createTime;
	}
	public void setUpdateTime(java.util.Date value) {
		this.updateTime = value;
	}
	
	public java.util.Date getUpdateTime() {
		return this.updateTime;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	@Override
    public String toString() {
	    return "Actor [id=" + id + ", name=" + name + ", nickname=" + nickname + ", icon=" + icon + ", signature=" + signature + ", introduction=" + introduction + ", price=" + price + ", state=" + state + ", sex=" + sex + ", age=" + age + ", provice=" + provice + ", city=" + city + ", phone=" + phone + ", password=" + password + ", channel=" + channel + ", fenchengbi=" + fenchengbi + ", bankAccount=" + bankAccount + ", remarks=" + remarks + ", qq=" + qq + ", wechat=" + wechat + ", creator=" + creator + ", createTime=" + createTime + ", updateTime=" + updateTime + "]";
    }
}


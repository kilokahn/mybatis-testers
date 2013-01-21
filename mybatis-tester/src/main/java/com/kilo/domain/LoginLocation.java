package com.kilo.domain;

import com.kilo.domain.code.LoginLocationSiteCode;

public class LoginLocation {

	private Long loginLocationId;

	private String ipAddress;

	private LoginLocationSiteCode site;

	public Long getLoginLocationId() {
		return loginLocationId;
	}

	public void setLoginLocationId(Long loginLocationId) {
		this.loginLocationId = loginLocationId;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public LoginLocationSiteCode getSite() {
		return site;
	}

	public void setSite(LoginLocationSiteCode site) {
		this.site = site;
	}
}

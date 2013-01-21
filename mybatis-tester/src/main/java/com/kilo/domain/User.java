package com.kilo.domain;

import java.util.List;
import java.util.Set;

public class User {

	private Integer userId;

	private String userName;

	private List<ReferralSource> referralSources;

	private List<String> loginIpAddresses;

	private List<LoginLocation> loginLocations;
	
	private Set<String> uniqueSites;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public List<ReferralSource> getReferralSources() {
		return referralSources;
	}

	public void setReferralSources(List<ReferralSource> referralSources) {
		this.referralSources = referralSources;
	}

	public List<String> getLoginIpAddresses() {
		return loginIpAddresses;
	}

	public void setLoginIpAddresses(List<String> loginIpAddresses) {
		this.loginIpAddresses = loginIpAddresses;
	}

	public List<LoginLocation> getLoginLocations() {
		return loginLocations;
	}

	public void setLoginLocations(List<LoginLocation> loginLocations) {
		this.loginLocations = loginLocations;
	}

	public Set<String> getUniqueSites() {
		return uniqueSites;
	}

	public void setUniqueSites(Set<String> uniqueLoginIpAddresses) {
		this.uniqueSites = uniqueLoginIpAddresses;
	}
}

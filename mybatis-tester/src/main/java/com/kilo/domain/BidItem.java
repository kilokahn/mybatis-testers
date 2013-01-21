package com.kilo.domain;

public class BidItem {

	private Long bidItemId;

	private BidItemCategory bidItemCategory;

	private String name;

	private String description;

	public Long getBidItemId() {
		return bidItemId;
	}

	public void setBidItemId(Long bidItemId) {
		this.bidItemId = bidItemId;
	}

	public BidItemCategory getBidItemCategory() {
		return bidItemCategory;
	}

	public void setBidItemCategory(BidItemCategory bidItemCategory) {
		this.bidItemCategory = bidItemCategory;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}

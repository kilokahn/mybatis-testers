
package com.kilo.domain.dto;

import java.math.BigDecimal;

import com.kilo.domain.BidItemCategory;

public class BidItemCategoryAvgBidPrice {

    private BidItemCategory bidItemCategory;

    private BigDecimal avgBidPrice;

    public BidItemCategory getBidItemCategory() {
        return bidItemCategory;
    }

    public void setBidItemCategory(BidItemCategory bidItemCategory) {
        this.bidItemCategory = bidItemCategory;
    }

    public BigDecimal getAvgBidPrice() {
        return avgBidPrice;
    }

    public void setAvgBidPrice(BigDecimal avgBidPrice) {
        this.avgBidPrice = avgBidPrice;
    }
}

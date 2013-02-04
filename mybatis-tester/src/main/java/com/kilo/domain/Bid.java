
package com.kilo.domain;

import java.math.BigDecimal;
import java.util.Date;

public class Bid {

    private Long bidId;

    private BidItem bidItem;

    private User user;

    private Date bidTime;

    private Boolean isWinningBid;

    private BigDecimal bidPrice;

    public Long getBidId() {
        return bidId;
    }

    public void setBidId(Long bidId) {
        this.bidId = bidId;
    }

    public BidItem getBidItem() {
        return bidItem;
    }

    public void setBidItem(BidItem bidItem) {
        this.bidItem = bidItem;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getBidTime() {
        return bidTime;
    }

    public void setBidTime(Date bidTime) {
        this.bidTime = bidTime;
    }

    public Boolean getIsWinningBid() {
        return isWinningBid;
    }

    public void setIsWinningBid(Boolean isWinningBid) {
        this.isWinningBid = isWinningBid;
    }

    public BigDecimal getBidPrice() {
        return bidPrice;
    }

    public void setBidPrice(BigDecimal bidPrice) {
        this.bidPrice = bidPrice;
    }
}

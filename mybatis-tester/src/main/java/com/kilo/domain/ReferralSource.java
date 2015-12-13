
package com.kilo.domain;

public class ReferralSource {

    private Integer referralSourceId;

    private String name;

    public ReferralSource(Integer referralSourceId, String name) {
        super();
        this.referralSourceId = referralSourceId;
        this.name = name;
    }

    public Integer getReferralSourceId() {
        return referralSourceId;
    }

    public void setReferralSourceId(Integer referralSourceId) {
        this.referralSourceId = referralSourceId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

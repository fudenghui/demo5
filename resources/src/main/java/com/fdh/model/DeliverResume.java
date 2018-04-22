package com.fdh.model;

/**
 * Created by Administrator on 2018/4/22 0022.
 */
public class DeliverResume {
    private int id;
    private int resumeId;
    private int recruitId;
    private int userId;

    public DeliverResume() {
    }

    public DeliverResume(int id, int resumeId, int recruitId, int userId) {
        this.id = id;
        this.resumeId = resumeId;
        this.recruitId = recruitId;
        this.userId = userId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getResumeId() {
        return resumeId;
    }

    public void setResumeId(int resumeId) {
        this.resumeId = resumeId;
    }

    public int getRecruitId() {
        return recruitId;
    }

    public void setRecruitId(int recruitId) {
        this.recruitId = recruitId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}

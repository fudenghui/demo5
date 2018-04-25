package com.fdh.model;

import java.util.List;

/**
 * Created by Administrator on 2018/4/23 0023.
 */
public class Depart {
    private int id;
    private String departName;
    private List<Position> positions;

    public Depart() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDepartName() {
        return departName;
    }

    public void setDepartName(String departName) {
        this.departName = departName;
    }

    public List<Position> getPositions() {
        return positions;
    }

    public void setPositions(List<Position> positions) {
        this.positions = positions;
    }
}

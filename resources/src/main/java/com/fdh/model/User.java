package com.fdh.model;

/**
 * Created by Administrator on 2018/4/20 0020.
 */
public class User {
    private int id;
    private String name;
    private String pass;
    private int level;

    public User() {
    }

    public User(int id, String name, String pass, int level) {
        this.id = id;
        this.name = name;
        this.pass = pass;
        this.level = level;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", pass='" + pass + '\'' +
                ", level=" + level +
                '}';
    }
}

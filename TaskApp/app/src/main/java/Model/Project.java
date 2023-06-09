/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author mptri
 */
public class Project {
    private int id;
    private String name;
    private String description;
    private Date createdAt;
    private Date alteredAt;

    public Project(int id, String name, String description, Date createdAt, Date alteredAt) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.createdAt = createdAt;
        this.alteredAt = alteredAt;
    }

    public Project(){
        this.createdAt = new Date();
    }
    
    
    @Override
    public String toString() {
        return "Project{" + "id=" + id + ", name=" + name + ", description=" + description + ", createdAt=" + createdAt + ", alteredAt=" + alteredAt + '}';
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getAlteredAt() {
        return alteredAt;
    }

    public void setAlteredAt(Date alteredAt) {
        this.alteredAt = alteredAt;
    }

    public void setDate(java.sql.Date date) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}

package com.rokgames.model;

import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;

/**
 * Created by Dare on 12/03/2016.
 */
@Entity
public class Game {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int gameID;
    private String Name;
    private String Manufacturer;
    private String Category;
    private String Version;
    private String Description;
    private String Trailer_location;
    private String Download_link;
    private String Requirements;
    @Transient
    private MultipartFile gameImage;

    public String getCategory() {
        return Category;
    }

    public void setCategory(String category) {
        Category = category;
    }

    public int getGameID() {
        return gameID;
    }

    public void setGameID(int gameID) {
        this.gameID = gameID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getManufacturer() {
        return Manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        Manufacturer = manufacturer;
    }

    public String getVersion() {
        return Version;
    }

    public void setVersion(String version) {
        Version = version;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getTrailer_location() {
        return Trailer_location;
    }

    public void setTrailer_location(String trailer_location) {
        Trailer_location = trailer_location;
    }

    public String getDownload_link() {
        return Download_link;
    }

    public void setDownload_link(String download_link) {
        Download_link = download_link;
    }

    public String getRequirements() {
        return Requirements;
    }

    public void setRequirements(String requirements) {
        Requirements = requirements;
    }

    public MultipartFile getGameImage() {
        return gameImage;
    }

    public void setGameImage(MultipartFile gameImage) {
        this.gameImage = gameImage;
    }
}

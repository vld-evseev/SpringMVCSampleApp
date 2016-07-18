package com.springapp.mvc.entity;

import javax.persistence.*;

@Entity
@Table(name = "track")
public class Track {

    public Track() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "position")
    private int position;

    @Column(name = "name")
    private String name;

    @Column(name = "length")
    private String length;

    @ManyToOne
    @JoinColumn(name = "album_id")
    private Album album;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLength() {
        return length;
    }

    public void setLength(String length) {
        this.length = length;
    }

    public Album getAlbum() {
        return album;
    }

    public void setAlbum(Album album) {
        this.album = album;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Track track = (Track) o;

        if (position != track.position) return false;
        if (id != null ? !id.equals(track.id) : track.id != null) return false;
        if (name != null ? !name.equals(track.name) : track.name != null) return false;
        if (length != null ? !length.equals(track.length) : track.length != null) return false;
        return album != null ? album.equals(track.album) : track.album == null;

    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + position;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (length != null ? length.hashCode() : 0);
        result = 31 * result + (album != null ? album.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Track{" +
                "id=" + id +
                ", position=" + position +
                ", name='" + name + '\'' +
                ", length='" + length + '\'' +
                '}';
    }
}

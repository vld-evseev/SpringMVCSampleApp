package com.springapp.mvc.service;

import com.springapp.mvc.entity.Album;
import com.springapp.mvc.entity.Artist;

import java.util.List;

public interface AlbumService {

    Album saveOrUpdate(Album album);

    Album get(int id);

    void delete(int id);

    Album getByName(String name);

    List<Album> getAll();

    Long count();

    List<Album> findByArtist(Artist artist);

}

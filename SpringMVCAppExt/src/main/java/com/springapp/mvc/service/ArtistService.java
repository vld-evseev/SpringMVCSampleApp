package com.springapp.mvc.service;

import com.springapp.mvc.entity.Artist;

import java.util.List;

public interface ArtistService {

    Artist saveOrUpdate(Artist artist);

    void delete(int artist_id);

    Artist getByName(String name);

    Artist get(int artist_id);

    List<Artist> getAll();

    Long count();

}

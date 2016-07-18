package com.springapp.mvc.service;

import com.springapp.mvc.entity.Album;
import com.springapp.mvc.entity.Track;

import java.util.List;

public interface TrackService {

    Track saveOrUpdate(Track track);

    Track get(Long id);

    void delete(Long id);

    Track getByName(String name);

    List<Track> getAll();

    Long count();

    List<Track> findByAlbum(Album album);

}

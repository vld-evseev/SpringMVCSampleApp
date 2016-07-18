package com.springapp.mvc.service.impl;

import com.springapp.mvc.entity.Album;
import com.springapp.mvc.entity.Track;
import com.springapp.mvc.repository.TrackRepository;
import com.springapp.mvc.service.TrackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class TrackServiceImpl implements TrackService {

    @Autowired
    private TrackRepository trackRepository;

    @Override
    public Track saveOrUpdate(Track track) {
        return trackRepository.saveAndFlush(track);
    }

    @Override
    public Track get(Long id) {
        return trackRepository.findOne(id);
    }

    @Override
    public void delete(Long id) {
        trackRepository.delete(id);
    }

    @Override
    public Track getByName(String name) {
        return trackRepository.findByName(name);
    }

    @Override
    public List<Track> getAll() {
        return trackRepository.findAll();
    }

    @Override
    public Long count() {
        return trackRepository.count();
    }

    @Override
    public List<Track> findByAlbum(Album album) {
        return trackRepository.findByAlbumOrderByPositionAsc(album);
    }
}

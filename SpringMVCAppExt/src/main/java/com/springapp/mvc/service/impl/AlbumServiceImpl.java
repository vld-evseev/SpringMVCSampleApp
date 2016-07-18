package com.springapp.mvc.service.impl;

import com.springapp.mvc.entity.Album;
import com.springapp.mvc.entity.Artist;
import com.springapp.mvc.repository.AlbumRepository;
import com.springapp.mvc.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AlbumServiceImpl implements AlbumService {

    @Autowired
    private AlbumRepository albumRepository;

    @Override
    public Album saveOrUpdate(Album album) {
        return albumRepository.saveAndFlush(album);
    }

    @Override
    public Album get(int id) {
        return albumRepository.findOne(id);
    }

    @Override
    public void delete(int id) {
        albumRepository.delete(id);
    }

    @Override
    public Album getByName(String name) {
        return albumRepository.findByName(name);
    }

    @Override
    public List<Album> getAll() {
        Sort sort = new Sort(Sort.Direction.ASC, "year");
        return albumRepository.findAll(sort);
    }

    @Override
    public Long count() {
        return albumRepository.count();
    }

    @Override
    public List<Album> findByArtist(Artist artist) {
        return albumRepository.findByArtist(artist);
    }
}

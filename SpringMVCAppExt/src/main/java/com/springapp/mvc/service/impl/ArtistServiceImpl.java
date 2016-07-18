package com.springapp.mvc.service.impl;

import com.springapp.mvc.entity.Artist;
import com.springapp.mvc.repository.ArtistRepository;
import com.springapp.mvc.service.ArtistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ArtistServiceImpl implements ArtistService {

    @Autowired
    private ArtistRepository artistRepository;

    @Override
    public Artist saveOrUpdate(Artist artist) {
        return artistRepository.saveAndFlush(artist);
    }

    @Override
    public void delete(int artist_id) {
        artistRepository.delete(artist_id);
    }

    @Override
    public Artist getByName(String name) {
        return artistRepository.findByName(name);
    }

    @Override
    public Artist get(int artist_id) {
        return artistRepository.findOne(artist_id);
    }

    @Override
    public List<Artist> getAll() {
        Sort sort = new Sort(Sort.Direction.ASC, "name");
        return artistRepository.findAll(sort);
    }

    @Override
    public Long count() {
        return artistRepository.count();
    }

}

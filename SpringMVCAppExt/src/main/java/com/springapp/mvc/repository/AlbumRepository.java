package com.springapp.mvc.repository;

import com.springapp.mvc.entity.Album;
import com.springapp.mvc.entity.Artist;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface AlbumRepository extends JpaRepository<Album, Integer> {

    Album findByName(@Param("name") String name);

    List<Album> findByArtist(@Param("artist") Artist artist);
}

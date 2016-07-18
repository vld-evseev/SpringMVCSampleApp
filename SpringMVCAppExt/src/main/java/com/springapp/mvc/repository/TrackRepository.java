package com.springapp.mvc.repository;

import com.springapp.mvc.entity.Album;
import com.springapp.mvc.entity.Track;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TrackRepository extends JpaRepository<Track, Long> {

    Track findByName(@Param("name") String name);

    List<Track> findByAlbumOrderByPositionAsc(@Param("album") Album album);

}

package com.springapp.mvc.repository;

import com.springapp.mvc.entity.Artist;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

public interface ArtistRepository extends JpaRepository<Artist, Integer> {

    Artist findByName(@Param("name") String name);

}

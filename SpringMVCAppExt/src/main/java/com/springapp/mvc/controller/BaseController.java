package com.springapp.mvc.controller;

import com.springapp.mvc.entity.Album;
import com.springapp.mvc.entity.Artist;
import com.springapp.mvc.entity.Track;
import com.springapp.mvc.service.AlbumService;
import com.springapp.mvc.service.ArtistService;
import com.springapp.mvc.service.TrackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/")
@Transactional
public class BaseController {

    @Autowired
    private ArtistService artistService;

    @Autowired
    private AlbumService albumService;

    @Autowired
    private TrackService trackService;

    private int tracksCount = 0;

    /*
        MAIN VIEW
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(ModelMap model) {
        populateMenuBar(model);
        return "main";
    }

    /*
        ARTIST PROFILE VIEW
     */
    @RequestMapping(value = "/artistProfile/{artistId}", method = RequestMethod.GET)
    public String artistProfile(@PathVariable("artistId") Integer artistId, ModelMap model) {
        populateMenuBar(model);

        Artist artist = artistService.get(artistId);
        List<Album> albums = albumService.findByArtist(artist);

        model.addAttribute("artist", artist);
        model.addAttribute("albums", albums);

        return "artistProfile";
    }

    /*
        INIT NEW ARTIST FORM
     */
    @RequestMapping(value = "/artist/new", method = RequestMethod.GET)
    public String initArtistCreationForm(ModelMap model) {
        populateDefaultModel(model);
        populateMenuBar(model);

        Artist artist = new Artist();
        artist.setName("artist1");
        artist.setGender("male");
        artist.setType("person");
        model.addAttribute("artistForm", artist);

        return "artistEditForm";
    }

    /*
        POST NEW ARTIST FORM
     */
    @RequestMapping(value = "/artist/new", method = RequestMethod.POST)
    public String processArtistCreationForm(@ModelAttribute("artistForm") Artist artist, BindingResult result, ModelMap model) {
        if (result.hasErrors()) {
            populateDefaultModel(model);
            return "artistEditForm";
        } else {
            artistService.saveOrUpdate(artist);
            return "redirect:/artistProfile/" + artist.getId();
        }
    }

    /*
        ARTIST UPDATE FORM
     */
    @RequestMapping(value = "/artistProfile/{artistId}/update", method = RequestMethod.GET)
    public String showUpdateArtistForm(@PathVariable("artistId") Integer artistId, ModelMap model) {
        populateDefaultModel(model);
        populateMenuBar(model);

        Artist artist = artistService.get(artistId);
        model.addAttribute("artistForm", artist);

        return "artistEditForm";
    }

    /*
        DELETE ARTIST
     */
    @RequestMapping(value = "/delete/{artistId}")
    public String deleteArtist(@PathVariable("artistId") Integer artistId) {
        artistService.delete(artistId);
        return "redirect:/";
    }

    /*
        INIT NEW ALBUM FORM
     */
    @RequestMapping(value = "/artistProfile/{artistId}/addAlbum", method = RequestMethod.GET)
    public String initAlbumCreationForm(@PathVariable("artistId") Integer artistId, ModelMap model) {
        populateDefaultModel(model);
        populateMenuBar(model);

        Artist artist = artistService.get(artistId);
        model.addAttribute("artist", artist);

        Album album = populateNewAlbum(artist);

        model.addAttribute("albumForm", album);
        model.addAttribute("albumId", 0);

        return "albumEditForm";
    }

    /*
        POST NEW ALBUM FORM
     */
    @RequestMapping(value = "/artistProfile/{artistId}/addAlbum", method = RequestMethod.POST)
    public String processAlbumCreationForm(@PathVariable("artistId") Integer artistId,
                                           @ModelAttribute("albumForm") Album album,
                                           BindingResult albumResult,
                                           ModelMap model) {
        if (albumResult.hasErrors()) {
            populateDefaultModel(model);
            return "albumEditForm";
        } else {
            album.setArtist(artistService.get(artistId));

            List<Track> trackList = album.getTracks();
            if (trackList != null) {
                removeNullTracks(trackList);

                for (Track track : trackList) {
                    track.setAlbum(album);
                    if (track.getId() != null) {
                        trackService.saveOrUpdate(track);
                    }
                }
                album.setTracks(trackList);
            }

            albumService.saveOrUpdate(album);

            model.addAttribute("albumForm", album);
            return "redirect:/artistProfile/" + album.getArtist().getId();
        }
    }

    /*
        ALBUM UPDATE FORM
     */
    @RequestMapping(value = "/artistProfile/{artistId}/editAlbum/{albumId}", method = RequestMethod.GET)
    public String showUpdateAlbumForm(@PathVariable("artistId") Integer artistId,
                                      @PathVariable("albumId") Integer albumId,
                                      ModelMap model) {
        populateMenuBar(model);

        Album album = albumService.get(albumId);

        tracksCount = album.getTracks().size();

        model.addAttribute("albumForm", album);
        model.addAttribute("albumId", album.getId());
        return "albumEditForm";
    }

    /*
        DELETE ALBUM
     */
    @RequestMapping(value = "/artistProfile/{artistId}/deleteAlbum/{albumId}")
    public String deleteAlbum(@PathVariable("artistId") Integer artistId,
                              @PathVariable("albumId") Integer albumId) {
        albumService.delete(albumId);
        return "redirect:/artistProfile/" + artistId;
    }

    @RequestMapping(value = "/appendTrackInputFragment", method = RequestMethod.GET)
    protected String appendTrackInputFragment(@RequestParam Integer fieldId,
                                              @RequestParam Integer status,
                                              @RequestParam Integer albumId,
                                              @RequestParam Integer artistId,
                                              ModelMap model) {
        try {
            Album album = albumService.get(albumId);

            if (album == null) {
                album = populateNewAlbum(artistService.get(albumId));
            }

            Track track = new Track();

            track.setPosition(fieldId);
            track.setName("track" + fieldId);
            track.setLength("00:00:00");
            track.setAlbum(album);

            tracksCount++;

            if (album.getTracks().isEmpty()) {
                List<Track> trackList = new ArrayList<>();
                trackList.add(track);
                album.setTracks(trackList);
            }

            model.addAttribute("fieldId", fieldId);
            model.addAttribute("tracksCount", tracksCount);
            model.addAttribute("statusValue", status);
            model.addAttribute("albumForm", album);
            model.addAttribute("track", track);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "trackInputFragment";
    }

    @RequestMapping(value = "/removeTrackInputFragment", method = RequestMethod.GET)
    protected String removeTrackInputFragment(@RequestParam String fieldId,
                                              @RequestParam Integer albumId,
                                              @RequestParam Integer artistId,
                                              ModelMap model) {
        try {
            int trackId = Integer.valueOf(fieldId.replaceFirst("Tr", ""));

            Album album = albumService.get(albumId);
            List<Track> tracks = trackService.findByAlbum(album);
            trackService.delete(tracks.get(trackId).getId());

            album.setTracks(tracks);

            tracksCount--;

            model.addAttribute("fieldId", fieldId);
            model.addAttribute("albumForm", album);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/artistProfile/" + artistId + "/editAlbum/" + albumId;
    }

    /*
        Helper methods
     */
    private void removeNullTracks(List<Track> tracks) {
        List<Track> nullTracks = new ArrayList<>();

        for (Track track : tracks) {
            if (track.getPosition() == 0 &&
                    track.getName() == null &&
                    track.getLength() == null &&
                    track.getAlbum() == null) {
                nullTracks.add(track);
            }
        }
        tracks.removeAll(nullTracks);
    }

    private void populateMenuBar(ModelMap model) {
        model.addAttribute("artists", this.artistService.getAll());
        model.addAttribute("artistCount", artistService.count());
        model.addAttribute("albumCount", albumService.count());
        model.addAttribute("trackCount", trackService.count());
    }

    private void populateDefaultModel(ModelMap model) {
        List<String> genders = new ArrayList<>(Arrays.asList("male", "female"));
        List<String> types = new ArrayList<>(Arrays.asList("person", "group"));
        System.out.println(genders.toString());

        model.addAttribute("genders", genders);
        model.addAttribute("types", types);
    }


    private Album populateNewAlbum(Artist artist) {
        Album album = new Album();
        album.setArtist(artist);
        album.setYear(1990);
        album.setLength("00:00:00");

        Track track = new Track();
        track.setPosition(1);
        track.setName("track" + 1);
        track.setLength("00:00:00");
        track.setAlbum(album);

        List<Track> trackList = new ArrayList<>();
        trackList.add(track);

        album.setTracks(trackList);
        return album;
    }
}

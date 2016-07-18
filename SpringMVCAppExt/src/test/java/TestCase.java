import com.springapp.mvc.entity.Album;
import com.springapp.mvc.entity.Artist;
import com.springapp.mvc.entity.Track;
import com.springapp.mvc.repository.AlbumRepository;
import com.springapp.mvc.repository.ArtistRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Collection;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

@ContextConfiguration({"classpath:spring/mvc-dispatcher-servlet.xml"})
@RunWith(SpringJUnit4ClassRunner.class)

public class TestCase {

    @Autowired
    private ArtistRepository artistRepository;

    @Autowired
    private AlbumRepository albumRepository;

    @Test
    public void shouldFindArtist() {
        Collection<Artist> artists = artistRepository.findAll();
        assertThat(artists.size()).isEqualTo(3);

        String existing = "Jimi Hendrix";
        Artist artist = this.artistRepository.findByName(existing);
        assertThat(artist.getName()).isEqualTo(existing);

        String nonExisting = "Marilyn Manson";
        artist = this.artistRepository.findByName(nonExisting);
        assertThat(artist).isNull();
    }

    @Test
    public void shouldFindSpecificAlbum() {
        String artistName = "Jimi Hendrix";

        Artist artist = this.artistRepository.findByName(artistName);
        List<Album> albums = artist.getAlbums();
        assertThat(albums.size()).isEqualTo(2);

        String albumName = "Electric Ladyland";

        Album album = albumRepository.findByName(albumName);
        assertThat(album).isNotNull();
        assertThat(album.getName()).isEqualTo(albumName);
    }

    @Test
    public void albumShouldContainTracks() {
        String albumName = "Electric Ladyland";

        List<Track> tracks = albumRepository.findByName(albumName).getTracks();
        assertThat(tracks.size()).isEqualTo(11);
        assertThat(tracks.get(3).getName()).isEqualTo("Voodoo Chile");
        assertThat(tracks.get(8).getName()).isEqualTo("Burning of the Midnight Lamp");
    }
}

"""Plugin to set desktop background as album art image.

To be isntalled inside of .config/quodlibet/plugins
"""
__author__ = "Tyler Westland"

from quodlibet.plugins.events import EventPlugin
import pywal

class AlbumArtAsBackground(EventPlugin):
    PLUGIN_ID = "albumartasbackground"
    PLUGIN_NAME = "Album Art as Background"
    PLUGIN_DESC = "Sets desktop background as album art"

    def plugin_on_song_on_started(self, song):
        self.set_song_album_art_as_background(song)

    def plugin_on_song_on_unpaused(self, song):
        self.set_song_album_art_as_background(song)

    def set_song_album_art_as_background(self, song):
        if song is not None:
            album = song.get('album', None)
            if album is not None:
                # Get the image
                image = pywal.image.get("")

                # Produce the colors
                colors = pywal.colors.get(image, quiet=True)

                # Apply all sequences
                pywal.sequences.send(colors, vte=False)

                # Export all template files
                pywal.export.every(colors, "~/.cache/wal")

                # Reload xrdb, i3, and polybar
                pywal.reload.env()

                # Set the wallpaper
                pywal.wallpaper.change(image)



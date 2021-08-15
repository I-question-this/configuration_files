#!/usr/bin/env python3

import gi
# Install playerctl package on Arch or whatever
gi.require_version('Playerctl', '2.0')
from gi.repository import Playerctl, GLib
import requests
from subprocess import Popen
import tempfile

album_art = tempfile.NamedTemporaryFile()
# This is a hack to have communication between the calls
# to on_metadata
last_seen_track = tempfile.TemporaryFile()


def on_metadata(player, metadata, manager):
    track_id = metadata['mpris:trackid']
    if "spotify:ad:" in track_id:
        print("Skipping art for ad")
        return
    last_seen_track.seek(0)
    if track_id != last_seen_track.read().decode('utf-8'):
        last_seen_track.seek(0)
        last_seen_track.write(track_id.encode())
        
        # Get the album art url
        response = requests.get(
                f"https://open.spotify.com/oembed?url={track_id}")
        if not response:
            print("Request returned an error")
        else:
            album_url = response.json()["thumbnail_url"]
            print(f"Album art url: {album_url}")

            # Download the art
            image_response = requests.get(album_url)

            if not image_response.ok:
                print("Image request returned an error")
            else:
                album_art.seek(0)
                album_art.write(image_response.content)
                album_art.seek(0)
                Popen(['change_background.sh', album_art.name])


def init_player(name):
    # choose if you want to manage the player based on the name
    if name.name in ['vlc', 'cmus', 'spotify']:
        print(f"Managed: {name.name}")
        player = Playerctl.Player.new_from_name(name)
        player.last_seen_track_id = None
        # player.connect('playback-status::playing', on_play, manager)
        player.connect('metadata', on_metadata, manager)
        manager.manage_player(player)
        manager.last_seen_track_id = None
    else:
        print(f"Not managed: {name.name}")


def on_name_appeared(manager, name):
    init_player(name)


def on_player_vanished(manager, player):
    print('player has exited: {}'.format(player.props.player_name))


manager = Playerctl.PlayerManager()
manager.connect('name-appeared', on_name_appeared)
manager.connect('player-vanished', on_player_vanished)

for name in manager.props.player_names:
    init_player(name)

main = GLib.MainLoop()
main.run()

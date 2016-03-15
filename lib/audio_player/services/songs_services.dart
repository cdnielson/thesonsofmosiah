import 'package:angular2/angular2.dart';
import 'dart:async';
import 'dart:html';
import 'dart:convert';
import 'package:thesonsofmosiah/audio_player/model/album.dart';

@Injectable()
class SongsServices {
  String get pathToSongs => "data/album.json";
  Map decoded;

  Future getSongs() {
    Future songsReceived = HttpRequest.getString(pathToSongs).then((data) {
      decoded = JSON.decode(data);
      List<Album> albumSongList = decoded["songs"].map((Map element) => new Album.fromMap(element)).toList();
      return albumSongList;
    });
    return songsReceived;
  }

  String getAlbumTitle() {
    return decoded["title"];
  }

  String getAlbumArtist() {
    return decoded["artist"];
  }
}
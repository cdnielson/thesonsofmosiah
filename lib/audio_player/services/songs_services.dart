import 'package:angular2/angular2.dart';
import 'dart:async';
import 'dart:html';
import 'dart:convert';
import 'package:thesonsofmosiah/audio_player/model/album.dart';

@Injectable()
class SongsServices {
  String get pathToSongs => "data/albums/";
  Map decoded;

  Future getSongs(album) {
    return HttpRequest.getString('$pathToSongs$album').then((data) {
      decoded = JSON.decode(data);
      return decoded["songs"].map((Map element) => new Album.fromMap(element)).toList();
    });
  }

  String getAlbumTitle() {
    return decoded["title"];
  }

  String getAlbumArtist() {
    return decoded["artist"];
  }
}
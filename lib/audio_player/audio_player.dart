import 'package:angular2/angular2.dart';
import 'model/albums.dart';
import 'dart:html';
import 'dart:convert';
import 'dart:async';

@Component(
    selector: 'audio-player',
    templateUrl: 'audio_player.html')

class AudioPlayer {
  @ViewChild("player") var player;
  @ViewChild("timeline") var timeline;
  @ViewChild("playhead") var playhead;

  String title = "Audio Player";

  String get pathToSongs => "data/songs.json";
  String get pathToAudio => "audio/";
  List<Album> songList;
  int currentSongId = 0;
  Album currentSong = new Album.fromMap({});
  bool playing = false;
  String artist = "";
  var songDuration;
  int position = 0;
  String marginLeft = "Opx";
  var audio;
  AudioElement myPlayer;
  DivElement myTimeline;
  String currentSongPath = "";
  bool playPause = false;

  AudioPlayer() {
    print("go");
    var request = HttpRequest.getString(pathToSongs).then(songsLoaded);
  }

  ngAfterViewInit() {
    // viewChild is set
  }

  void timeUpdate() {
    /*var lastBuffered = player.nativeElement.buffered.end(player.nativeElement.buffered.length-1);
    var timelineWidth = myTimeline.offsetWidth - playhead.nativeElement.offsetWidth;
    var bufferedPercent = 100 * (player.nativeElement.currentTime / songDuration);
    var playPercent = timelineWidth * (player.nativeElement.currentTime / bufferedPercent);
    print(playPercent);
    playhead.nativeElement.style.marginLeft = playPercent.toString() + "%";*/
  }


  void songsLoaded(String responseText) {

    var decoded = JSON.decode(responseText);
    title = decoded["title"];
    artist = decoded["artist"];
    List<Map> mapList = decoded["songs"].toList();
    songList = mapList.map((Map element) => new Album.fromMap(element)).toList();
//    print(songList);
    currentSong = songList[0];
    currentSongPath = "$pathToAudio${currentSong.url}";
    currentSong.selected = true;
    Timer.run(loadSong);
  }

  void changeSong(String direction) {
    print("Leaving song: $currentSongId");
    if(direction == "next") {
      if(currentSongId < songList.length - 1) {
        currentSongId ++;
      } else {
        currentSongId = 0;
      }
    }
    if(direction == "prev") {
      if(currentSongId == 0) {
        currentSongId = songList.length - 1;
      } else {
        currentSongId --;
      }
    }
    print("Entering song: $currentSongId");

    setSongToPlay();
  }

  void setSongToPlay() {
    currentSong.selected = false;
    currentSong = songList[currentSongId];
    currentSong.selected = true;
    print(currentSong.url);
    Timer.run(loadSong);
  }

  void play() {
    playPause = !playPause;
    player.nativeElement.play();
    playing = true;
//    timeUpdate();
  }

  void stop() {
    player.nativeElement.load();
    playing = false;
  }

  void loadSong() {
    player.nativeElement.load();
    print(player.nativeElement.currentSrc);
    if(playing) {
      play();
    }
  }

/*  void setDuration() {
    songDuration = player.nativeElement.duration;
    print("duration $songDuration");
  }*/

  void playSelectedSong(selectedSongId) {
    currentSongId = selectedSongId;
    playing = true;
    setSongToPlay();
  }
}

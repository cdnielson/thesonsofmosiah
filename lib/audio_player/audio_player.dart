import 'package:angular2/angular2.dart';
import 'model/album.dart';
import 'package:thesonsofmosiah/model/site.dart';
import 'dart:html';
import 'dart:async';
import 'package:thesonsofmosiah/audio_player/services/songs_services.dart';
import 'package:thesonsofmosiah/audio_player/pipes/format_seconds.dart';

@Component(
    selector: 'audio-player',
    templateUrl: 'audio_player.html',
    providers: const [SongsServices],
    pipes: const [FormatSeconds])

class AudioPlayer implements OnInit {
  @ViewChild("timeline") var timeline;
  @ViewChild("playhead") var playhead;
  @Input("siteData") Site siteData;

  String title = "Audio Player";

  //String get pathToSongs => "data/albums/";
  String get pathToAudio => "audio/tsom/";
  String get pathToSpinner => "images/spinner.gif";
  List<Album> songList;
  int currentSongId = 0;
  Album currentSong = new Album.fromMap({});
  bool playing = false;
  String artist = "";
  num songDuration;
  int position = 0;
  String marginLeft = "Opx";
  var audio;
//  AudioElement myPlayer;
//  DivElement myTimeline;
  String currentSongPath = "";
  String playPause = "glyphicon glyphicon-play";
  var timeLineWidth;
  var currentTime = 0;
  StreamSubscription sub;
  StreamSubscription sub2;
  DateTime current = new DateTime.now();
  DateTime length = new DateTime.now();
  Duration d;
  Duration cd = new Duration(seconds:0);
  String minutes;
  String seconds;
  String currentMinute = "00";
  String currentSecond = "00";
  bool isMouseDown = false;
  String playerHeight = "350px";
  String playerOverflow = "scroll";
  String playHeadPosition = "0px";
  SongsServices songsService = new SongsServices();
  bool hideSpinner = true;
  List playerList = [];
  AudioElement audioElement;

  ngOnInit() {
    songsService.getSongs(siteData.album).then(songsLoaded).then((_){
      title = songsService.getAlbumTitle();
      artist = songsService.getAlbumArtist();
    });
  }

  AudioPlayer() {
    window.document.onMouseUp.listen((_) {
      if(isMouseDown) {
        isMouseDown = false;
        handleMouseUp();
      }
    });
  }

  void songsLoaded(List<Album> data) {
    songList = data;
    for (var i = 0; i < songList.length; i++) {
      playerList.add("#player$i");
    }
    currentSong = songList[0];
//    currentSongPath = "$pathToAudio${currentSong.url}";
    currentSong.selected = true;
    Timer.run(loadSong);
  }

  void timeUpdate() {
    print("songDuration $songDuration");
    DivElement timeLine = timeline.nativeElement;
    DivElement playHead = playhead.nativeElement;

    timeLineWidth = timeLine.offsetWidth - playHead.offsetWidth;

    num percent = 100 * (timeLineWidth / timeLine.offsetWidth);

    num playPercent = percent *
        (audioElement.currentTime / songDuration);

    playHead.style.marginLeft = playPercent.toString() + "%";
    currentTime = audioElement.currentTime;
    calcTimeForDisplay();
  }

  void calcTimeForDisplay() {
    cd = new Duration(seconds: currentTime);

    currentMinute = cd.inMinutes.toString();
    currentSecond = cd.inSeconds.remainder(60).toString();
  }

  void changeSong(String direction) {
    if (direction == "next") {
      if (currentSongId < songList.length - 1) {
        currentSongId ++;
      } else {
        currentSongId = 0;
      }
    }
    if (direction == "prev") {
      if (currentSongId == 0) {
        currentSongId = songList.length - 1;
      } else {
        currentSongId --;
      }
    }

    setSongToPlay();
  }

  void setSongToPlay() {
    currentSong.selected = false;
    currentSong = songList[currentSongId];
    currentSong.selected = true;


    Timer.run(loadSong);
  }

  void play() {
//    print(player.nativeElement.paused);
    if (audioElement.paused) {
      audioElement.play();
    } else {
      audioElement.pause();
    }
    playing = true;
//    timeUpdate();
  }

  void stop() {
    playing = false;
    loadSong();
  }

  void loadSong() {
    print(playerList[currentSongId]);
    audioElement = querySelector(playerList[currentSongId]);
    print('#player$currentSongId');
    print('element source ${audioElement.src}');

    for(var i = 0; i < playerList.length; i++) {
      AudioElement el = querySelector('#player$i');
      el.pause();
      el.currentTime = 0;
    }
    //hideSpinner = false;
    if (playing) {
      playPause = "glyphicon glyphicon-pause";
      play();
    } else {
      playPause = "glyphicon glyphicon-play";
    }
  }

  void setDuration() {
    songDuration = audioElement.duration;
    print('duration ${audioElement.duration}');

    //comment out for production
    if (songDuration.isInfinite) {
      songDuration = 25;
      print(songDuration);
    }

    d = new Duration(seconds: songDuration);
    minutes = d.inMinutes.toString();
    seconds = d.inSeconds.remainder(60).toString();

  }

  void playSelectedSong(selectedSongId) {
    currentSongId = selectedSongId;
    playing = true;
    setSongToPlay();
  }

  void handleMouseDown(MouseEvent event) {
    isMouseDown = true;
    sub = timeline.nativeElement.onMouseMove.listen(handleMouseMoveOrClick);
    print("mouseDowned");
    //sub2 = window.document.onMouseUp.listen((_) => handleMouseUp());
  }

  handleMouseUp() {
    print("mouseUpped");
    sub.cancel();
  }

  void handleMouseMoveOrClick(MouseEvent event) {
    movePlayHead(event);
    audioElement.currentTime = songDuration * clickPercent(event);
  }

  double clickPercent(MouseEvent e) {
    return (e.page.x - timeline.nativeElement.offsetLeft) / timeLineWidth;
  }

  void movePlayHead(MouseEvent e) {
    var newMargLeft = e.page.x - timeline.nativeElement.offsetLeft;
    print(newMargLeft);

    if (newMargLeft != 0 || newMargLeft != timeLineWidth) {
      playHeadPosition = newMargLeft.toString() + "px";
    }
    if (newMargLeft <= 0) {
      sub.cancel();
      playHeadPosition = "0px";
    }
    if (newMargLeft >= timeLineWidth) {
      sub.cancel();
      playHeadPosition = timeLineWidth + "px";
    }
  }

  startSpinner() {
    hideSpinner = false;
  }

  stopSpinner() {
    hideSpinner = true;
  }

}

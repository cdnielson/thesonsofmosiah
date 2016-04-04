import 'package:angular2/angular2.dart';
import 'package:thesonsofmosiah/audio_player/audio_player.dart';

@Component(
    selector: 'listen-page',
    templateUrl: 'listen_page.html',
    directives: const [AudioPlayer])
class ListenPage {
  @Input('siteData') List siteData;
}
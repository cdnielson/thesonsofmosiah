import 'package:angular2/angular2.dart';
import 'package:thesonsofmosiah/audio_player/audio_player.dart';
import 'package:thesonsofmosiah/services/site_services.dart';

@Component(
    selector: 'listen-page',
    templateUrl: 'listen_page.html',
    directives: const [AudioPlayer])
class ListenPage {
  SiteService siteService;

  ListenPage(SiteService this.siteService);
}
import 'package:angular2/angular2.dart';
import 'package:thesonsofmosiah/services/site_services.dart';

@Component(
    selector: 'people-page',
    templateUrl: 'people_page.html')
class PeoplePage {
  SiteService siteService;

  PeoplePage(SiteService this.siteService);
}
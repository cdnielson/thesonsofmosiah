import 'package:angular2/angular2.dart';
import 'package:thesonsofmosiah/services/site_services.dart';


@Component(
    selector: 'about-page',
    templateUrl: 'about_page.html')
class AboutPage {
  SiteService siteService;

  AboutPage(SiteService this.siteService);
}
import 'package:angular2/angular2.dart';
import 'package:thesonsofmosiah/services/site_services.dart';
import 'package:thesonsofmosiah/model/site.dart';

@Component(
    selector: 'contact-page',
    templateUrl: 'contact_page.html')
class ContactPage {
  SiteService siteService;

  ContactPage(SiteService this.siteService);
}
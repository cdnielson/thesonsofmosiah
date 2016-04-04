import 'package:angular2/angular2.dart';

@Component(
    selector: 'contact-page',
    templateUrl: 'contact_page.html')
class ContactPage {
  @Input('siteData') List siteData;
}
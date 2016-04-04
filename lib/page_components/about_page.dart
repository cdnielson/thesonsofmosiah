import 'package:angular2/angular2.dart';

@Component(
    selector: 'about-page',
    templateUrl: 'about_page.html')
class AboutPage {
  @Input('siteData') List siteData;
}
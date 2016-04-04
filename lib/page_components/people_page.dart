import 'package:angular2/angular2.dart';

@Component(
    selector: 'people-page',
    templateUrl: 'people_page.html')
class PeoplePage {
  @Input('siteData') List siteData;
}
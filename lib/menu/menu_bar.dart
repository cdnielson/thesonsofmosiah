import 'package:angular2/angular2.dart';
import 'package:thesonsofmosiah/model/site.dart';
import 'dart:async';
@Component(
    selector: 'menu-bar',
    templateUrl: 'menu_bar.html')
class MenuBar {
  @Input("menuDirection") String menuDirection;
  @Input("siteData") Site siteData;

  MenuBar() {
    Timer.run(() => print("menuDirection $menuDirection"));
  }
}
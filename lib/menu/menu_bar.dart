import 'package:angular2/angular2.dart';
import 'package:thesonsofmosiah/model/site.dart';
import 'dart:async';
@Component(
    selector: 'menu-bar',
    templateUrl: 'menu_bar.html')
class MenuBar {
  @Input("menuClass") String menuClass;
  @Input("siteData") Site siteData;
  @Input("showHome") bool showHome;
  @Output() EventEmitter clicked = new EventEmitter();

  MenuBar() {

  }

  handleClicked(data) {
    clicked.emit(data);
  }
}
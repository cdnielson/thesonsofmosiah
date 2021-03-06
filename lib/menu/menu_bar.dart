import 'package:angular2/angular2.dart';
import 'package:thesonsofmosiah/services/site_services.dart';

@Component(
    selector: 'menu-bar',
    templateUrl: 'menu_bar.html')

class MenuBar {
  @Input("menuClass") String menuClass;
  @Input("showHome") bool showHome;
  @Input("fpImageIsBlack") bool fpImageIsBlack;
  @Input("menuColor") String menuColor;
  @Output() EventEmitter clicked = new EventEmitter();
  final SiteService siteService;
  String get fpImageWhite => "images/fp/prophet_white.svg";
  String get fpImageBlack => "images/fp/prophet.svg";
  String get sstcImage => "images/rogg/sstc.png";

  MenuBar(SiteService this.siteService);

  handleClicked(data) {
    clicked.emit(data);
  }
}
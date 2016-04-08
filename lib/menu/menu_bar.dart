import 'package:angular2/angular2.dart';
import 'package:thesonsofmosiah/services/site_services.dart';

@Component(
    selector: 'menu-bar',
    templateUrl: 'menu_bar.html')

class MenuBar {
  @Input("menuClass") String menuClass;
  @Input("showHome") bool showHome;
  @Output() EventEmitter clicked = new EventEmitter();
  final SiteService siteService;

  MenuBar(SiteService this.siteService);

  handleClicked(data) {
    clicked.emit(data);
  }
}
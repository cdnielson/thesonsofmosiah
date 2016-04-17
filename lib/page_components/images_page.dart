import 'package:angular2/angular2.dart';
import 'package:thesonsofmosiah/services/site_services.dart';

@Component(
    selector: 'images-page',
    templateUrl: 'images_page.html')
class ImagesPage {
  SiteService siteService;
  static const String PATH_TO_RILLA_IMAGES = "images/rogg/images/";
  List images = [
    {"src":"${PATH_TO_RILLA_IMAGES}image1.jpg","width":"400px","height":""},
    {"src":"${PATH_TO_RILLA_IMAGES}image3.jpg","width":"","height":"400px"},
    {"src":"${PATH_TO_RILLA_IMAGES}image2.jpg","width":"400px","height":""},
    {"src":"${PATH_TO_RILLA_IMAGES}image4.jpg","width":"","height":"400px"},
  ];

  ImagesPage(SiteService this.siteService);
}
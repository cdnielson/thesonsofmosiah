import 'package:angular2/angular2.dart';
import 'package:thesonsofmosiah/services/site_services.dart';

@Component(
    selector: 'books-page',
    templateUrl: 'books_page.html')
class BooksPage {
  SiteService siteService;

  BooksPage(SiteService this.siteService);
}
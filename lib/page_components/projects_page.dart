import 'package:angular2/angular2.dart';

@Component(
    selector: 'projects-page',
    templateUrl: 'projects_page.html')
class ProjectsPage {
  @Input('siteData') List siteData;
  @Output('newPage') EventEmitter newPage = new EventEmitter();

  changePage(page) {
    newPage.emit(page);
  }
}
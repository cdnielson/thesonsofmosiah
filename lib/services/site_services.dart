import 'package:angular2/angular2.dart';
import 'package:thesonsofmosiah/model/site.dart';
import 'package:thesonsofmosiah/model/sections.dart';
import 'dart:html';
import 'dart:convert';
import 'dart:async';

@Injectable()
class SiteService {
  static const String PATH_TO_DATA = "data/";
  Sections _sectionData;
  Site _siteData;

  Site get siteData {
    return _siteData;
  }

  Sections get sectionData {
    return _sectionData;
  }

  Future getSite(site) {
    String pathToSiteData = "$PATH_TO_DATA${site}_sitedata.json";
    return HttpRequest.getString(pathToSiteData).then((data) {
      Map decoded = JSON.decode(data);
      _siteData = new Site.fromMap(decoded);
      return _siteData;
    }).then((_){
      _sectionData = getSection(_siteData.sections);
    });
 }

  Sections getSection(Map sections) {
    return new Sections.fromMap(sections);
  }
}
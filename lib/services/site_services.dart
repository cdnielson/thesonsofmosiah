import 'package:angular2/angular2.dart';
import 'package:thesonsofmosiah/model/site.dart';
import 'dart:html';
import 'dart:convert';
import 'dart:async';

@Injectable()
class SiteService {
  String get pathToData => "data/";

  Future getSite(site) {
    String pathToSiteData = "$pathToData${site}_sitedata.json";
    Future siteData = HttpRequest.getString(pathToSiteData).then((data) {
      Map decoded = JSON.decode(data);
      return new Site.fromMap(decoded);
    });
    return siteData;
  }
}
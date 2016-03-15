// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/angular2.dart';
import 'audio_player/audio_player.dart';
import 'dart:html';
import 'package:thesonsofmosiah/services/site_services.dart';
import 'package:thesonsofmosiah/model/site.dart';

@Component(
    selector: 'my-app',
    templateUrl: 'app_component.html',
    directives: const [AudioPlayer])
class AppComponent {

  String get pathToImages => "images/";
  Site siteData;
  String background = "";
  String logo = "";
  bool hideLogo = false;

  AppComponent(SiteService site) {
    site.getSite().then(siteDataLoaded);
  }

  void siteDataLoaded(data) {
    siteData = data;
    background = "url(\"$pathToImages${siteData.backgroundUrl}\")";
    if (siteData.logo == null || siteData.logo == "") {
      hideLogo = true;
    }
    print(hideLogo);
    logo = "$pathToImages${siteData.logo}";
    print(siteData.contactInfo["name"]);
    document.title = siteData.siteTitle;
  }
}

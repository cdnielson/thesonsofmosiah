// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/angular2.dart';

import 'dart:html';
import 'dart:core';

import 'package:thesonsofmosiah/services/site_services.dart';
import 'package:thesonsofmosiah/menu/menu_bar.dart';
import 'package:thesonsofmosiah/page_components/about_page.dart';
import 'package:thesonsofmosiah/page_components/people_page.dart';
import 'package:thesonsofmosiah/page_components/contact_page.dart';
import 'package:thesonsofmosiah/page_components/listen_page.dart';
import 'package:thesonsofmosiah/page_components/projects_page.dart';
import 'package:thesonsofmosiah/page_components/books_page.dart';
import 'package:thesonsofmosiah/model/site.dart';
import 'package:animation/animation.dart';

@Component(
    selector: 'my-app',
    templateUrl: 'app_component.html',
    directives: const [MenuBar, AboutPage, PeoplePage, ProjectsPage, ContactPage, ListenPage, BooksPage])
class AppComponent {

  String siteToLoad = "fp";
  String get pathToImages => "images/";
  Site siteData;
  String background = "";
  String logo = "";
  bool hideLogo = false;
  bool dataLoaded = false;

  AppComponent(SiteService site) {
    site.getSite(siteToLoad).then(siteDataLoaded);
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
    dataLoaded = true;
  }

  void scrollTest(data) {
    var elLoc = querySelector('#' + data).offsetTop;

    //animation to figure out later
    /*var el = querySelector('#' + data);
    var properties = {
      'left': 1000,
      'top': 350
    };
    animate(el, properties: properties, duration: 5000);*/

    window.scrollTo(0, elLoc);
  }

  swapSite(siteToGet) {
    SiteService site = new SiteService();
    site.getSite(siteToGet).then(siteDataLoaded);
  }

}

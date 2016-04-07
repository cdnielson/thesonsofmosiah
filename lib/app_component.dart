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
import 'package:thesonsofmosiah/model/sections.dart';

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
  Sections sectionData;
  SiteService site = new SiteService();

  //for scrolling
  static const num SCROLL_SPEED = 5;
  int currentLoc;

  AppComponent() {
    site.getSite(siteToLoad).then(siteDataLoaded);
  }

  void siteDataLoaded(data) {
    siteData = data;
    sectionData = site.getSection(siteData.sections);
    background = "url(\"$pathToImages${siteData.backgroundUrl}\")";
    if (siteData.logo == null || siteData.logo == "") {
      hideLogo = true;
    }
    logo = "$pathToImages${siteData.logo}";
    document.title = siteData.siteTitle;
    dataLoaded = true;
  }

  void handleScroll(data) {
    if (data == "fp") {
      swapSite("fp");
      return;
    }
    currentLoc = window.pageYOffset;
    int destinationLoc = querySelector('#$data').offsetTop;
    int totalScroll;
    double scrollIteration;
    String direction;
    if(currentLoc > destinationLoc) {
      direction = "up";
      totalScroll = currentLoc - destinationLoc;
    }
    if(currentLoc < destinationLoc) {
      direction = "down";
      totalScroll = destinationLoc - currentLoc;
    }
    scrollIteration = totalScroll/SCROLL_SPEED;
    setCurrentScrollLocation(direction, destinationLoc, scrollIteration);
  }

  setCurrentScrollLocation(direction, destinationLoc, scrollIteration) async {
    await window.animationFrame;
    scroll(direction, scrollIteration);
    if (direction == "down") {
      if (currentLoc <= destinationLoc) {
        setCurrentScrollLocation(direction, destinationLoc, scrollIteration);
      } else {
        scrollHard(destinationLoc);
      }
    }
    if (direction == "up") {
      if (currentLoc >= destinationLoc) {
        setCurrentScrollLocation(direction, destinationLoc, scrollIteration);
      } else {
        scrollHard(destinationLoc);
      }
    }
  }

  scrollHard(destinationLoc) {
    window.scrollTo(0, destinationLoc);
  }

  void scroll(direction, scrollIteration) {
    if (direction == "down") {
      currentLoc += scrollIteration;
    }
    if (direction == "up") {
      currentLoc -= scrollIteration;
    }
    window.scrollTo(0, currentLoc);
  }

  swapSite(siteToGet) {
    site.getSite(siteToGet).then(siteDataLoaded);
  }
}

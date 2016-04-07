library site;

class Site {
  final String siteTitle;
  final String backgroundUrl;
  final String logo;
  final String menuColor;
  final String backgroundColor1;
  final String backgroundColor2;
  final String aboutText;
  final Map contactInfo;
  final List people;
  final Map sections;
  final String album;

  Site(
      String this.siteTitle,
      String this.backgroundUrl,
      String this.logo,
      String this.menuColor,
      String this.backgroundColor1,
      String this.backgroundColor2,
      String this.aboutText,
      Map this.contactInfo,
      List this.people,
      Map this.sections,
      String this.album);

  Site.fromMap(Map<String, Object> map) : this(
      map["siteTitle"],
      map["backgroundUrl"],
      map["logo"],
      map["menuColor"],
      map["backgroundColor1"],
      map["backgroundColor2"],
      map["aboutText"],
      map["contactInfo"],
      map["people"],
      map["sections"],
      map["album"]);

  @override String toString() => "$logo";

}
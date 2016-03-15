library site;

class Site {
  final String siteTitle;
  final String backgroundUrl;
  final String logo;
  final String menuColor;
  final String aboutText;
  final Map contactInfo;

  Site(
      String this.siteTitle,
      String this.backgroundUrl,
      String this.logo,
      String this.menuColor,
      String this.aboutText,
      Map this.contactInfo);

  Site.fromMap(Map<String, Object> map) : this(
      map["siteTitle"],
      map["backgroundUrl"],
      map["log"],
      map["menuColor"],
      map["aboutText"],
      map["contactInfo"]);

  @override String toString() => "$siteTitle";
}
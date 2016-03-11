library albums;

class Album extends Object {
  final String name;
  final String url;

  Album(String this.name, String this.url);

  Album.fromMap(Map<String, Object> map) : this(map["name"], map["url"]);

  @override String toString() => "$name";

  bool selected = false;
}
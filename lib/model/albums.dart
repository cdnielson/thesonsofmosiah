library albums;

class Album extends Object {
  final String name;
  final String url;
  final int id;

  Album(String this.name, String this.url, int this.id);

  Album.fromMap(Map<String, Object> map) : this(map["name"], map["url"], map["id"]);

  @override String toString() => "$name";

  bool selected = false;
}
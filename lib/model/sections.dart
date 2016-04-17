library sections;

class Sections {
  final bool fp;
  final bool sstc;
  final bool about;
  final bool projects;
  final bool books;
  final bool people;
  final bool listen;
  final bool contact;
  final bool images;

  Sections(
      bool this.fp,
      bool this.sstc,
      bool this.about,
      bool this.projects,
      bool this.books,
      bool this.people,
      bool this.listen,
      bool this.contact,
      bool this.images);

  Sections.fromMap(Map<String, Object> map) : this(
      map["fp"],
      map["sstc"],
      map["about"],
      map["projects"],
      map["books"],
      map["people"],
      map["listen"],
      map["contact"],
      map["images"]);
}
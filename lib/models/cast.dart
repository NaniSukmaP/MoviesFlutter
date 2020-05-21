class Cast {
  int id;
  String character;
  String name;
  String profile;

  Cast(this.id, this.character, this.name, this.profile);

  Cast.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        character = json["character"],
        name = json["name"],
        profile = json["profile_path"];
}

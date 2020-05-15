class Artist {
  final double popularity;
  final KnownForDepartment knownForDepartment;
  final String name;
  final int id;
  final String profilePath;
  final bool adult;
  final List<KnownFor> knownFor;
  final int gender;

  Artist(
    this.popularity,
    this.knownForDepartment,
    this.name,
    this.id,
    this.profilePath,
    this.adult,
    this.knownFor,
    this.gender,
  );

  Artist.fromJson(Map<String, dynamic> json)
      : popularity = json["popularity"].toDouble(),
        knownForDepartment =
            knownForDepartmentValues.map[json["known_for_department"]],
        name = json["name"],
        id = json["id"],
        profilePath = json["profile_path"],
        adult = json["adult"],
        knownFor = List<KnownFor>.from(
            json["known_for"].map((x) => KnownFor.fromJson(x))),
        gender = json["gender"];
}

class KnownFor {
  String originalName;
  List<int> genreIds;
  MediaType mediaType;
  String name;
  List<String> originCountry;
  int voteCount;
  DateTime firstAirDate;
  String backdropPath;
  OriginalLanguage originalLanguage;
  int id;
  double voteAverage;
  String overview;
  String posterPath;
  DateTime releaseDate;
  bool video;
  String title;
  String originalTitle;
  bool adult;

  KnownFor({
    this.originalName,
    this.genreIds,
    this.mediaType,
    this.name,
    this.originCountry,
    this.voteCount,
    this.firstAirDate,
    this.backdropPath,
    this.originalLanguage,
    this.id,
    this.voteAverage,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.video,
    this.title,
    this.originalTitle,
    this.adult,
  });

  factory KnownFor.fromJson(Map<String, dynamic> json) => KnownFor(
        originalName:
            json["original_name"] == null ? null : json["original_name"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        mediaType: mediaTypeValues.map[json["media_type"]],
        name: json["name"] == null ? null : json["name"],
        originCountry: json["origin_country"] == null
            ? null
            : List<String>.from(json["origin_country"].map((x) => x)),
        voteCount: json["vote_count"],
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
        backdropPath:
            json["backdrop_path"] == null ? null : json["backdrop_path"],
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        id: json["id"],
        voteAverage: json["vote_average"].toDouble(),
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        video: json["video"] == null ? null : json["video"],
        title: json["title"] == null ? null : json["title"],
        originalTitle:
            json["original_title"] == null ? null : json["original_title"],
        adult: json["adult"] == null ? null : json["adult"],
      );
}

enum KnownForDepartment { ACTING }

final knownForDepartmentValues =
    EnumValues({"Acting": KnownForDepartment.ACTING});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

enum MediaType { TV, MOVIE }

final mediaTypeValues =
    EnumValues({"movie": MediaType.MOVIE, "tv": MediaType.TV});

enum OriginalLanguage { ZH, TH, EN, ES, JA, EU }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "es": OriginalLanguage.ES,
  "eu": OriginalLanguage.EU,
  "ja": OriginalLanguage.JA,
  "th": OriginalLanguage.TH,
  "zh": OriginalLanguage.ZH
});

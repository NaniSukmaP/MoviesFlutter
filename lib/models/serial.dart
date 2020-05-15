class Serial {
  String originalName;
  List<int> genreIds;
  String name;
  double popularity;
  List<OriginCountry> originCountry;
  int voteCount;
  DateTime firstAirDate;
  String backdropPath;
  OriginalLanguage originalLanguage;
  int id;
  double voteAverage;
  String overview;
  String posterPath;

  Serial(
    this.originalName,
    this.genreIds,
    this.name,
    this.popularity,
    this.originCountry,
    this.voteCount,
    this.firstAirDate,
    this.backdropPath,
    this.originalLanguage,
    this.id,
    this.voteAverage,
    this.overview,
    this.posterPath,
  );

  Serial.fromJson(Map<String, dynamic> json)
      : originalName = json["original_name"],
        genreIds = List<int>.from(json["genre_ids"].map((x) => x)),
        name = json["name"],
        popularity = json["popularity"].toDouble(),
        originCountry = List<OriginCountry>.from(
            json["origin_country"].map((x) => originCountryValues.map[x])),
        voteCount = json["vote_count"],
        firstAirDate = DateTime.parse(json["first_air_date"]),
        backdropPath = json["backdrop_path"],
        originalLanguage =
            originalLanguageValues.map[json["original_language"]],
        id = json["id"],
        voteAverage = json["vote_average"].toDouble(),
        overview = json["overview"],
        posterPath = json["poster_path"];
}

enum OriginCountry { GB, JP, US }

final originCountryValues = EnumValues(
    {"GB": OriginCountry.GB, "JP": OriginCountry.JP, "US": OriginCountry.US});

enum OriginalLanguage { EN, JA, ES }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "es": OriginalLanguage.ES,
  "ja": OriginalLanguage.JA
});

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

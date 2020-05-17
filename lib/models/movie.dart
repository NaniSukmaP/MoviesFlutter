class Movie {
  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  OriginalLanguage originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  DateTime releaseDate;

  Movie({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  Movie.fromJson(Map<String, dynamic> json)
      : popularity = json["popularity"].toDouble(),
        voteCount = json["vote_count"],
        video = json["video"],
        posterPath = json["poster_path"],
        id = json["id"],
        adult = json["adult"],
        backdropPath = json["backdrop_path"],
        originalLanguage =
            originalLanguageValues.map[json["original_language"]],
        originalTitle = json["original_title"],
        genreIds = List<int>.from(json["genre_ids"].map((x) => x)),
        title = json["title"],
        voteAverage = json["vote_average"].toDouble(),
        overview = json["overview"],
        releaseDate = DateTime.parse(json["release_date"]);
}

enum OriginalLanguage { EN, ES, JA, RU }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "es": OriginalLanguage.ES,
  "ja": OriginalLanguage.JA,
  "ru": OriginalLanguage.RU
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

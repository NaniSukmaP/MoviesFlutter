import 'package:project_movies/models/genre.dart';

class MovieDetail {
  int id;
  bool adult;
  int budget;
  List<Genre> genres;
  String releaseDate;
  int runtime;

  MovieDetail(this.id, this.adult, this.budget, this.genres, this.releaseDate,
      this.runtime);

  MovieDetail.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        adult = json["adult"],
        budget = json["budget"],
        genres =
            (json["genres"] as List).map((i) => new Genre.fromJson(i)).toList(),
        releaseDate = json["release_date"],
        runtime = json["runtime"];
}

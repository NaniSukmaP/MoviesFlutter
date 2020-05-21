import 'package:project_movies/models/cast.dart';

class CastResponse {
  final List<Cast> casts;
  final String error;

  CastResponse(this.error, this.casts);

  CastResponse.fromJson(Map<String, dynamic> json)
      : casts =
            (json["casts"] as List).map((i) => new Cast.fromJson(i)).toList(),
        error = "movie detail error";

  CastResponse.withError(String errorValue)
      : casts = List(),
        error = errorValue;
}

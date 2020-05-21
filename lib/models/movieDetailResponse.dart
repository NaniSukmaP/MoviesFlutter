import 'movieDetail.dart';

class MovieDetailResponse {
  final MovieDetail movieDetail;
  final String error;

  MovieDetailResponse(this.movieDetail, this.error);

  MovieDetailResponse.fromJson(Map<String, dynamic> json)
      : movieDetail = MovieDetail.fromJson(json),
        error = "movie detail error";

  MovieDetailResponse.withError(String errorValue)
      : movieDetail = MovieDetail(null, null, null, null, null, null),
        error = errorValue;
}

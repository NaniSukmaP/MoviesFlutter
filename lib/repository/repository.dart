import 'package:dio/dio.dart';
import 'package:project_movies/models/artistResponse.dart';
import 'package:project_movies/models/castResponse.dart';
import 'package:project_movies/models/genreResponse.dart';
import 'package:project_movies/models/movieDetailResponse.dart';
import 'package:project_movies/models/movieResponse.dart';
import 'package:project_movies/models/serialResponse.dart';

class MovieRepository {
  final String apiKey = 'b168201bf0a9f0154820b4534d608cf3';
  static String url = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();
  var getPopularMoviesUrl = '$url/movie/top_rated';
  var getDiscoverMoviesUrl = '$url/discover/movie';
  var getNowPlayMoviesUrl = '$url/movie/now_playing';
  var getGenresUrl = '$url/genre/movie/list';
  var getArtistPopularUrl = '$url/person/popular';
  var getSerial = '$url/tv/on_the_air';
  var getSerialGenre = '$url/discover/tv';
  var movieDetailUrl = '$url/movie';
  // var getPopularMoviesUrl = '$url/movie/top_rated';

  Future<MovieResponse> getPopularMovies() async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
    };
    try {
      Response response =
          await _dio.get(getPopularMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception error: $error stackTrace: $stacktrace");
      return MovieResponse.withError(error);
    }
  }

  Future<SerialResponse> getSerialTV() async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
    };
    try {
      Response response = await _dio.get(getSerial, queryParameters: params);
      return SerialResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception error: $error stackTrace: $stacktrace");
      return SerialResponse.withError(error);
    }
  }

  Future<MovieResponse> getNowPlayingMovies() async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
    };
    try {
      Response response =
          await _dio.get(getNowPlayMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception error: $error stackTrace: $stacktrace");
      return MovieResponse.withError(error);
    }
  }

  Future<GenreResponse> getGenres() async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
    };
    try {
      Response response = await _dio.get(getGenresUrl, queryParameters: params);
      return GenreResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception error: $error stackTrace: $stacktrace");
      return GenreResponse.withError(error);
    }
  }

  Future<MovieResponse> getMovieByGenre(int id) async {
    var params = {"api_key": apiKey, "language": "en-US", "with_genres": id};
    try {
      Response response =
          await _dio.get(getDiscoverMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception error: $error stackTrace: $stacktrace");
      return MovieResponse.withError(error);
    }
  }

  Future<SerialResponse> getSerialByGenre(int id) async {
    var params = {"api_key": apiKey, "language": "en-US", "with_genres": id};
    try {
      Response response =
          await _dio.get(getSerialGenre, queryParameters: params);
      return SerialResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception error: $error stackTrace: $stacktrace");
      return SerialResponse.withError(error);
    }
  }

  Future<ArtistResponse> getPopularArtist() async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
    };
    try {
      Response response =
          await _dio.get(getArtistPopularUrl, queryParameters: params);
      return ArtistResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception error: $error stackTrace: $stacktrace");
      return ArtistResponse.withError(error);
    }
  }

  Future<MovieDetailResponse> getMovieDetail(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
    };
    try {
      Response response =
          await _dio.get(movieDetailUrl + "/$id", queryParameters: params);
      return MovieDetailResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception error: $error stackTrace: $stacktrace");
      return MovieDetailResponse.withError(error);
    }
  }
  Future<CastResponse> getCast(int id)async{
      var params = {
      "api_key": apiKey,
      "language": "en-US",
    };
    try {
      Response response =
          await _dio.get(movieDetailUrl + "/$id" +"/credits", queryParameters: params);
      return CastResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception error: $error stackTrace: $stacktrace");
      return CastResponse.withError(error);
    }
  }
}

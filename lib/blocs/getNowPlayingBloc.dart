import 'package:project_movies/models/genreResponse.dart';
import 'package:project_movies/models/movieResponse.dart';
import 'package:project_movies/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class MoviesNowPlayingBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getMovies() async {
    MovieResponse response = await _repository.getNowPlayingMovies();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

final moviesNowPlayingBloc = MoviesNowPlayingBloc();

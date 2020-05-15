import 'package:project_movies/models/artistResponse.dart';
// import 'package:project_movies/models/genreResponse.dart';
// import 'package:project_movies/models/movieResponse.dart';
import 'package:project_movies/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class ArtistListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<ArtistResponse> _subject =
      BehaviorSubject<ArtistResponse>();

  getArtist() async {
    ArtistResponse response = await _repository.getPopularArtist();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ArtistResponse> get subject => _subject;
}

final artistListBloc = ArtistListBloc();

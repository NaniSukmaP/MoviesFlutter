import 'package:project_movies/models/movieResponse.dart';
import 'package:project_movies/models/serialResponse.dart';
import 'package:project_movies/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class SerialListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<SerialResponse> _subject =
      BehaviorSubject<SerialResponse>();

  getSerialTV() async {
    SerialResponse response = await _repository.getSerialTV();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<SerialResponse> get subject => _subject;
}

final serialBloc = SerialListBloc();

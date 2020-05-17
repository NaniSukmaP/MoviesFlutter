import 'package:flutter/material.dart';
import 'package:project_movies/models/movieResponse.dart';
import 'package:project_movies/models/serialResponse.dart';
import 'package:project_movies/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class SerialListBlocbyGenres {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<SerialResponse> _subject =
      BehaviorSubject<SerialResponse>();

  getSerialByGenre(int id) async {
    SerialResponse response = await _repository.getSerialByGenre(id);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<SerialResponse> get subject => _subject;
}

final serialBlocbyGenre = SerialListBlocbyGenres();

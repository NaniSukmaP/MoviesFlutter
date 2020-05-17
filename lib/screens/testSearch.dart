import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_movies/models/movie.dart';

class TestSearch extends StatefulWidget {
  @override
  _TestSearchState createState() => _TestSearchState();
}

class _TestSearchState extends State<TestSearch> {
  List<Movie> _list = [];
  List<Movie> _search = [];
  var loading = false;
  Future<Null> fetchData() async {
    setState(() {
      loading = true;
    });
    final Dio _dio = Dio();

    var params = {
      "api_key": "b168201bf0a9f0154820b4534d608cf3",
      "language": "en-US",
    };

    Response response = await _dio.get(
        "https://api.themoviedb.org/3/movie/top_rated",
        queryParameters: params);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.data);
      setState(() {
        for (Map i in data) {
          _list.add(Movie.fromJson(i));
          loading = false;
        }
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

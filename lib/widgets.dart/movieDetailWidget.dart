import 'package:flutter/material.dart';
import 'package:project_movies/blocs/getMoviesDetail.dart';
import 'package:project_movies/models/movieDetail.dart';
import 'package:project_movies/models/movieDetailResponse.dart';

class MovieDetailWidget extends StatefulWidget {
  final int id;
  MovieDetailWidget({Key key, @required this.id}) : super(key: key);
  @override
  _MovieDetailWidgetState createState() => _MovieDetailWidgetState(id);
}

class _MovieDetailWidgetState extends State<MovieDetailWidget> {
  final int id;
  _MovieDetailWidgetState(this.id);
  @override
  void initState() {
    super.initState();
    movieDetailBloc..getMovieInfo(id);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieDetailResponse>(
        stream: movieDetailBloc.subject.stream,
        builder: (context, AsyncSnapshot<MovieDetailResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return _buildErrorWidget(snapshot.data.error);
            }
            return _buildMovieDetailWidget(snapshot.data);
          } else if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.error);
          } else {
            return _buildLoadingWidget();
          }
        });
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Error Loading"),
          SizedBox(
            height: 25.0,
            width: 25.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
              strokeWidth: 4.0,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("build error widget: $error"),
        ],
      ),
    );
  }

  Widget _buildMovieDetailWidget(MovieDetailResponse data) {
    MovieDetail detail = data.movieDetail;
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text("Budget"),
                Text(detail.budget.toString())
              ],
            ),
            Column(
              children: <Widget>[
                Text("Runtime"),
                Text(detail.runtime.toString() + "MIN")
              ],
            ),
            Column(
              children: <Widget>[
                Text("Release Date"),
                Text(detail.releaseDate)
              ],
            ),
          ],
        ),
        Container(
            height: 40,
            padding: EdgeInsets.all(8.0),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: detail.genres.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 10,
                          ),
                          borderRadius: BorderRadius.circular(1.0)),
                      child: Text(
                        detail.genres[index].name,
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                    ),
                  );
                })),
      ],
    );
  }
}

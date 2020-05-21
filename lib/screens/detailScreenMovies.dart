import 'package:flutter/material.dart';
import 'package:project_movies/blocs/getMovieBloc.dart';
import 'package:project_movies/models/movie.dart';
import 'package:project_movies/widgets.dart/movieDetailWidget.dart';

class DetailScreen extends StatefulWidget {
  final Movie movie;
  const DetailScreen({Key key, @required this.movie}) : super(key: key);
  @override
  _DetailScreenState createState() => _DetailScreenState(movie);
}

class _DetailScreenState extends State<DetailScreen> {
  final Movie movie;
  _DetailScreenState(this.movie);

  @override
  void initState() {
    super.initState();
    moviesBloc..getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.indigo[400],
          centerTitle: true,
          title: Text(widget.movie.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(8.0),
                height: MediaQuery.of(context).size.height / 3,
                // child: Text(widget.movie.title),
                alignment: Alignment.bottomCenter,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.indigo[400],
                        blurRadius: 8.0,
                        spreadRadius: 2.0,
                        offset: Offset(2.0, 2.0)),
                  ],
                  //shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(32.0),
                  image: DecorationImage(
                    image: NetworkImage('http://image.tmdb.org/t/p/w400/' +
                        widget.movie.backdropPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.indigo[100],
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.indigo[300],
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Popularity",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    widget.movie.popularity.toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "iMDB",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${widget.movie.voteAverage.toString()}/10',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Vote",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    widget.movie.voteCount.toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      // padding: EdgeInsets.all(16.0),
                                      margin: EdgeInsets.fromLTRB(
                                          16.0, 16.0, 4.0, 16.0),
                                      height: 100,
                                      width: 75,
                                      decoration: BoxDecoration(
                                        color: Colors.pink,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.indigo[400],
                                              blurRadius: 2.0,
                                              spreadRadius: 1.0,
                                              offset: Offset(1.0, 1.0)),
                                        ],
                                        //shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              'http://image.tmdb.org/t/p/w400/' +
                                                  widget.movie.posterPath),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  //color: Colors.amber,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.indigo[300],
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  padding: EdgeInsets.all(8.0),
                                  // margin:
                                  //     EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Original Title ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.0,
                                        ),
                                      ),
                                      Text(
                                        widget.movie.originalTitle
                                            .toUpperCase(),
                                        maxLines: 2,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        'Language ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.0,
                                        ),
                                      ),
                                      (widget.movie.originalLanguage
                                                  .toString() ==
                                              "OriginalLanguage.EN")
                                          ? Text("ENGLISH",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold))
                                          : Text("NON-ENGLISH",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      MovieDetailWidget(
                        id: movie.id,
                      ),
                      Container(
                        margin: EdgeInsets.all(16.0),
                        child: Text(
                          widget.movie.overview,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}

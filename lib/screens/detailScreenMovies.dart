import 'package:flutter/material.dart';
import 'package:project_movies/blocs/getMovieBloc.dart';
import 'package:project_movies/models/movie.dart';

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
        backgroundColor: Colors.indigo[50],
        appBar: AppBar(
          backgroundColor: Colors.indigo[400],
          centerTitle: true,
          title: Text(widget.movie.title),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.search,
                size: 25,
              ),
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
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
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24.0),
                    bottomRight: Radius.circular(24.0)),
                image: DecorationImage(
                  image: NetworkImage('http://image.tmdb.org/t/p/w400/' +
                      widget.movie.backdropPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Column(
                  children: <Widget>[
                    Container(
                        //color: Colors.indigo[300],
                        decoration: BoxDecoration(
                          color: Colors.indigo[400],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24.0),
                              topRight: Radius.circular(24.0)),
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
                              Container(
                                // padding: EdgeInsets.all(16.0),
                                margin:
                                    EdgeInsets.fromLTRB(16.0, 16.0, 4.0, 16.0),
                                height: 175,
                                width: 120,
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
                                  borderRadius: BorderRadius.circular(24.0),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'http://image.tmdb.org/t/p/w400/' +
                                            widget.movie.posterPath),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                //color: Colors.amber,
                                width: MediaQuery.of(context).size.width * 0.5,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                decoration: BoxDecoration(
                                  color: Colors.indigo[300],
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                padding: EdgeInsets.all(16.0),
                                margin:
                                    EdgeInsets.fromLTRB(4.0, 16.0, 16.0, 16.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Original Title '),
                                    Text(
                                      widget.movie.originalTitle,
                                      maxLines: 2,
                                    ),
                                    Text('Laguage '),
                                    Text(
                                      widget.movie.originalLanguage.toString(),
                                    ),
                                    Text('Realesed '),
                                    Text(widget.movie.releaseDate.year
                                        .toString())
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
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
        ));
  }
}

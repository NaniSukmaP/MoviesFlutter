import 'package:flutter/material.dart';
import 'package:project_movies/blocs/getMovieBloc.dart';
import 'package:project_movies/blocs/getSerialBloc.dart';
import 'package:project_movies/models/serial.dart';

class DetailScreenSerial extends StatefulWidget {
  final Serial serial;
  const DetailScreenSerial({Key key, @required this.serial}) : super(key: key);
  @override
  _DetailScreenSerialState createState() => _DetailScreenSerialState(serial);
}

class _DetailScreenSerialState extends State<DetailScreenSerial> {
  final Serial serial;
  _DetailScreenSerialState(this.serial);

  @override
  void initState() {
    super.initState();
    serialBloc..getSerialTV();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.indigo[400],
          centerTitle: true,
          title: Text(widget.serial.name),
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
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(8.0),
                height: MediaQuery.of(context).size.height / 3,
                // child: Text(widget.serial.title),
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
                        widget.serial.backdropPath),
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
                                    widget.serial.popularity.toString(),
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
                                    '${widget.serial.voteAverage.toString()}/10',
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
                                    widget.serial.voteCount.toString(),
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
                                  margin: EdgeInsets.fromLTRB(
                                      16.0, 16.0, 4.0, 16.0),
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
                                              widget.serial.posterPath),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  //color: Colors.amber,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  decoration: BoxDecoration(
                                    color: Colors.indigo[300],
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  padding: EdgeInsets.all(16.0),
                                  margin: EdgeInsets.fromLTRB(
                                      4.0, 16.0, 16.0, 16.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Original Title ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        widget.serial.originalName,
                                        maxLines: 2,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Language ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      (widget.serial.originalLanguage
                                                  .toString() ==
                                              "OriginalLanguage.EN")
                                          ? Text("English",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold))
                                          : Text("Non-English",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                      Text(
                                        'First Air Date',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                          '${widget.serial.firstAirDate.year.toString()}-${widget.serial.firstAirDate.month.toString()}-${widget.serial.firstAirDate.day.toString()}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold))
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
                          widget.serial.overview,
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

import 'package:flutter/material.dart';
import 'package:project_movies/blocs/getArtistBloc.dart';
import 'package:project_movies/models/artist.dart';
import 'package:project_movies/models/serial.dart';

class DetailArtis extends StatefulWidget {
  final Artist artist;
  //final KnownFor knownFor;
  //DetailArtis({Key key, this.knownFor}) : super(key:key);
  const DetailArtis({Key key, this.artist}) : super(key: key);
  @override
  _DetailArtisState createState() => _DetailArtisState(artist);
}

class _DetailArtisState extends State<DetailArtis> {
  final Artist artist;
  // final KnownFor knownFor;
  _DetailArtisState(this.artist);

  @override
  void initState() {
    super.initState();
    artistListBloc..getArtist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.indigo[400],
          centerTitle: true,
          title: Text(widget.artist.name),
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
        body: Container(
          margin: EdgeInsets.all(12.0),
          // padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0),
                bottomLeft: Radius.circular(50.0)),
            color: Colors.indigo[100],
            boxShadow: [
              BoxShadow(
                  color: Colors.white,
                  blurRadius: 20.0,
                  spreadRadius: 2.0,
                  offset: Offset(5.0, 5.0)),
            ],
          ),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      height: 450,
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width * 2 / 3,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.indigo[400],
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                              offset: Offset(2.0, 2.0)),
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.0),
                            bottomRight: Radius.circular(24.0),
                            bottomLeft: Radius.circular(24.0)),
                        image: DecorationImage(
                          image: NetworkImage(
                              'http://image.tmdb.org/t/p/w400/' +
                                  widget.artist.profilePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    //margin: EdgeInsets.only(top: 12)
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width / 8 * 7,
                          decoration: BoxDecoration(
                            color: Colors.indigo[400],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.indigo[400],
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                  offset: Offset(2.0, 2.0)),
                            ],
                          ),
                          padding: EdgeInsets.all(20),
                          child: Text(
                            widget.artist.name,
                            style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.indigo[400],
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.indigo[400],
                                        blurRadius: 10.0,
                                        spreadRadius: 1.0,
                                        offset: Offset(1.0, 1.0)),
                                  ],
                                ),
                                height: 75,
                                width: 100,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(
                                      "Department",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    (widget.artist.knownForDepartment
                                                .toString() ==
                                            'KnownForDepartment.ACTING')
                                        ? Text(
                                            'Acting',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          )
                                        : Text(
                                            "Non-Acting",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.indigo[400],
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.indigo[400],
                                        blurRadius: 10.0,
                                        spreadRadius: 1.0,
                                        offset: Offset(1.0, 1.0)),
                                  ],
                                ),
                                height: 75,
                                width: 100,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(
                                      "Gender",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    (widget.artist.gender.toString() == '2')
                                        ? Text(
                                            "Male",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          )
                                        : Text(
                                            "Female",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.indigo[400],
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.indigo[400],
                                        blurRadius: 10.0,
                                        spreadRadius: 2.0,
                                        offset: Offset(2.0, 2.0)),
                                  ],
                                ),
                                height: 75,
                                width: 100,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(
                                      "Popularity",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      widget.artist.popularity.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

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
        backgroundColor: Colors.indigo[50],
        appBar: AppBar(
          actions: <Widget>[
            Text("INI HALAMAN KE DUA"),
            Icon(
              Icons.ac_unit,
              size: 100,
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 2.0, bottom: 16.0),
                  child: Container(
                    height: 300,
                    alignment: Alignment.bottomCenter,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.indigo[400],
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                            offset: Offset(2.0, 2.0)),
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24.0),
                        bottomRight: Radius.circular(24.0),
                        //topRight: Radius.circular(24.0)
                      ),
                      image: DecorationImage(
                        image: NetworkImage('http://image.tmdb.org/t/p/w400/' +
                            widget.artist.profilePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Name",
                                  style: TextStyle(
                                      fontSize: 24.0, color: Colors.black)),
                              Text(
                                widget.artist.name,
                                style: TextStyle(
                                    fontSize: 24.0, color: Colors.black),
                              ),
                            ],
                          )),
                      (widget.artist.knownForDepartment.toString() ==
                              'KnownForDepartment.ACTING')
                          ? Text('Acting')
                          : Text("a"),
                      Text(widget.artist.adult.toString()),
                      Text(widget.artist.popularity.toString()),
                      (widget.artist.gender.toString() == '2')
                          ? Text("Male")
                          : Text("Female"),
                      // Text(knownFor.originalName),
                    ],
                  ),
                )
              ],
            ),
            Container(),
          ],
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_movies/widgets.dart/artistList.dart';
import 'package:project_movies/widgets.dart/genres.dart';
import 'package:project_movies/widgets.dart/nowPlaying.dart';
import 'package:project_movies/widgets.dart/serialTV.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        backgroundColor: Colors.indigo[400],
        centerTitle: true,
        title: Text(
          "Nanny Movie",
          style: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
        leading: Icon(
          Icons.dehaze,
          color: Colors.white,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: null)
        ],
      ),
      body: ListView(
        children: <Widget>[
          NowPlaying(),
          GenreScreen(),
          Text(
            " POPULAR SERIAL TV",
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SerialTV(),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              "POPULAR ARTIST",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          ArtistList(),
        ],
      ),
    );
  }
}

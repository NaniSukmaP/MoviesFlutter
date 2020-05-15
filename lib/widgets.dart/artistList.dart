import 'package:flutter/material.dart';
import 'package:project_movies/blocs/getArtistBloc.dart';
import 'package:project_movies/models/artist.dart';
import 'package:project_movies/models/artistResponse.dart';
import 'package:project_movies/screens/detailArtist.dart';

class ArtistList extends StatefulWidget {
  @override
  _ArtistListState createState() => _ArtistListState();
}

class _ArtistListState extends State<ArtistList> {
  @override
  void initState() {
    super.initState();
    artistListBloc..getArtist();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ArtistResponse>(
        stream: artistListBloc.subject.stream,
        builder: (context, AsyncSnapshot<ArtistResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return _buildErrorWidget(snapshot.data.error);
            }
            return _buildArtistWidget(snapshot.data);
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
          Text("Error occured: $error"),
        ],
      ),
    );
  }

  Widget _buildArtistWidget(ArtistResponse data) {
    List<Artist> artists = data.artists;
    //List<KnownFor> knownFor = data.knownFor;
    if (artists.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          children: <Widget>[Text("no artist")],
        ),
      );
    } else {
      return Container(
          height: 150,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: artists.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    children: <Widget>[
                      artists[index].profilePath == null
                          ? Container(
                              width: 50,
                              height: 55,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.all_inclusive,
                                  color: Colors.black, size: 25.0),
                            )
                          : GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailArtis(
                                              artist: artists[index],
                                            )));
                              },
                              child: Container(
                                width: 75,
                                height: 75,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  //borderRadius:
                                  //  BorderRadius.all(Radius.circular(20.0)),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://image.tmdb.org/t/p/original/" +
                                            artists[index].profilePath),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                      Container(
                        width: 75.0,
                        child: Text(
                          artists[index].name,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 10.0, color: Colors.black),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                );
              }));
    }
  }
}

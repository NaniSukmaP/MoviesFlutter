import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_movies/blocs/getSerialBloc.dart';
import 'package:project_movies/blocs/getSerialBlocbyGenres.dart';
import 'package:project_movies/models/serial.dart';
import 'package:project_movies/models/serialResponse.dart';
import 'package:project_movies/screens/detailScreenSerial.dart';

class SerialTV extends StatefulWidget {
  //final int genreId;
  //SerialTV({Key key, @required this.genreId}) : super(key: key);
  @override
  _SerialTVState createState() => _SerialTVState();
}

class _SerialTVState extends State<SerialTV> {
  // final int genreId;
  // _SerialTVState(this.genreId);
  @override
  void initState() {
    super.initState();
    // serialBlocbyGenre..getSerialByGenre(genreId);
    serialBloc..getSerialTV();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SerialResponse>(
        stream: serialBloc.subject.stream,
        builder: (context, AsyncSnapshot<SerialResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return _buildErrorWidget(snapshot.data.error);
            }
            return _buildSerialWidget(snapshot.data);
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
          Text("Error LOading"),
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

  Widget _buildSerialWidget(SerialResponse data) {
    List<Serial> serials = data.serials;
    if (serials.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          children: <Widget>[Text("There is no Serial TV right now")],
        ),
      );
    } else {
      return Container(
        height: 175,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: serials.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                child: Column(
                  children: <Widget>[
                    serials[index].posterPath == null
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
                                      builder: (context) => DetailScreenSerial(
                                            serial: serials[index],
                                          )));
                            },
                            child: Container(
                              height: 140,
                              width: 75,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/original/" +
                                          serials[index].posterPath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                    Container(
                      width: 75,
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        serials[index].name,
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
              );
            }),
      );
    }
  }
}

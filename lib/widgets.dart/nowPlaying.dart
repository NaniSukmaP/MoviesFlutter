import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:project_movies/blocs/getNowPlayingBloc.dart';
import 'package:project_movies/models/movie.dart';
import 'package:project_movies/models/movieResponse.dart';
import 'package:project_movies/screens/detailScreenMovies.dart';

class NowPlaying extends StatefulWidget {
  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  @override
  void initState() {
    super.initState();
    moviesNowPlayingBloc..getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieResponse>(
        stream: moviesNowPlayingBloc.subject.stream,
        builder: (context, AsyncSnapshot<MovieResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return _buildErrorWidget(snapshot.data.error);
            }
            return _buildNowPlayingWidget(snapshot.data);
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

  Widget _buildNowPlayingWidget(MovieResponse data) {
    List<Movie> movies = data.movies;
    if (movies.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[Text("No Movies")],
        ),
      );
    } else
      return Container(
        height: 220.0,
        child: PageIndicatorContainer(
            align: IndicatorAlign.bottom,
            shape: IndicatorShape.roundRectangleShape(size: Size(12, 4)),
            indicatorSpace: 8.0,
            indicatorColor: Colors.white,
            indicatorSelectorColor: Colors.indigo[400],
            // padding: EdgeInsets.all(2.0),
            pageView: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.take(5).length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                        movie: movies[index],
                                      )));
                        },
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Text(
                              movies[index].title,
                              style: TextStyle(
                                color: Colors.white,
                                //backgroundColor: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0,
                              ),
                            ),
                          ),
                          alignment: Alignment.bottomCenter,
                          width: MediaQuery.of(context).size.width,
                          height: 220.0,
                          decoration: BoxDecoration(
                            //borderRadius: BorderRadius.circular(32.0),
                            // boxShadow: [
                            //   BoxShadow(
                            //       color: Colors.indigo[400],
                            //       blurRadius: 20.0,
                            //       spreadRadius: 10.0,
                            //       offset: Offset(10.0, 10.0)),
                            // ],
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Colors.indigo[100], BlendMode.darken),
                              image: NetworkImage(
                                  "https://image.tmdb.org/t/p/original/" +
                                      movies[index].backdropPath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
            length: movies.take(5).length),
      );
  }
}

import 'package:flutter/material.dart';
import 'package:project_movies/models/genre.dart';
import 'package:project_movies/widgets.dart/genreMovies.dart';

class GenreList extends StatefulWidget {
  final List<Genre> genres;
  GenreList({Key key, @required this.genres}) : super(key: key);
  @override
  _GenreListState createState() => _GenreListState(genres);
}

class _GenreListState extends State<GenreList>
    with SingleTickerProviderStateMixin {
  final List<Genre> genres;
  TabController _tabController;
  _GenreListState(this.genres);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: genres.length);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.0,
      child: DefaultTabController(
          length: genres.length,
          child: Scaffold(
            backgroundColor: Colors.indigo[50],
            appBar: PreferredSize(
                child: AppBar(
                  backgroundColor: Colors.indigo[300],
                  bottom: TabBar(
                      controller: _tabController,
                      indicatorColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 3.0,
                      unselectedLabelColor: Colors.white,
                      labelColor: Colors.black,
                      isScrollable: true,
                      tabs: genres.map((Genre genre) {
                        return Container(
                          padding: EdgeInsets.only(bottom: 8.0, top: 10.0),
                          child: Text(
                            genre.name.toUpperCase(),
                            style: (TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.bold)),
                          ),
                        );
                      }).toList()),
                ),
                preferredSize: Size.fromHeight(50.0)),
            body: TabBarView(
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
              children: genres.map((Genre genre) {
                return GenreMovies(
                  genreId: genre.id,
                );
              }).toList(),
            ),
          )),
    );
  }
}

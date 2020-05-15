import 'package:project_movies/models/artist.dart';

class ArtistResponse {
  final List<Artist> artists;

  final String error;

  ArtistResponse(this.artists, this.error);

  ArtistResponse.fromJson(Map<String, dynamic> json)
      : artists = (json["results"] as List)
            .map((i) => new Artist.fromJson(i))
            .toList(),
        // knownFor = List<KnownFor>.from(
        //     json["known_for"].map((i) => KnownFor.fromJson(i))),
        error = "";

  ArtistResponse.withError(String errorValue)
      : artists = List(),
        // knownFor = List(),
        error = errorValue;
}

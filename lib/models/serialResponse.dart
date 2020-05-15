import 'package:project_movies/models/serial.dart';

class SerialResponse {
  final List<Serial> serials;
  final String error;

  SerialResponse(this.serials, this.error);

  SerialResponse.fromJson(Map<String, dynamic> json)
      : serials = (json["results"] as List)
            .map((i) => new Serial.fromJson(i))
            .toList(),
        error = "";

  SerialResponse.withError(String errorValue)
      : serials = List(),
        error = errorValue;
}

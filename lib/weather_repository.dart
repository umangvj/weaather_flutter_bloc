import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather/weather_model.dart';

class WeatherRepository {
  Future<WeatherModel> getWeather(String? city) async {
    var uri = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=YOUR API ID",
    );

    final result = await http.Client().post(uri);
    if (result.statusCode != 200) {
      throw Exception();
    }
    final jsonDecoded = json.decode(result.body);

    return WeatherModel.fromJson(jsonDecoded["main"]);
  }
}

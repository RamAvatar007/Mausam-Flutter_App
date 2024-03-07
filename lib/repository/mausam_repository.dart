import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import '../model/mausam_app_model.dart';

class WeatherRepository {
  Future<MausamAppModel> fetchWeatherApi(String city) async {
    if (city.isEmpty) {
      String weatherUrl = "https://api.openweathermap.org/data/2.5/weather?q=jaipur&appid=42f6aa9dadd38a1822bd82e921294f4c";

      Response response = await get(Uri.parse(weatherUrl));
      if (kDebugMode) {
        print('WeatherUrl=====${weatherUrl.toString()}');
      }
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('StatusCode=====${response.statusCode}');
          print('Response=====${response.body}');
        }
        final body = jsonDecode(response.body);
        return MausamAppModel.fromJson(body);
      } else {
        throw Exception('Error');
      }
    }
    else {
      String weatherUrl = "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=42f6aa9dadd38a1822bd82e921294f4c";

      Response response = await get(Uri.parse(weatherUrl));
      if (kDebugMode){
        print('WeatherUrl=====${weatherUrl.toString()}');
      }
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('StatusCode=====${response.statusCode}');
          print('Response=====${response.body}');
        }
        final body = jsonDecode(response.body);
        return MausamAppModel.fromJson(body);
      } else {
        throw Exception('Error');
      }
    }
  }
}

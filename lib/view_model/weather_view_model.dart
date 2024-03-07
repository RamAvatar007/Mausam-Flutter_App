import 'package:mausam_weather_app_flutter/model/mausam_app_model.dart';
import '../repository/mausam_repository.dart';

class WeatherViewModel {
  final _rep = WeatherRepository();
  Future<MausamAppModel> fetchWeatherApi(String city) async {
    final response = await _rep.fetchWeatherApi(city);
    return response;
  }
}

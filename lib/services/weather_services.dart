import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKye = 'f6e806f7658347b19e6150301230904';
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
   try{ Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKye&q=$cityName&days=7');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    weather = WeatherModel.fromJson(data);}
    catch(e){
      print(e);
    }
    return weather;
  }
}

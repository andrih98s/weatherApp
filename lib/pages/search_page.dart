import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';

import '../services/weather_services.dart';

class SearchPage extends StatelessWidget {
  //const SearchPage({Key? key}) : super(key: key);
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: TextField(onChanged: (data){
            cityName = data;
          },
            onSubmitted: (data) async {
              cityName = data;
              WeatherService service = WeatherService();

              WeatherModel? weather =
                  await service.getWeather(cityName: cityName!);

              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
              Navigator.pop(context);
            },
            decoration: (InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              suffixIcon: GestureDetector(onTap: ()async {
                WeatherService service = WeatherService();

              WeatherModel? weather =
                  await service.getWeather(cityName: cityName!);

              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
              Navigator.pop(context);
              },
                child: Icon(Icons.search),
              ),
              label: Text('search'),
              border: OutlineInputBorder(),
              hintText: 'Enter a City',
            )),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  // const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.yellow),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

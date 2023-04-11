import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherData;
    weatherData =
        Provider.of<WeatherProvider>(context, listen: true).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contex) {
                    return SearchPage();
                  },
                ),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'There is no Weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.orange],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 3),
                  Text(
                    Provider.of<WeatherProvider>(context).cityName!,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                  'updated at ${weatherData.date.toString()}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/cloudy.png'),
                      Text(
                        '${weatherData.temp.toInt()}',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('maxTemp : ${weatherData.maxTemp.toInt()}',style: TextStyle(fontSize: 18),),
                          Text('minTemp : ${weatherData.minTemp.toInt()}',style: TextStyle(fontSize: 18),),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    weatherData.weatherStateName,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Spacer(flex: 5),
                ],
              )),
    );
  }
}

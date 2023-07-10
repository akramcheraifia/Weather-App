import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          backgroundColor: Colors.blueGrey[900],
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
            ),
          ],
        ),
        body: weatherData == null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('There is no weather yet!'),
                    Text("Let's search for a city."),
                  ],
                ),
              )
            : Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(
                      flex: 3,
                    ),
                    Column(
                      children: [
                        Text(
                            "${Provider.of<WeatherProvider>(context, listen: false).cityName}",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        Text(weatherData!.date),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network("https:${weatherData!.weatherIcon}"),
                        Text(weatherData!.temp.toInt().toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Column(
                          children: [
                            Text(
                                "Max:${weatherData!.maxtemp.toInt().toString()}",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Text(
                                "min : ${weatherData!.mintemp.toInt().toString()}",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(weatherData!.weatherStateName,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    Spacer(
                      flex: 5,
                    ),
                  ],
                ),
              ));
  }
}

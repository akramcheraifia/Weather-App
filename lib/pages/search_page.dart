import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search a City'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onSubmitted: (data) {
                String cityName = data;
                WeatherService service = WeatherService();
                service.getWeather(cityName: cityName);
              },
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                labelText: 'Enter a city name',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 35, horizontal: 10),
                hintText: 'e.g. London',
                fillColor: Colors.white,
                focusColor: Colors.white,
                hoverColor: Colors.white,
                filled: true,
              ),
            ),
          ),
        ));
  }
}

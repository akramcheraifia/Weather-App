// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

import '../models/weather_model.dart';

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
              onSubmitted: (data) async {
                String cityName = data;
                WeatherService service = WeatherService();
                WeatherModel weather =
                    await service.getWeather(cityName: cityName);
                Provider.of<WeatherProvider>(context, listen: false)
                    .weatherData = weather;
                Provider.of<WeatherProvider>(context, listen: false).cityName =
                    cityName;
                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                labelText: 'Enter a city name',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 35, horizontal: 10),
                hintText: 'e.g. Souk ahras',
                filled: true,
              ),
            ),
          ),
        ));
  }
}

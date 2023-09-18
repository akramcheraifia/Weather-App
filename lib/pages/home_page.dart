import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

import '../cubits/weather_cubit/weather_cubit.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        backgroundColor: Colors.blueGrey[900],
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SearchPage();
              }));
            },
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherSuccess) {
            weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
            return SucsessWidget(weatherData: weatherData);
          } else if (state is WeatherFailure) {
            return const Center(
              child: Text("something went wrong"),
            );
          } else {
            return DefaultWidget();
          }
        },
      ),
    );
  }
}

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('There is no weather yet!'),
          Text("Let's search for a city."),
        ],
      ),
    );
  }
}

class SucsessWidget extends StatelessWidget {
  const SucsessWidget({
    super.key,
    required this.weatherData,
  });

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(
          flex: 3,
        ),
        Column(
          children: [
            Text("${BlocProvider.of<WeatherCubit>(context).cityName}",
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Text(weatherData!.date),
          ],
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network("https:${weatherData!.weatherIcon}"),
            Text(weatherData!.temp.toInt().toString(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Column(
              children: [
                Text("Max:${weatherData!.maxtemp.toInt().toString()}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                Text("min : ${weatherData!.mintemp.toInt().toString()}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold))
              ],
            ),
          ],
        ),
        const Spacer(),
        Text(weatherData!.weatherStateName,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        const Spacer(
          flex: 5,
        ),
      ],
    );
  }
}

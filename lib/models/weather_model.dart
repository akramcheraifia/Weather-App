class WeatherModel {
  final String date;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String weatherStateName;
  final String weatherIcon;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxtemp,
    required this.mintemp,
    required this.weatherStateName,
    required this.weatherIcon,
  });

  factory WeatherModel.fromJson(jsonData) {
    return WeatherModel(
      date: jsonData['location']['localtime'],
      temp: jsonData['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxtemp: jsonData['forecast']['forecastday'][0]['day']['maxtemp_c'],
      mintemp: jsonData['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherStateName: jsonData['forecast']['forecastday'][0]['day']
          ['condition']['text'],
      weatherIcon: jsonData['forecast']['forecastday'][0]['day']['condition']
          ['icon'],
    );
  }
  @override
  String toString() {
    return 'WeatherModel(date: $date, temp: $temp, maxtemp: $maxtemp, mintemp: $mintemp, weatherStateName: $weatherStateName, weatherIcon: $weatherIcon)';
  }
}

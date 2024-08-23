import 'package:weather_app/models/daily_weather_model.dart';
import 'package:weather_app/models/hourly_weather_model.dart';

class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherDescription;
  final List<HourlyWeatherModel> hourlyWeather;
  final List<DailyWeatherModel> dailyWeather;

  WeatherModel({
    required this.cityName,
    required this.date,
    this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherDescription,
    required this.hourlyWeather,
    required this.dailyWeather, 
  });

  factory WeatherModel.fromJson(json) {
    List<HourlyWeatherModel> hourlyData = [];
    for (var hour in json['forecast']['forecastday'][0]['hour']) {
      hourlyData.add(HourlyWeatherModel.fromJson(hour));
    }

    List<DailyWeatherModel> dailyData = [];
    for (var day in json['forecast']['forecastday']) {
      dailyData.add(DailyWeatherModel.fromJson(day));
    }

    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      temp: json['current']['temp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherDescription: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      hourlyWeather: hourlyData,
      dailyWeather: dailyData,
    );
  }
}

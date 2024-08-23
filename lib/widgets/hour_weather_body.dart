import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class HourWeather extends StatelessWidget {
  const HourWeather(
      {super.key, required this.weatherModel, required this.index});
  final WeatherModel weatherModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              '${weatherModel.hourlyWeather[index].time.hour.toString().padLeft(2, '0')}:${weatherModel.hourlyWeather[index].time.minute.toString().padLeft(2, '0')}',
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.network(
              'https:${weatherModel.hourlyWeather[index].image}',
              scale: 1.5,
            ),
            Text(
              weatherModel.hourlyWeather[index].temp.round().toString(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 5,
        )
      ],
    );
  }
}

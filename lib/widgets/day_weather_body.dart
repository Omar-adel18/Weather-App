import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_model.dart';

class DayWeather extends StatelessWidget {
  const DayWeather(
      {super.key, required this.weatherModel, required this.index});
  final WeatherModel weatherModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '${weatherModel.dailyWeather[index].date.month.toString().padLeft(2, '0')}/${weatherModel.dailyWeather[index].date.day.toString().padLeft(2, '0')}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 110,
          child: Text(
            DateFormat('EEEE').format(weatherModel.dailyWeather[index].date),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Spacer(),
        Container(
          width: 40,
          alignment: Alignment.center,
          child: Image.network(
            'https:${weatherModel.dailyWeather[index].image}',
            scale: 1.2,
          ),
        ),
        const Spacer(),
        Text(
          '${weatherModel.dailyWeather[index].mintemp.round()} / ${weatherModel.dailyWeather[index].maxTemp.round()}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

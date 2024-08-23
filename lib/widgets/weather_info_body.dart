import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/day_weather_body.dart';
import 'package:weather_app/widgets/hour_weather_body.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            getThemeColor(weatherModel.weatherDescription),
            getThemeColor(weatherModel.weatherDescription)[300]!,
            getThemeColor(weatherModel.weatherDescription)[200]!,
            getThemeColor(weatherModel.weatherDescription)[50]!,
            //Colors.white,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    weatherModel.cityName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  Text(
                    'updated at ${weatherModel.date.hour.toString().padLeft(2, '0')}:${weatherModel.date.minute.toString().padLeft(2, '0')}',
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 80,
                        child: Image.network(
                          'https:${weatherModel.image}',
                        ),
                      ),
                      const SizedBox(
                        width: 90,
                      ),
                      Text(
                        weatherModel.temp.round().toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Column(
                        children: [
                          Text(
                            'Maxtemp: ${weatherModel.maxTemp.round()}',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Mintemp: ${weatherModel.minTemp.round()}',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    weatherModel.weatherDescription,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 95,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    alignment: Alignment.centerLeft,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: weatherModel.hourlyWeather.length,
                      itemBuilder: (context, index) {
                        return HourWeather(
                          weatherModel: weatherModel,
                          index: index,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3,
                    ),
                    height: 405,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: weatherModel.dailyWeather.length,
                      itemBuilder: (context, index) {
                        return DayWeather(
                          weatherModel: weatherModel,
                          index: index,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HourlyWeatherModel {
  final DateTime time;
  final double temp;
  final String image;

  HourlyWeatherModel(
      {required this.time, required this.temp, required this.image});

  factory HourlyWeatherModel.fromJson(json) {
    return HourlyWeatherModel(
      time: DateTime.parse(json['time']),
      temp: json['temp_c'],
      image: json['condition']['icon'],
    );
  }
}

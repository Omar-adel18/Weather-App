class DailyWeatherModel {
  final DateTime date;
  final String image;
  final double maxTemp;
  final double mintemp;

  DailyWeatherModel({
    required this.date,
    required this.image,
    required this.maxTemp,
    required this.mintemp,
  });

  factory DailyWeatherModel.fromJson(json) {
    return DailyWeatherModel(
      date: DateTime.parse(json['date']),
      image: json['day']['condition']['icon'],
      maxTemp: json['day']['maxtemp_c'],
      mintemp: json['day']['mintemp_c'],
    );
  }
}

class WeatherModel {
  final String cityName, lastUpdated, condition;
  String? image;
  final double minTemp, maxTemp, temp;

  WeatherModel({
    required this.cityName,
    required this.lastUpdated,
    required this.condition,
    required this.minTemp,
    required this.maxTemp,
    required this.temp,
    this.image,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      lastUpdated: json['current']['last_updated'],
      temp: json['current']['temp_c'],
      condition: json['current']['condition']['text'],
      image: "https:${json['current']['condition']['icon']}",
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
    );
  }
}

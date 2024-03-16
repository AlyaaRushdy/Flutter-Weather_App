import 'package:weather_app/models/weather_model.dart';

class WeatherStates {}

class NoWeatherState extends WeatherStates {}

class WeatherSuccessState extends WeatherStates {
  final WeatherModel weatherModel;

  WeatherSuccessState({required this.weatherModel});
}

class WeatherFailureState extends WeatherStates {}

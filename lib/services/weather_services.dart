import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseURL = 'http://api.weatherapi.com/v1/',
      apiKey = '95f59e8545bb4ad6b0302006241303';

  WeatherServices(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    Response response =
        await dio.get('${baseURL}forecast.json?key=$apiKey&q=$cityName');

    try {
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'Oops! There was an error! Please try again later!';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops! There was an error! Please try again later!!');
    }
  }
}

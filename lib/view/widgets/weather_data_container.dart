import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherDataContainer extends StatelessWidget {
  const WeatherDataContainer({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).primaryColor,
            Colors.white,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: const TextStyle(
              fontSize: 46,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "updated at ${weatherModel.lastUpdated}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                "${weatherModel.image}",
                fit: BoxFit.fill,
                width: 90,
              ),
              Text(
                weatherModel.temp.round().toString(),
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "min. temp: ${weatherModel.minTemp}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "max. temp: ${weatherModel.maxTemp}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            weatherModel.condition,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

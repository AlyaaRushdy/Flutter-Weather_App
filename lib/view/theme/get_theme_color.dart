import 'package:flutter/material.dart';

MaterialColor getThemeColor(String? condition) {
  switch (condition) {
    case "Sunny":
      return Colors.orange;

    case "Clear":
      return Colors.lightBlue;

    case "Partly cloudy":
    case "Mist":
    case "Patchy light drizzle":
      return Colors.blue;

    case "Thundery outbreaks possible":
    case "Torrential rain shower":
    case "Patchy rain possible":
    case "Light drizzle":
    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain at times":
    case "Heavy rain":
    case "Light rain shower":
    case "Moderate or heavy rain shower":
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
    case "Freezing drizzle":
    case "Heavy freezing drizzle":
    case "Patchy light rain":
    case "Light rain":
    case "Light rain with thunder":
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
      return Colors.grey;

    case "Cloudy":
    case "Overcast":
    case "Fog":
    case "Freezing fog":
    case "Patchy snow possible":
    case "Blowing snow":
    case "Blizzard":
    case "Light snow":
    case "Patchy light snow":
    case "Patchy moderate snow":
    case "Moderate snow":
    case "Patchy heavy snow":
    case "Heavy snow":
    case "Light snow showers":
    case "Moderate or heavy snow showers":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
    case "Ice pellets":
    case "Patchy light snow with thunder":
    case "Moderate or heavy snow with thunder":
    case "Patchy sleet possible":
    case "Light sleet":
    case "Moderate or heavy sleet":
    case "Light sleet showers":
    case "Moderate or heavy sleet showers":
      return Colors.blueGrey;

    default:
      return Colors.blue;
  }
}

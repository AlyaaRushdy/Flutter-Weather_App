import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view-models/get_weather_cubit.dart';
import 'get_theme_color.dart';

ThemeData appTheme(BuildContext context) {
  MaterialColor primColor = getThemeColor(
      BlocProvider.of<GetWeatherCubit>(context).weatherModel?.condition);

  return ThemeData(
      appBarTheme: AppBarTheme(
        color: primColor,
        elevation: 1,
        foregroundColor: Colors.white,
        shadowColor: Colors.black,
        titleTextStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              color: Colors.black,
              blurRadius: 3,
              offset: Offset(.5, .5),
            ),
          ],
        ),
      ),
      primaryColor: primColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(primColor),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          shadowColor: MaterialStateProperty.all(Colors.black),
          shape: MaterialStateProperty.all(const CircleBorder()),
          padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
          iconSize: MaterialStateProperty.all(30),
        ),
      ),
      tabBarTheme: const TabBarTheme(
        indicatorColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,
        labelPadding: EdgeInsets.all(5),
        labelColor: Colors.white,
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          shadows: [
            Shadow(
              color: Colors.black,
              offset: Offset(.5, .5),
              blurRadius: 3,
            ),
          ],
        ),
        unselectedLabelColor: Colors.black38,
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 18,
        ),
      ));
}

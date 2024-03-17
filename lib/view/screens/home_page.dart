import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/view/screens/search_page.dart';
import 'package:weather_app/view/widgets/no_result_widget.dart';
import 'package:weather_app/view/widgets/weather_data_container.dart';
import '../../view-models/auth_cubit.dart';
import '../../view-models/get_weather_cubit.dart';
import '../../view-models/weather_states.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          AuthCubit.get(context).signOut(context);
        },
        child: const Icon(Icons.logout_rounded),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
            icon: const Icon(
              Icons.search_rounded,
              size: 26,
            ),
          ),
        ],
        title: const Text("Weather App"),
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is NoWeatherState) {
            return const NoResultWidget();
          } else if (state is WeatherSuccessState) {
            return WeatherDataContainer(weatherModel: state.weatherModel);
          } else {
            return const Center(
              child: Text("Oops! There was an error"),
            );
          }
        },
      ),
    );
  }
}

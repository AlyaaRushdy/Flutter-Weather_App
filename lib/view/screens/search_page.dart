import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view-models/get_weather_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 26,
          ),
        ),
        leadingWidth: 30,
        title: const Text("Search a City"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: TextField(
            onSubmitted: (cityName) async {
              BlocProvider.of<GetWeatherCubit>(context)
                  .getWeather(cityName: cityName);
              Navigator.pop(context);
            },
            onTapOutside: (PointerDownEvent event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Enter a City Name",
              labelText: "Search",
              labelStyle: const TextStyle(color: Colors.blueGrey),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

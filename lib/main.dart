import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/firebase_options.dart';
import 'package:weather_app/view-models/auth_cubit.dart';
import 'view-models/get_weather_cubit.dart';
import 'view-models/weather_states.dart';
import 'view/screens/tabs_bar.dart';
import 'view/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetWeatherCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          return SafeArea(
            child: MaterialApp(
              theme: appTheme(context),
              debugShowCheckedModeBanner: false,
              home: const TabsBar(),
            ),
          );
        },
      ),
    );
  }
}

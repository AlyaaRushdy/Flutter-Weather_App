import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:weather_app/firebase_options.dart';
import 'package:weather_app/view-models/auth_cubit.dart';
import 'package:weather_app/view-models/weather_states.dart';
import 'package:weather_app/view/screens/home_page.dart';
import 'view-models/get_weather_cubit.dart';
import 'view/screens/tabs_bar.dart';
import 'view/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<GetWeatherCubit>(
        create: (context) => GetWeatherCubit(),
      ),
      BlocProvider<AuthCubit>(
        create: (context) => AuthCubit(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherStates>(
      builder: (context, state) {
        return SafeArea(
          child: MaterialApp(
            theme: appTheme(context),
            debugShowCheckedModeBanner: false,
            home: (FirebaseAuth.instance.currentUser == null)
                ? const TabsBar()
                : const HomePage(),
            builder: EasyLoading.init(),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/splash_screen.dart';
import 'package:weather_app/weather_details_screen.dart';
import 'package:weather_app/weather_provider.dart';

class MyNavigatorObserver extends NavigatorObserver {
  final WeatherProvider weatherProvider;

  MyNavigatorObserver(this.weatherProvider);

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute?.settings.name == '/') {
      weatherProvider.resetState();
    }
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: Consumer<WeatherProvider>(
        builder: (context, weatherProvider, child) {
          return MaterialApp(
            // darkTheme: ThemeData.dark(),
            debugShowCheckedModeBanner: false,
            title: 'Weather App',
            theme: ThemeData(
              primarySwatch: Colors.purple,
            ),
            home: SplashScreen(
            ),
            navigatorObservers: [MyNavigatorObserver(weatherProvider)],
            routes: {
              '/weather-details': (context) => WeatherDetailsScreen(),
            },
          );
        },
      ),
    );
  }
}

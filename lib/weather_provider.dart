import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WeatherProvider with ChangeNotifier {
  final TextEditingController cityController = TextEditingController();
  bool isLoading = false;
  String? errorMessage;
  Map<String, dynamic>? weatherData;

  Future<void> fetchWeather(BuildContext context) async {
    final city = cityController.text;
    if (city.isEmpty) return;

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final apiKey = 'aa03fdb4f483620e5b7bca25836ec7cb';
    final url = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        weatherData = json.decode(response.body);
        _saveLastSearchedCity(city);
        Navigator.of(context).pushNamed('/weather-details');
      } else {
        errorMessage = 'Failed to load weather data';
      }
    } catch (error) {
      errorMessage = 'An error occurred';
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> _saveLastSearchedCity(String city) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('lastSearchedCity', city);
  }

  Future<void> loadLastSearchedCity(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final lastSearchedCity = prefs.getString('lastSearchedCity');
    if (lastSearchedCity != null) {
      cityController.text = lastSearchedCity;
      await fetchWeather(context);
    }
  }
  void resetState() {
    isLoading = false;
    errorMessage = null;
    weatherData = null;
    notifyListeners();
  }
}

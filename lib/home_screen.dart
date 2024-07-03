import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/weather_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 1,
        // backgroundColor: Color.fromARGB(255, 2, 36, 63),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.black, Colors.blue]),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 350,
                child: TextField(
                  controller: weatherProvider.cityController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 198, 219, 255),
                    labelText: 'Enter city name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  weatherProvider.fetchWeather(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 59, 108),
                ),
                child: Text(
                  'Search',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              if (weatherProvider.isLoading) CircularProgressIndicator(),
              if (weatherProvider.errorMessage != null)
                Text(
                  weatherProvider.errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

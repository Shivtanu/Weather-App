import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/weather_provider.dart';

class WeatherDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    final weatherData = weatherProvider.weatherData;

    if (weatherData == null) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Weather Details'),
        ),
        body: Center(
          child: Text('No data available'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Weather Details',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.black, Colors.blue]),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.white,),
            onPressed: () {
              weatherProvider.fetchWeather(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                weatherData['name'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Temperature: ${weatherData['main']['temp']}°C',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Weather: ${weatherData['weather'][0]['description']}',
                style: TextStyle(fontSize: 18),
              ),
              Image.network(
                'http://openweathermap.org/img/wn/${weatherData['weather'][0]['icon']}@2x.png',
              ),
              Text(
                'Humidity: ${weatherData['main']['humidity']}%',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Wind Speed: ${weatherData['wind']['speed']} m/s',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:weather_app/widgets/bottom_list_view.dart';
import 'package:weather_app/widgets/city_view.dart';
import 'package:weather_app/widgets/detail_view.dart';
import 'package:weather_app/widgets/temp_view.dart';

import 'city_screen.dart';

class WeatherForecastScreen extends StatefulWidget {
  final locationWeather;

  WeatherForecastScreen({this.locationWeather});

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<WeatherForecast> forecastObject;
  String _cityName;
  @override
  void initState() {
    super.initState();

    if (widget.locationWeather == null) {
      forecastObject = Future.value(widget.locationWeather);
    }

    // forecastObject.then((weather) {
    //   print(weather.data[0].weather.description);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('weatherbit.io'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.my_location,
          ),
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast();
            });
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.location_city),
            onPressed: () async {
              var tappedName = await Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return CityScreen();
                },
              ));
              if (tappedName != null) {
                setState(() {
                  _cityName = tappedName;
                  forecastObject = WeatherApi()
                      .fetchWeatherForecast(cityName: _cityName, isCity: true);
                });
              }
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: FutureBuilder<WeatherForecast>(
              future: forecastObject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(children: <Widget>[
                    SizedBox(height: 50),
                    CityView(snapshot: snapshot),
                    SizedBox(height: 50),
                    TempView(
                      snapshot: snapshot,
                    ),
                    SizedBox(height: 50),
                    DetailView(
                      snapshot: snapshot,
                    ),
                    SizedBox(height: 50),
                    BottomListView(snapshot: snapshot),
                  ]);
                } else {
                  return Center(
                      child: Text(
                    'City not found\n Please enter correct city',
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  ));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

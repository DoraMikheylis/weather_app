import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const TempView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data.data;
    var icon = forecastList[0].getIconURL();
    var temp = forecastList[0].temp.toStringAsFixed(0);
    var description = forecastList[0].weather.description.toUpperCase();
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                icon,
                scale: 1.3,
              ),
              Text(
                '$temp ℃',
                style: TextStyle(fontSize: 54, color: Colors.black87),
              ),
            ],
          ),
          Text(
            '$description',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

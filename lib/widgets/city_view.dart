import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:weather_app/utilities/forecast_util.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const CityView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data.data;
    var city = snapshot.data.cityName;
    var country = snapshot.data.countryCode;
    var formattedDate =
        DateTime.fromMillisecondsSinceEpoch(forecastList[0].ts * 1000);

    return Container(
      child: Column(
        children: <Widget>[
          Text(
            '$city, $country',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.black87),
          ),
          Text('${Util.getFormattedDate(formattedDate)}',
              style: TextStyle(
                fontSize: 15,
              )),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather_app/utilities/forecast_util.dart';

Widget forecastCard(AsyncSnapshot snapshot, int index) {
  var forecastList = snapshot.data.data;
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].ts * 1000);
  var fullDate = Util.getFormattedDate(date);
  var dayOfWeek = '';
  dayOfWeek = fullDate.split(',')[0];
  var tempMin = forecastList[index].minTemp.toStringAsFixed(0);

  var icon = forecastList[index].getIconURL();

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dayOfWeek,
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      '$tempMin ℃',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  Image.network(
                    icon,
                    scale: 3.5,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

import 'package:weather_app/utilities/constants.dart';

class WeatherForecast {
  List<Data> data;
  String cityName;
  String lon;
  String timezone;
  String lat;
  String countryCode;
  String stateCode;

  WeatherForecast(
      {this.data,
      this.cityName,
      this.lon,
      this.timezone,
      this.lat,
      this.countryCode,
      this.stateCode});

  WeatherForecast.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    cityName = json['city_name'];
    lon = json['lon'];
    timezone = json['timezone'];
    lat = json['lat'];
    countryCode = json['country_code'];
    stateCode = json['state_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['city_name'] = this.cityName;
    data['lon'] = this.lon;
    data['timezone'] = this.timezone;
    data['lat'] = this.lat;
    data['country_code'] = this.countryCode;
    data['state_code'] = this.stateCode;
    return data;
  }
}

class Data {
  int moonriseTs;
  String windCdir;
  int rh;
  num pres;
  num highTemp;
  int sunsetTs;
  num ozone;
  num moonPhase;
  num windGustSpd;
  int snowDepth;
  int clouds;
  int ts;
  int sunriseTs;
  num appMinTemp;
  num windSpd;
  int pop;
  String windCdirFull;
  num slp;
  num moonPhaseLunation;
  String validDate;
  num appMaxTemp;
  num vis;
  num dewpt;
  int snow;
  num uv;
  Weather weather;
  int windDir;
  Null maxDhi;
  int cloudsHi;
  num precip;
  num lowTemp;
  num maxTemp;
  int moonsetTs;
  String datetime;
  num temp;
  num minTemp;
  int cloudsMid;
  int cloudsLow;

  Data({
    this.moonriseTs,
    this.windCdir,
    this.rh,
    this.pres,
    this.highTemp,
    this.sunsetTs,
    this.ozone,
    this.moonPhase,
    this.windGustSpd,
    this.snowDepth,
    this.clouds,
    this.ts,
    this.sunriseTs,
    this.appMinTemp,
    this.windSpd,
    this.pop,
    this.windCdirFull,
    this.slp,
    this.moonPhaseLunation,
    this.validDate,
    this.appMaxTemp,
    this.vis,
    this.dewpt,
    this.snow,
    this.uv,
    this.weather,
    this.windDir,
    this.maxDhi,
    this.cloudsHi,
    this.precip,
    this.lowTemp,
    this.maxTemp,
    this.moonsetTs,
    this.datetime,
    this.temp,
    this.minTemp,
    this.cloudsMid,
    this.cloudsLow,
  });

  Data.fromJson(Map<String, dynamic> json) {
    moonriseTs = json['moonrise_ts'];
    windCdir = json['wind_cdir'];
    rh = json['rh'];
    pres = json['pres'];
    highTemp = json['high_temp'];
    sunsetTs = json['sunset_ts'];
    ozone = json['ozone'];
    moonPhase = json['moon_phase'];
    windGustSpd = json['wind_gust_spd'];
    snowDepth = json['snow_depth'];
    clouds = json['clouds'];
    ts = json['ts'];
    sunriseTs = json['sunrise_ts'];
    appMinTemp = json['app_min_temp'];
    windSpd = json['wind_spd'];
    pop = json['pop'];
    windCdirFull = json['wind_cdir_full'];
    slp = json['slp'];
    moonPhaseLunation = json['moon_phase_lunation'];
    validDate = json['valid_date'];
    appMaxTemp = json['app_max_temp'];
    vis = json['vis'];
    dewpt = json['dewpt'];
    snow = json['snow'];
    uv = json['uv'];
    weather =
        json['weather'] != null ? new Weather.fromJson(json['weather']) : null;
    windDir = json['wind_dir'];
    maxDhi = json['max_dhi'];
    cloudsHi = json['clouds_hi'];
    precip = json['precip'];
    lowTemp = json['low_temp'];
    maxTemp = json['max_temp'];
    moonsetTs = json['moonset_ts'];
    datetime = json['datetime'];
    temp = json['temp'];
    minTemp = json['min_temp'];
    cloudsMid = json['clouds_mid'];
    cloudsLow = json['clouds_low'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['moonrise_ts'] = this.moonriseTs;
    data['wind_cdir'] = this.windCdir;
    data['rh'] = this.rh;
    data['pres'] = this.pres;
    data['high_temp'] = this.highTemp;
    data['sunset_ts'] = this.sunsetTs;
    data['ozone'] = this.ozone;
    data['moon_phase'] = this.moonPhase;
    data['wind_gust_spd'] = this.windGustSpd;
    data['snow_depth'] = this.snowDepth;
    data['clouds'] = this.clouds;
    data['ts'] = this.ts;
    data['sunrise_ts'] = this.sunriseTs;
    data['app_min_temp'] = this.appMinTemp;
    data['wind_spd'] = this.windSpd;
    data['pop'] = this.pop;
    data['wind_cdir_full'] = this.windCdirFull;
    data['slp'] = this.slp;
    data['moon_phase_lunation'] = this.moonPhaseLunation;
    data['valid_date'] = this.validDate;
    data['app_max_temp'] = this.appMaxTemp;
    data['vis'] = this.vis;
    data['dewpt'] = this.dewpt;
    data['snow'] = this.snow;
    data['uv'] = this.uv;
    if (this.weather != null) {
      data['weather'] = this.weather.toJson();
    }
    data['wind_dir'] = this.windDir;
    data['max_dhi'] = this.maxDhi;
    data['clouds_hi'] = this.cloudsHi;
    data['precip'] = this.precip;
    data['low_temp'] = this.lowTemp;
    data['max_temp'] = this.maxTemp;
    data['moonset_ts'] = this.moonsetTs;
    data['datetime'] = this.datetime;
    data['temp'] = this.temp;
    data['min_temp'] = this.minTemp;
    data['clouds_mid'] = this.cloudsMid;
    data['clouds_low'] = this.cloudsLow;
    return data;
  }

  String getIconURL() {
    return Constants.WEATHER_IMAGES_URL + weather.icon + '.png';
  }
}

class Weather {
  String icon;
  int code;
  String description;

  Weather({this.icon, this.code, this.description});

  Weather.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['code'] = this.code;
    data['description'] = this.description;
    return data;
  }
}

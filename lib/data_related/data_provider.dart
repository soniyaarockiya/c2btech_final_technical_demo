import 'package:flutter/cupertino.dart';

import 'weather_pojo.dart';

class DataProvider extends ChangeNotifier {
  //Variables with dummy data
  String cityName = "City";
  String countryName = "Country";
  String temperature = "0";
  String weatherIcon =
      "https://assets.weatherstack.com/images/wsymbols01_png_64/wsymbol_0006_mist.png";
  String weatherDescription = "weather description";

  //Weather obj
  Weather _weather = new Weather();

  void changeString(weather) {
    this._weather = weather;
    this.cityName = _weather.name;
    this.countryName = _weather.country;
    this.temperature = _weather.temperature;
    this.weatherIcon = _weather.weatherIcon;
    this.weatherDescription = _weather.weatherDescription;
    notifyListeners();
  }
}

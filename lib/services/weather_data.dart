import 'package:c2btechfinaltechnicaldemo/data_related/weather_pojo.dart';
import 'package:c2btechfinaltechnicaldemo/services/network_api_call.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//This will deal with anything and everything related to weather,
// the network class gives the input to this class.
const apiKey = "e8602e0331bd3ab56fbaf6b3e237f16b";

class WeatherData {
  //  Ui constants
  Networking _networking = Networking();

  String name;
  String country;
  String temperature;
  String weatherIcon;
  String weatherDescription;

  Future<Weather> getLocationWeather(LatLng latLng) async {
    //Attach api key and lat long value to the url
    String url =
        "http://api.weatherstack.com/current?access_key=$apiKey&query=${latLng.latitude.toString()},${latLng.longitude.toString()}";

    // Get Response
    dynamic response = await _networking.getData(url);

    //Weather data
    name = (response['location']['name']).toString();
    country = (response['location']['country']).toString();
    temperature = (response['current']['temperature']).toString();
    weatherIcon = response['current']['weather_icons'][0];
    weatherDescription =
        (response['current']['weather_descriptions'][0]).toString();

    //Add the values to weather object
    Weather weather = new Weather(
        name: name,
        country: country,
        temperature: temperature,
        weatherIcon: weatherIcon,
        weatherDescription: weatherDescription);

    //pass the weather object
    return weather;
  }
}

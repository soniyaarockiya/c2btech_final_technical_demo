import 'package:c2btechfinaltechnicaldemo/data_related/city_pojo.dart';
import 'package:c2btechfinaltechnicaldemo/data_related/data_provider.dart';
import 'package:c2btechfinaltechnicaldemo/screens/home_screen.dart';
import 'package:c2btechfinaltechnicaldemo/services/weather_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  WeatherData _weatherData = new WeatherData();

  ScrollController _scrollController = ScrollController();
  int pageNumber = 1;
  String dummy = 'Dummy';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          //url uses page number as a value
//          pageNumber += 1;
//          getBeerData();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: _scrollController,
        //index overflow for cupertino indicator to work
        itemCount: cityDetails.length + 1,
        itemBuilder: (context, int index) {
          if (index == cityDetails.length) {
            return CupertinoActivityIndicator(
              radius: 30.0,
            );
          }
          return GestureDetector(
            onTap: () {
              handleTapEvent(
                  LatLng(cityDetails[index].lat, cityDetails[index].lang));
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 18.0),
              child: Card(
                color: Colors.grey[400],
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                  child: Text(
                    cityDetails[index].cityName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  void handleTapEvent(LatLng latLng) async {
    dynamic weather = await _weatherData.getLocationWeather(latLng);
    Provider.of<DataProvider>(context, listen: false).changeString(weather);
    final BottomNavigationBar navigationBar = globalKey.currentWidget;
    navigationBar.onTap(0);
  }
}

import 'package:c2btechfinaltechnicaldemo/screens/current_location_weather_screen.dart';
import 'package:c2btechfinaltechnicaldemo/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data_related/data_provider.dart';

//Reference : https://willowtreeapps.com/ideas/how-to-use-flutter-to-build-an-app-with-bottom-navigation -- bottom nav
//Stack overflow -- for Indexed stack ...to maintain widget state while using bottom nav --- book marked
// Bottom nav global key concept -- https://stackoverflow.com/questions/50961158/how-to-programmatically-select-bottomnavigationbar-tab-in-flutter-instead-of-bui

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataProvider>(
      create: (context) => DataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          accentColor: Colors.grey[600],
          scaffoldBackgroundColor: Colors.black87,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          'currentWeather': (context) => CurrentLocationWeather(),
        },
      ),
    );
  }
}

import 'package:c2btechfinaltechnicaldemo/data_related/data_provider.dart';
import 'package:c2btechfinaltechnicaldemo/sub_widgets/card_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentLocationWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //CardView is implemented in sub widgets folder
      child: CardView(
        name: Provider.of<DataProvider>(context).cityName,
        country: Provider.of<DataProvider>(context).countryName,
        temperature: Provider.of<DataProvider>(context).temperature,
        weatherIcon: Provider.of<DataProvider>(context).weatherIcon,
        weatherDescription:
            Provider.of<DataProvider>(context).weatherDescription,
      ),
    );
  }
}

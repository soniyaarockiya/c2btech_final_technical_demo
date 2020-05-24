import 'package:c2btechfinaltechnicaldemo/data_related/city_pojo.dart';
import 'package:c2btechfinaltechnicaldemo/services/handle_tap_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapMarkers {
  //Get city data along with coordinates and add them to markers set
  Set<Marker> _markers = Set<Marker>();
  HandleTapEvent _handleTapEvent = new HandleTapEvent();

  Set<Marker> setMarkers(BuildContext context) {
    for (City city in cityDetails) {
      _markers.add(new Marker(
        markerId: MarkerId(city.cityName),
        position: LatLng(city.lat, city.lang),
        icon: BitmapDescriptor.defaultMarker,
        //handle tap on markers
        onTap: () {
          //Retrieve weather data for the tapped marker and display the details
          // on the home screen where current location data was displayed.
          _handleTapEvent.handleTapEvent(LatLng(city.lat, city.lang), context);
        },
        infoWindow: InfoWindow(title: city.cityName),
      ));
    }
    return _markers;
  }
}

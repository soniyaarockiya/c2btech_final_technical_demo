import 'dart:async';

import 'package:c2btechfinaltechnicaldemo/sub_widgets/map_markers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  //Ui constants
  Completer<GoogleMapController> _controller = Completer();
  MapMarkers _mapMarkers = new MapMarkers();
  bool _mapLoading = true;
  Set<Marker> _marker;

  //Markers are added in a different class
  void setMarkers(BuildContext context) {
    _marker = _mapMarkers.setMarkers(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            markers: _marker,
            initialCameraPosition: CameraPosition(
                target: LatLng(
                  19.1136,
                  72.8697,
                ),
                zoom: 5.0),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              setState(() {
                _mapLoading = false;
              });
              //set Markers after completion
              setMarkers(context);
            },
          ),

          //If map is still loading it will display a progress indicator -- Stack is the only solution
          if (_mapLoading)
            Center(
              child: CupertinoActivityIndicator(
                radius: 60.0,
              ),
            ),
        ],
      ),
    );
  }
}

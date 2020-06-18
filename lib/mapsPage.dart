import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:collection';
import 'dart:convert';

class MapsPage extends StatefulWidget {
  double lat, lon;
  MapsPage({this.lat, this.lon});
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  Dio dio = new Dio();
  GoogleMapController _mapController;
  Set<Marker> _markers = HashSet<Marker>();
  String id;
  int i = 0;
  double zoom = 6;
  bool done = false;
  // void _onMapCreated(GoogleMapController controller) {
  //   _mapController = controller;
  //   setState(() {
  //     _markers.add(Marker(
  //       markerId: MarkerId("0"),
  //       position: LatLng(lat, lon),
  //     ));
  //   });
  // }

  void setMarker(lat, lon) {
    setState(() {
      print("hello");
      _markers.add(Marker(
        markerId: MarkerId("0"),
        position: LatLng(lat, lon),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Stack(children: <Widget>[
          GoogleMap(
            //onMapCreated: _onMapCreated,
            markers: _markers,
            initialCameraPosition:
                CameraPosition(zoom:6, target: LatLng(36.0339, 3.6596)),
          ),
          Container(
              alignment: Alignment.bottomCenter,
              child: FlatButton(
                  onPressed: () {
                    print(widget.lat);
                    setState(() {
                      setMarker(widget.lat, widget.lon);
                    });
                  },
                  child: Text("See hospital"))),
        ]));
  }
}

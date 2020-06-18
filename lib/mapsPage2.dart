import 'dart:collection';
import 'dart:convert';
import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  GoogleMapController _mapController;
  Set<Marker> _markers = HashSet<Marker>();
  double lon = 0.0, lat = 0.0;
  double zoom = 4.0;
  String wilaya = "", status;
  int wilaya_id, places;
  String id;

  Future<Response> getHospital() async {
    Response response = await post(
                      "https://dzcare.cleverapps.io/api/hospitals/besthospital",
                      headers: <String, String>{
                        "Content-Type": "application/json"
                      },
                      body: {
                        'lat': '$lat',
                        'lng': '$lon'
                      });
    return response;
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId("0"),
        position: LatLng(lat, lon),
      ));
    });
  }

  void setMarker(lan, lon) {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId("1"),
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
            //   onMapCreated: _onMapCreated,
            initialCameraPosition:
                CameraPosition(zoom: zoom, target: LatLng(36.0339, 3.6596)),
            markers: _markers,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: FlatButton(
                onPressed: (() async {
                  print("heelooo");
                  Response response = await post(
                      "https://dzcare.cleverapps.io/api/hospitals/besthospital",
                      // headers: <String, String>{
                      //   'Content-Type': 'application/json', 'Accept':'application/json'
                      // },
                      body: json.encode({
                        'lat': '$lat',
                        'lng': '$lon'
                      }));
                  
                   var extractdata = jsonDecode(response.body);
                   print(response.body);
                  //HashMap<String, dynamic> data = extractdata["data"];
                 // print(data);

                  Position position = await Geolocator().getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.lowest);
                  print("heelooo");

//here searching for the best hospital
                  // List<Placemark> p = await Geolocator()
                  //     .placemarkFromCoordinates(
                  //         position.latitude, position.longitude);
                  lat = position.latitude;
                  lon = position.longitude;
                  print(position);
                  response =
                      await get("https://dzcare.cleverapps.io/api/hospitals");
                  //print(response.body);
                  // var extractdata = jsonDecode(response.body);
                  List data = extractdata["data"];
                  id = data[0]["id"];
                  lat = data[0]["lat"];
                  lon = data[0]["lng"];
                  print(id);

                  Response bestHospital = await post(
                      "https://dzcare.cleverapps.io/api/hospitals/besthospital",
                      headers: <String, String>{
                        "Content-Type": "application/json"
                      },
                      body: {
                        'lat': '$lat',
                        'lng': '$lon'
                      });
                  print("heelooo");
                  print(bestHospital.body);
                  var extractHospital = jsonDecode(bestHospital.body);
                  var hospitals = extractHospital["data"];
                  print(hospitals);
                  id = extractHospital[0]["id"];
                  lat = hospitals[0]["lat"];
                  lon = hospitals[0]["lng"];
                  print(id);
                  print(lat);
                  places = hospitals[0]["places"];

                  //here getting the coords of the wilaya or region

                  /*  List<Placemark> placemark =
                      await Geolocator().placemarkFromAddress("$wilaya");
                  lon = placemark[0].position.longitude;
                  lat = placemark[0].position.latitude;
                  Placemark place = p[0];
                  print(place.locality);
                  print(place.administrativeArea);*/

// here allocating

                  Response allocation = await put(
                      "https://dzcare.cleverapps.io/api/hospitals/allocate",
                      body: {
                        'id': id,
                      });

                  var extractalloc = jsonDecode(allocation.body);
                  List alloc = extractalloc["data"];
                  status = alloc[0]["status"];
                  if (status == "error") {
                    Response response =
                        await get("https://dzcare.cleverapps.io/api/hospitals");
                    //print(response.body);
                    var extractdata = jsonDecode(response.body);
                    List data = extractdata["data"];
                    id = data[0]["id"];
                    lat = data[0]["lat"];
                    lon = data[0]["lng"];
                    wilaya_id = data[0]["wilaya_id"];
                    wilaya = kWilaya[0]; //nrmlmt ta3 wilaya_id-1

                  }

                  setState(() {
                    setMarker(lat, lon);
                    zoom = 30;
                  });
                }),
                child: Text(
                  "press me",
                  style: TextStyle(color: Colors.black),
                )),
          )
        ]));
  }
}

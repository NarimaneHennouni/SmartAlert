import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'mapsPage.dart';

class HospitalPage extends StatelessWidget {
  String name, add;
  double lng, lat;
  HospitalPage({this.add, this.name, this.lat, this.lng});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
          home: Scaffold(
        backgroundColor: Color(0xff070E28),
            body: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: <Widget>[
                  Container(alignment: Alignment.topCenter,
                    height: 50,
                    width: 100,
                    child: Image.asset("assets/DZAlert!.png"),),
                    SizedBox(height:100),
                  Container(
                    alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                    
          Text(
                  "Hospital name: ",
                  style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SizedBox(height: 30),
          Text(
                  "$name",
                  style: TextStyle(fontSize: 20, color: Colors.yellow),
          ),
          SizedBox(height: 30),
          Text(
                  "hospital's add",
                  style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SizedBox(height: 30),
          Text(
                  "$add",
                  style: TextStyle(fontSize: 20, color: Colors.yellow),
          ),
          SizedBox(height: 100),
          Text(
                  "See on map",
                  style: TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.w100),
          ),
          RaisedButton(
                  onPressed: () {
                    print(lat);
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return MapsPage(
                        lat: lat,
                        lon: lng,
                      );
                    }));
                  },
                  child: Icon(Icons.map),
          )
        ])),
                ],
              ),
            ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'mapsPage.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:collection';
import 'hospitalePage.dart';

class Infos extends StatelessWidget {
  Infos({this.nom, this.add, this.dateNaissance, this.number, this.prenom});
  String nom = "", prenom = "", add = "", dateNaissance = "", number = "";
  double lon = 0.0, lat = 0.0, lat_user = 0, lon_user = 0;
  String id;
  int i = 0;
  Dio dio = new Dio();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Color(0xff070E28),
      home: Scaffold(
        backgroundColor: Color(0xff070E28),
        body: Column(
          children: <Widget>[
            SizedBox(height:50),
            Container(height:100,
                    width:100,
                    alignment: Alignment.topCenter,
                    child: Image.asset("assets/DZAlert!.png")),
            SingleChildScrollView(
                          child: Container(
                
                
                        child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4.0, 8.0, 0.0, 8.0),
                    child: Text("Nom:                   $nom",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4.0, 8.0, 0.0, 8.0),
                    child: Text("Prenom:                $prenom",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4.0, 8.0, 0.0, 8.0),
                    child: Text("Addresse:               $add",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4.0, 8.0, 0.0, 8.0),
                    child: Text("Numero de telephone:   $number",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4.0, 8.0, 0.0, 8.0),
                    child: Text("Date de naissance:     $dateNaissance",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.white)),
                  ),
                  
                        FlatButton(
                          child: Column(
                            children: <Widget>[
                              Image.asset("assets/alert.png"),
                            ],
                          ),
                          onPressed: () async {
                            Position position = await Geolocator()
                                .getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
                            lat_user = position.latitude;
                            lon_user = position.longitude;
                            print(position);

                            Response besthospital = await dio.post(
                                "https://dzcare.cleverapps.io/api/hospitals/besthospital",
                                data: {'lat': '$lat_user', 'lng': '$lon_user'});
                            lon = besthospital.data["data"]["lng"];
                            lat = besthospital.data["data"]["lat"];
                            id = besthospital.data["data"]["id"];
                            print(besthospital.data["data"]["wilaya_id"]);

                            Response allocation = await dio.put(
                                "https://dzcare.cleverapps.io/api/hospitals/allocate",
                                data: {
                                  'id': id,
                                });
                            print(allocation.statusCode);
                            if (allocation.statusCode != 200) {
                              besthospital =
                                  await dio.get("https://dzcare.cleverapps.io/api/hospitals");
                              /* while(done==false){
                                      List<Placemark> p = await Geolocator()
                                    .placemarkFromCoordinates(
                                        position.latitude, position.longitude);
                                      Placemark place = p[0];
                                  print(place.administrativeArea);
                                     if( hosp.data[i]["wilaya_id"]==place.administrativeArea){ //faire la liste de correspendance
                                       lat=bestHospital.data[i]["lat"];
                                      lon=besthospital.data["data"]["lng"];
                                      done=true;
                                      setState(() {
                                       zoom = 30;
                                    setMarker(lat, lon);
                                    });
                                    
                                     }
                                     else{
                                       i++;
                                     }

                                    }*/
                              print("just a test");
                              print(besthospital.data);
                            }
                            print(besthospital.data["data"]["name"]);
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return HospitalPage(
                                  name: besthospital.data["data"]["name"],
                                  add: besthospital.data["data"]["address"],
                                  lat: besthospital.data["data"]["lat"],
                                  lng: besthospital.data["data"]["lng"]);
                            }));
                          },
                        ),
                        
                      
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

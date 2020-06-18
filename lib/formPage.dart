import 'constants.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/material.dart';
import 'mapsPage.dart';
import 'InfoPatient.dart';
import 'package:validators/validators.dart';

class FormPage extends StatelessWidget {
  String nom = "", prenom = "", add = "", dateNaissance = "", number = "";
  bool checked1 = false, checked2 = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
          home: Scaffold(
        backgroundColor: Color(0xff070E28),
        body: Container(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 50, 30.0, 0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(height:100,
                      width:100,
                      alignment: Alignment.topCenter,
                      child: Image.asset("assets/DZAlert!.png")),
                Text(
                  "Enter the patient's infos",
                  style: TextStyle(
                      color: Colors.yellow, 
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextField(
                    decoration: InputDecoration(hintText: "Entrez nom",hintStyle: TextStyle(color:Colors.white)),
                    onChanged: (value) {
                      nom = value;

                      if (!(isAlpha(value))) {
                        print('Please enter only characters');
                      }

                      print(value);
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration: InputDecoration(hintText: "entrez prénom",hintStyle: TextStyle(color:Colors.white)),
                  onChanged: (value) {
                    prenom = value;
                    print(value);
                    if (!(isAlpha(value))) {
                      print('Please enter only characters');
                    }
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration: InputDecoration(hintText: "entrez addresse", hintStyle: TextStyle(color:Colors.white)),
                  onChanged: (value) {
                    add = value;
                    print(value);
                  },
                ),
                TextField(
                  decoration: InputDecoration(hintText: "entrez n° telephone",hintStyle: TextStyle(color:Colors.white)),
                  onChanged: (value) {
                    number = value;

                    print(value);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return Infos(
                          nom: nom,
                          prenom: prenom,
                          add: add,
                          number: number,
                          dateNaissance: dateNaissance);
                    }));
                  },
                  child: Text("Submit"),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}

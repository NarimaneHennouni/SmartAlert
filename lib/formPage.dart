import 'constants.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/material.dart';
import 'mapsPage.dart';
import 'InfoPatient.dart';
import 'package:validators/validators.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String nom = "",
      prenom = "",
      add = "",
      dateNaissance = "",
      number = "",
      email = "",
      gender = "";
  bool checked1 = false, checked2 = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff070E28),
        body: Container(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                    height: 100,
                    width: 100,
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
                  height: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        hintText: "Entrez nom",
                        hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400)),
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
                  height: 15.0,
                ),
                TextField(
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      hintText: "entrez prénom",
                      hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400)),
                  onChanged: (value) {
                    prenom = value;
                    print(value);
                    if (!(isAlpha(value))) {
                      print('Please enter only characters');
                    }
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      hintText: "entrez addresse",
                      hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400)),
                  onChanged: (value) {
                    add = value;
                    print(value);
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    hintText: "entrez n° telephone",
                    hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),
                  ),
                  onChanged: (value) {
                    number = value;

                    print(value);
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      hintText: "entrez email",
                      hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400)),
                  onChanged: (value) {
                    email = value;
                    print(value);
                    if (!(isAlpha(value))) {
                      print('Please enter only characters');
                    }
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                // Row(
                //children: <Widget>[
                   TextField(
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      hintText: "Date de naissance",
                      hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400)),
                  onChanged: (value) {
                    dateNaissance = value;
                    print(value);
                  },
                ),
                 SizedBox(
                  height: 15.0,
                ),
                Container(
                  color: Colors.grey[300],
                    child: CheckboxListTile(
                  value: checked1,
                  onChanged: (bool value) {
                    print(value);
                    gender = value ? "Female" : null;
                    
                    setState((){
                      checked1=value;
                      checked2=!value;

                    });
                  },
                  checkColor: Colors.yellow,
                  title: Text("Female"),
                )),
                 SizedBox(
                  height: 10.0,
                ),
                Container(
                  color: Colors.grey[300],
                  child: CheckboxListTile(
                    value: checked2,
                    onChanged: (bool value) {
                      
                      setState((){
                      checked2 =value;
                      checked1=!value;
                      gender = value ? "Male" : null;
                    });
                    print(value);
                    },
                    title: Text("Male"),
                  ),
                ),
                //   ],
                // ),
                 SizedBox(
                  height: 10.0,
                ),

                RaisedButton(
                  onPressed: () {
                    print("gender is $gender");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Infos(
                        nom: nom,
                        prenom: prenom,
                        add: add,
                        number: number,
                        dateNaissance: dateNaissance,
                        email: email,
                        sex: gender,
                      );
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

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:geolocator/geolocator.dart';
import 'constants.dart';
import 'formPage.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:http/http.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password;
  bool falseEmail = true, falsePassword = true, displayError = false;
  Widget msgError(displayError) {
    if (displayError) {
      return Text("Email or Password is wrong");
    } else {
       return Text("sucess");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          height: 700,
              color: Color(0xff070E28),
          child:  Column(
                  children: <Widget>[
                    SizedBox(height:20),
                  Container(
                    height:300,
                    width:300,
                    child: Image.asset("assets/DZAlert!.png")
                  ),
                  //SizedBox(height: 20.0),
                  Padding(
                     padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        //boxShadow: BoxShadow(color:Colors.blue),
                        color: Colors.white,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.grey[400])),
                        onChanged: (var value) async {
                          email = value;
                          // Response resp1 = await get(
                          //     "https://dzcare.cleverapps.io/api/ambulanciers/$email");
                          // if (resp1.statusCode == 200) {
                          //   falseEmail = false;
                          // }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.grey)),
                        onChanged: (var value) {
                          password = value;
                          // Response resp2 = await get(
                          //     "https://dzcare.cleverapps.io/api/ambulanciers/$email&$password");
                          // if (resp2.statusCode == 200) {
                          //   falsePassword = false;
                          // }
                        },
                      ),
                    ),
                  ),
              SizedBox(height: 20.0),
           //   msgError(displayError),
              RaisedButton(
                onPressed: () {
                  // if (falseEmail || falsePassword) {setState(() {
                  //   displayError=true;
                  // });}
                  // else{
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FormPage();
                  }));
                  // }
                },
                child: Text("login"),
                color: Colors.grey[100],
                elevation: 8.0,
      )])),
    );
  }
}

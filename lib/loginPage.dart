import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:geolocator/geolocator.dart';
import 'constants.dart';
import 'formPage.dart';
import 'package:http/http.dart';
//import 'package:dio/dio.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Dio dio = new Dio();
  TextEditingController _controller1 = new TextEditingController();
  TextEditingController _controller2 = new TextEditingController();
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
          child: Column(children: <Widget>[
            SizedBox(height: 20),
            Container(
                height: 300,
                width: 300,
                child: Image.asset("assets/DZAlert!.png")),
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
                  controller: _controller1,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey[400])),
                  onChanged: (var value) async {
                    email = value;
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
                  controller: _controller2,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey)),
                  onChanged: (var value) {
                    password = value;
                  },
                ),
              ),
            ),
            SizedBox(height: 20.0),
            //   msgError(displayError),
            RaisedButton(
              onPressed: () async {
                print(email);
                print(password);
                // Response resp2 = await post("https://dzcare.cleverapps.io/api/login/paramedic",body:
                //      {'email': '$email', 'password': '$password'});
                //     print(resp2.statusCode);
                // if(resp2.statusCode!=200)
                // {
                //   setState(() {
                //     _controller1.clear();
                //     _controller2.clear();
                //   });
                // }
                // else{
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FormPage();
                }));
                //  }
              },
              child: Text("login"),
              color: Colors.grey[100],
              elevation: 8.0,
            )
          ])),
    );
  }
}

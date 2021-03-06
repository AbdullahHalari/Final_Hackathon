// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:shoppping_app/bottombar.dart';
import 'package:shopping_app/bottombar.dart';


class Signup extends StatefulWidget {

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    final TextEditingController fnameController = TextEditingController();
    final TextEditingController lnameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController urlcontroller = TextEditingController();
    final TextEditingController addController = TextEditingController();

    void register() async {
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;
      final String fname = fnameController.text;
      final String lname = lnameController.text;
      final String email = emailController.text;
      final String password = passwordController.text;
      final String phone = phoneController.text;
      final String add = addController.text;
      final String url = urlcontroller.text;
      try {
        final UserCredential user = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await db.collection("users").doc(user.user!.uid).set({
          "email": email,
          "first_name": fname,
          "last_name": lname,
          "password": password,
          "phone_number": phone,
          "address": add,
          "url": url,
        });
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => Bottombar()));
        print("user is registerd");
      } catch (e) {
        print(e);
      }
      
    }

    return Scaffold(
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
                padding: EdgeInsets.all(3),
                child: ListView(
                  children: <Widget>[
                    Container(
                      
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(3),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        style: TextStyle(color: Colors.red),
                        cursorColor: Colors.red,
                        controller: fnameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hoverColor: Colors.amber[800],
                          labelStyle: TextStyle(color: Colors.black),
                          // ignore: prefer_const_constructors
                          fillColor: Color.fromRGBO(255, 255, 255, 0.6),
                          filled: true,
                          labelText: 'First Name',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        style: TextStyle(color: Colors.red),
                        cursorColor: Colors.red,
                        controller: lnameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hoverColor: Colors.amber[800],
                          labelStyle: TextStyle(color: Colors.black),
                          labelText: 'Last Name',
                          fillColor: Color.fromRGBO(255, 255, 255, 0.6),
                          filled: true,
                        ),
                      ),
                    ),
                     Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        style: TextStyle(color: Colors.red),
                        cursorColor: Colors.red,
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hoverColor: Colors.amber[800],
                          labelStyle: TextStyle(color: Colors.black),
                          fillColor: Color.fromRGBO(255, 255, 255, 0.6),
                          filled: true,
                          labelText: 'Email',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        style: TextStyle(color: Colors.red),
                        cursorColor: Colors.red,
                        controller: addController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.location_city,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hoverColor: Colors.amber[800],
                          labelStyle: TextStyle(color: Colors.black),
                          fillColor: Color.fromRGBO(255, 255, 255, 0.6),
                          filled: true,
                          labelText: 'Address',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        style: TextStyle(color: Colors.red),
                        cursorColor: Colors.red,
                        controller: phoneController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.payment,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hoverColor: Colors.amber[800],
                          labelStyle: TextStyle(color: Colors.black),
                          fillColor: Color.fromRGBO(255, 255, 255, 0.6),
                          filled: true,
                          labelText: 'Payment detail',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        textInputAction: TextInputAction.go,
                        style: TextStyle(color: Colors.red),
                        cursorColor: Colors.red,
                        controller: passwordController,
                        obscureText: _isHidden,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                          suffix: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(
                              _isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hoverColor: Colors.amber[800],
                          labelStyle: TextStyle(color: Colors.black),
                          labelText: 'Password (at least 6 char)',
                          fillColor: Color.fromRGBO(255, 255, 255, 0.6),
                          filled: true,
                        ),
                      ),
                    ),
                   
                    Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                            ),
                            child: Text('Sign up'),
                            onPressed: register)),
                   
                  ],
                ))));
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}

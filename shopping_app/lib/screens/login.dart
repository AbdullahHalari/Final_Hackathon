
// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_app/bottombar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shopping_app/screens/signup.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final storage = new FlutterSecureStorage();

  bool _isHidden = true;
  bool loggedIn = false;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void login() async {
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;
      final String email = emailController.text;
      final String password = passwordController.text;
      try {
        final UserCredential user = await auth.signInWithEmailAndPassword(
            email: email, password: password);
        await storage.write(key: "uid", value: user.user!.uid);
        final DocumentSnapshot snapshot =
            await db.collection("user").doc(user.user!.uid).get();
        snapshot.data();
        this.setState(() {
          loggedIn = true;
        });
        Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => Bottombar()));
        print("user is logged in");
      } catch (e) {
        print("error");
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Text(e.toString()),
              );
            });
        
      }
    }

    return Scaffold(
      
        body: Container(
          
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/2.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              child:
               Image.asset(
                'images/logo.png',
                width: 100,
                height: 110,
              ),
            ),
            Container(
                alignment: Alignment.center,
                child: Text(
                  'Welcome back!',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                style: TextStyle(color: Colors.red),
                cursorColor: Colors.red,
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                      
                      ),

                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(25)),
                  fillColor: Color.fromRGBO(255, 255, 255, 0.6),
                  filled: true,
                  hoverColor: Colors.amber[800],
                  labelStyle: TextStyle(color: Colors.white),

                  labelText: 'Email',
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
                    color: Colors.white,
                  ),
                  suffix: InkWell(
                    onTap: _togglePasswordView,
                    child: Icon(
                      _isHidden ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: (Colors.black))),
                  hoverColor: Colors.amber[800],
                  fillColor: Color.fromRGBO(255, 255, 255, 0.6),
                  filled: true,
                  labelStyle: TextStyle(color: Colors.white),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
              height: 70,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    primary: Colors.black,
                  ),
                  onPressed: login,

                 
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text("Login"),
                  )),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Column(
                  children: [
                    Text(
                      "Does not have any account ?",
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              primary: Colors.black,
                              padding: EdgeInsets.fromLTRB(100, 0, 100, 0)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => (Signup())));
                          },
                          child: Text("Sign up")),
                    ),
                  ],
                )),
          ],
        ),
      ),
    ));
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}

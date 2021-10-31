import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping_app/screens/cart.dart';
import 'package:shopping_app/screens/login.dart';

Widget usercart() {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
   return Cart();
  } else {
    return Login();
  }
}

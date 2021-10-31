// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_app/checkuser/userfavorite.dart';
import 'package:shopping_app/checkuser/userprofile.dart';
import 'package:shopping_app/checkuser/usercart.dart';
import 'package:shopping_app/screens/home.dart';
import 'package:shopping_app/screens/profile.dart';
import 'package:shopping_app/screens/signup.dart';
import 'package:shopping_app/screens/login.dart';
import 'package:shopping_app/screens/cart.dart';

import 'package:shopping_app/screens/search.dart';
import 'package:shopping_app/screens/favorite.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:bottom_bars/bottom_bars.dart';
import 'package:shopping_app/screens/signup.dart';

// ignore: use_key_in_widget_constructors
class Bottombar extends StatefulWidget {
  @override
  _BottombarState createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  @override
  Widget build(BuildContext context) {
SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

     return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: BottomBars(
      
      items: [
              
        BottomBarsItem(
          
          page: 
          const Scaffold(
            body: 
            Home()
          
          
            
          ),

          item: Item(
            activeColor: Colors.amber,
           color: Colors.blueGrey,
            icon: Icons.home,iconSize: 30,
            title: const Text("Home"),
            
          ),
          
        ),
         BottomBarsItem(
          
          page: 
           Scaffold(
            body: 
            Search()
          
          
            
          ),

          item: Item(
            activeColor: Colors.amber,
           color: Colors.blueGrey,
            icon: Icons.search,iconSize: 30,
            title: const Text("Search"),
            
          ),
          
        ),
      BottomBarsItem(
          
          page: 
            Scaffold(
            body: 
            usercart()
          
          
            
          ),

          item: Item(
            activeColor: Colors.amber,
           color: Colors.blueGrey,
            icon: Icons.shopping_cart,iconSize: 30,
            title: const Text("Cart"),
            
          ),
          
        ),
        BottomBarsItem(
          
          page: 
           Scaffold(
            body: 
            userfavorite()
          
          
            
          ),

          item: Item(
            activeColor: Colors.amber,
           color: Colors.blueGrey,
            icon: Icons.favorite,iconSize: 30,
            title: const Text("Favorite"),
            
          ),
          
        ),
       
        BottomBarsItem(
          
          page: 
           Scaffold(
            body: 
            userprofile()
          
          
            
          ),

          item: Item(
            activeColor: Colors.amber,
           color: Colors.blueGrey,
            icon: Icons.person,iconSize: 30,
            title: const Text("Profile"),
            
          ),
          
        ),
        
      ],),
    );
    
  
    
  }
}

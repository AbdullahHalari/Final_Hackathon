// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  String collectionName = "favorites";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
    
            title: Center(child: Text("Your Favorites")),
            automaticallyImplyLeading: false,

            backgroundColor: Colors.black,
          
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(collectionName)
              .doc(FirebaseAuth.instance.currentUser!.email)
              .collection("items")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Something is wrong"),
              );
            }

            return ListView.builder(
                itemCount:
                    snapshot.data == null ? 0 : snapshot.data!.docs.length,
                itemBuilder: (_, index) {
                  DocumentSnapshot _documentSnapshot =
                      snapshot.data!.docs[index];
                  void deleteitem() {
                    FirebaseFirestore.instance
                        .collection(collectionName)
                        .doc(FirebaseAuth.instance.currentUser!.email)
                        .collection("items")
                        .doc(_documentSnapshot.id)
                        .delete();
                  }

                  return 
                  
                  InkWell(
    onTap: () {
     
    },
    child: Container(
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.grey,
         
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              //let's add the height

              image: DecorationImage(
                  // image: (_documentSnapshot['images'] == null)
                  //     ? AssetImage('images/1.jpg')
                      // : 
                      image: NetworkImage(_documentSnapshot['images']),
                  
                  fit: BoxFit.cover),
              
            ),
           
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            _documentSnapshot['name'] != null ? _documentSnapshot['name'] : 'New Product',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
       
          
          SizedBox(
            height: 5,
          ),
          Row(children: [
            Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                  
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      deleteitem();
                      Fluttertoast.showToast(msg: "Item Removed In favorite");
                    })),
            
          ])
        ],
      ),
    ),
  );
                });
          },
        ),
        
     
        );
  }
}

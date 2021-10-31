// ignore_for_file: avoid_print, file_names, prefer_const_constructors, unnecessary_new, avoid_unnecessary_containers
import 'package:shopping_app/modles/shop_categories_modle.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopping_app/bottombar.dart';
import 'package:shopping_app/modles/shop_categories_modle.dart';

class BottomContainer extends StatefulWidget {
  final String image;
  final String name;
  final int price;

  BottomContainer(
      {required this.image, required this.price, required this.name});

  @override
  _BottomContainerState createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  @override
  Widget build(BuildContext context) {
    Future addTofav() async {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        var currentUser = _auth.currentUser;
        CollectionReference _collectionRef =
            FirebaseFirestore.instance.collection("favorites");
        return _collectionRef
            .doc(currentUser!.email)
            .collection("items")
            .doc()
            .set({
          "name": widget.name,
          "images": widget.image,
          "price": widget.price,
        }).then((value) =>
                Fluttertoast.showToast(msg: "Item Added In favorite"));
      } else {
        Fluttertoast.showToast(msg: "please first login");
        print("object");
      }
    }

    Future addToCart() async {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      var currentUser = _auth.currentUser;
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        CollectionReference _collectionRef =
            FirebaseFirestore.instance.collection("users-cart-items");
        return _collectionRef
            .doc(currentUser!.email)
            .collection("items")
            .doc()
            .set({
          "name": widget.name,
          "price": widget.price,
          "images": widget.image,
        }).then((value) => Fluttertoast.showToast(msg: "item added"));
      }else{
                Fluttertoast.showToast(msg: "please first login ");
      }
    }

    return GestureDetector(
        child: Column(
      children: [
        Container(
          color: Colors.grey[100],
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                  height: 70,
                  width: 70,
                  child: Container(
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            widget.image,
                          )),
                    ),
                  )),
              SizedBox(
                width: 40,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      width: 140,
                      child: Text(
                        "${widget.name}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 140,
                      child: Text(
                        " PKR  ${widget.price}",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   width: 60,
              // ),
              Container(
                  child: IconButton(
                icon: Icon(
                  Icons.favorite_outline,
                  size: 30,
                ),
                onPressed: () {
                  addTofav();
                },
              )),
              Expanded(
                child: Align(
                    //  alignment: Alignment.topRight,
                    child: IconButton(
                  icon: Icon(
                    Icons.question_answer,
                    size: 30,
                  ),
                  alignment: Alignment(0, 0),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        enableDrag: true,
                        builder: (context) {
                          return Wrap(children: [
                            Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    topLeft: Radius.circular(
                                        30)), // if you need this
                                // side: BorderSide(
                                //   color: Colors.orange,
                                //   width: 2,
                                // ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                      height: 170,
                                      width: 400,
                                      child: Container(
                                        decoration: new BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(30),
                                              topLeft: Radius.circular(30)),
                                          image: new DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                widget.image,
                                              )),
                                        ),
                                      )),
                                  Container(
                                    child: Text(
                                      widget.name,
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "here is a description section if details is avaible",
                                      style: TextStyle(
                                          fontSize: 10,
                                          ),
                                    ),
                                  ),
                                
                                  Container(
                                      child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        50, 10, 10, 10),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.attach_money,
                                          
                                          color: Colors.amber,
                                        ),
                                        Text(
                                          "PKR  ${widget.price}",
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(
                                          Icons.delivery_dining,
                                          color: Colors.amber,
                                        ),
                                        Text(" pkr 150"),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(
                                          Icons.timer,
                                          color: Colors.amber,
                                        ),
                                        Text(" 24 hrs"),
                                      ],
                                    ),
                                  )),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(30.0),
                                          ),
                                          primary: Colors.amber,
                                          padding: EdgeInsets.fromLTRB(
                                              100, 10, 100, 10)),
                                      onPressed: () {
                                        addToCart();
                                        Navigator.pop(context);
                                      },
                                      child: Text("ADD TO BASKET")),
                                ],
                              ),
                            )
                          ]);
                        });

                    print("add to cart");
                  },
                )),
              ),
            ],
          ),
        ),
        Divider(
          height: 10,
          thickness: 2,
        ),
      ],
    ));
  }
}





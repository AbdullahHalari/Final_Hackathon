// ignore_for_file: prefer_const_constructors, unnecessary_new
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/categories/health.dart';
import 'package:shopping_app/drawer/about.dart';
import 'package:shopping_app/drawer/edit.dart';
import 'package:shopping_app/drawer/pre_order.dart';
import 'package:shopping_app/drawer/policies.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shopping_app/categories/electronic.dart';
import 'package:shopping_app/categories/cars.dart';
import 'package:shopping_app/categories/toys.dart';
import 'package:shopping_app/categories/mobile.dart';
import 'package:shopping_app/categories/clothes.dart';
import 'package:shopping_app/categories/furniture.dart';
import 'package:shopping_app/categories/grocery.dart';
import 'package:shopping_app/drawer/contact.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
   String firstname = " loading....";
  String email = "loading....";
  late String imagePath;
  late String downloadUrl;
  String imageurl = "wait";
   void getData() async {
    User? user = await FirebaseAuth.instance.currentUser;
    var data = await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get();
    setState(() {
      firstname = data.data()!['first_name'];
      email = data.data()!['email'];
      imageurl = data.data()!['url'];
    });
  }

  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
   
    // MyProvider provider = Provider.of<MyProvider>(context);
    return Scaffold(
        appBar: AppBar(
            title: Text("SHOPPING KARO  🛒",
                style: TextStyle(
                  color: Colors.black,
                )),
            backgroundColor: Colors.grey),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  // color: Color.fromRGBO(0, 136, 204, 100),
                ),
                accountName: Text(firstname),
                accountEmail: Text(email),
                currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        imageurl)),
                onDetailsPressed: () {},
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Pre_order()));
                  },
                  child: ListTile(
                    leading: Icon(Icons.inventory),
                    title: Text("Previous Order"),
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => About()));
                  },
                  child: ListTile(
                    leading: Icon(Icons.people),
                    title: Text("About"),
                  )),
                  GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Contact()));
                  },
                  child: ListTile(
                    leading: Icon(Icons.phone),
                    title: Text("Contact"),
                  )),
                  GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Edit()));
                  },
                  child: ListTile(
                    leading: Icon(Icons.edit),
                    title: Text("Edit Address"),
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Policies()));
                  },
                  child: ListTile(
                    leading: Icon(Icons.policy),
                    title: Text("Policies"),
                  )),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                  child: CarouselSlider(
                options: CarouselOptions(
                  height: 170.0,

                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  // initialPage: 0,
                  enableInfiniteScroll: true,
                  // reverse: false,
                  autoPlay: true,
                  // autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 1000),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  // onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                ),
                items: [
                  Container(
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage("images/b1.jpg"),
                              fit: BoxFit.fill))),
                  Container(
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage("images/b2.jpg"),
                              fit: BoxFit.fill))),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage("images/d1.jpg"),
                            fit: BoxFit.fill)),
                   
                  )
                ],
              )),
            ),
            Text(
              "Categories",
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              // margin: EdgeInsets.fromLTRB(10, 10, 20, 10),
              height: 100.0,
              child: Row(
                children: [
                  InkWell(
                    child: categories("Electronics",
                        "https://images.unsplash.com/photo-1570222094114-d054a817e56b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=905&q=80"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Electronicitems()));
                    },
                  ),
                  InkWell(
                    child: categories("Cars",
                        "https://images.unsplash.com/photo-1517524008697-84bbe3c3fd98?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNhcnN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Caritems()));
                    },
                  ),
                  InkWell(
                    child: categories("Mobile",
                        "https://images.unsplash.com/photo-1592899677977-9c10ca588bbd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=329&q=80"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Mobileitems()));
                    },
                  ),
                  InkWell(
                    child: categories("Clothes",
                        "https://images.unsplash.com/photo-1532453288672-3a27e9be9efd?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGNsb3RoZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Clothesitems()));
                    },
                  ),
                ],
              ),
            ),
            Container(
              // margin: EdgeInsets.fromLTRB(10, 10, 20, 10),
              height: 120.0,

              child: Row(
                children: [
                  InkWell(
                    child: categories("Grocery",
                        "https://images.unsplash.com/photo-1582401656474-b65e06392a03?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Z3JvY2VyeSUyMHN0b3JlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Groceryitems()));
                    },
                  ),
                  InkWell(
                    child: categories("Health & \nbeauty",
                        "https://images.unsplash.com/photo-1598440947619-2c35fc9aa908?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHNraW5jYXJlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Healthitems()));
                    },
                  ),
                  InkWell(
                    child: categories("Furniture",
                        "https://images.unsplash.com/photo-1599327286062-40b0a7f2b305?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fGZ1cm5pdHVyZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Furnitureitems()));
                    },
                  ),
                  InkWell(
                    child: categories("Toys",
                        "https://images.unsplash.com/photo-1500995617113-cf789362a3e1?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8dG95c3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Toysitems()));
                    },
                  ),
                ],
              ),
            ),
           Text(
              "Deals & Offers",
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              height: 200,
               margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage("images/d2.jpg"),
                              fit: BoxFit.fill),
              ),
              
            ),
            Container(
              height: 200,
               margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage("images/d3.jpg"),
                              fit: BoxFit.fill),
              ),
              
            )
          ],
        )));
  }
}

Widget categories(String name, String image) {
  // categories
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: Column(
      children: [
        Container(
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.fill, image: NetworkImage(image))),
          width: 68.0,
          height: 80.0,
        ),
        Title(color: Colors.amber, child: Text(name)),
      ],
    ),
  );
}

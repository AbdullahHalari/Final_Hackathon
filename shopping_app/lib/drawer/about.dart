import 'package:flutter/material.dart';


class About extends StatefulWidget {
  // const About({ Key? key }) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About us"),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(child: Text("\nGet To Know Shopping Karo \n\n Order anything you want and also grocery online with the HUNGRYMAN app \n Even when on the move, the free Shopping Karo mobile application for iOS, Android and Windows Phone, allows you to order food and groceries online anytime from anywhere. Whichever food you currently desire, we have the largest selection of shops for you to choose from, right here on Shopping KARO!\nIn three words, the process of ordering food & grocery online is simple, fast, and convenient.\nHow to Order\nTo order ITEM delivery in Pakistan, follow these simple steps:Find a ITEM. Enter your delivery address in the location form to see all the places that deliver to your location. It can be your home, office, a hotel or even parks! Choose your dishes. Browse the menu of the chosen restaurant, select your dishes and add them to your basket. When you are done, press the button.Checkout & Payment. Check your order, payment method selection and exact delivery address. Simply follow the checkout instructions from there.Delivery. We will send you an email and SMS confirming your order and delivery time. Sit back, relax and wait for piping hot food to be conveniently delivered to you!."),),
    ));
  }
}

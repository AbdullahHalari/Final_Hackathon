// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shopping_app/bottombar.dart';

class Pre_order extends StatefulWidget {
  const Pre_order({ Key? key }) : super(key: key);

  @override
  _Pre_orderState createState() => _Pre_orderState();
}

class _Pre_orderState extends State<Pre_order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        title: Text("Previous Orders"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
             child: Text(
                "No previous order found",
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
             ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amber,
                          padding: EdgeInsets.symmetric(horizontal: 90, vertical: 10),

                        ),
                        
                        child: Text("Place Your First Order"),
                        
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => Bottombar()));
                        },
                      )
          ],
        ),
      ),
      );
  }
}
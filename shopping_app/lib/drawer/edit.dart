import 'package:flutter/material.dart';
import 'package:shopping_app/bottombar.dart';
import 'package:shopping_app/screens/home.dart';

class Edit extends StatefulWidget {
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  final TextEditingController email = TextEditingController();
  final TextEditingController fullname = TextEditingController();
  final TextEditingController Address = TextEditingController();

  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();

  void vaildation() {
    if (email.text.isEmpty && fullname.text.isEmpty && Address.text.isEmpty) {
      // ignore: deprecated_member_use
      scaffold.currentState!.showSnackBar(
        SnackBar(
          content: Text("All Fleid Is Empty"),
        ),
      );
    } else if (fullname.text.isEmpty) {
      // ignore: deprecated_member_use
      scaffold.currentState!.showSnackBar(
        SnackBar(
          content: Text("FullName Is Empty"),
        ),
      );
    } else if (email.text.isEmpty) {
      // ignore: deprecated_member_use
      scaffold.currentState!.showSnackBar(
        SnackBar(
          content: Text("Email Is Empty"),
        ),
      );
    } else if (!Edit.regExp.hasMatch(email.text)) {
      // ignore: deprecated_member_use
      scaffold.currentState!.showSnackBar(
        SnackBar(
          content: Text("Email Is Not Vaild"),
        ),
      );
    } else if (Address.text.isEmpty) {
      // ignore: deprecated_member_use
      scaffold.currentState!.showSnackBar(
        SnackBar(
          content: Text("Address Is Empty"),
        ),
      );
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffold,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => Bottombar(),
              ),
            );
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Edit",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextField(
                      controller: fullname,
                      decoration: InputDecoration(
                        labelText: "Full name"
                      ),
                    
                    ),
                    TextField(
                      controller: fullname,
                      decoration: InputDecoration(
                        labelText: "Email"
                      ),
                    
                    ),
                    TextField(
                      controller: fullname,
                      decoration: InputDecoration(
                        labelText: "New Address"
                      ),
                    
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        padding: EdgeInsets.symmetric(horizontal: 90, vertical: 10),

                      ),
                      
                      child: Text("Confirm"),
                      
                      onPressed: () {
                        vaildation();
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
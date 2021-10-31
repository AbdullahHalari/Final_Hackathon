import 'package:flutter/material.dart';
import 'package:shopping_app/screens/home.dart';
import 'package:shopping_app/modles/shop_categories_modle.dart';
import 'package:shopping_app/provider/my_provider.dart';
import 'package:shopping_app/screen/categories.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/bottombar.dart';

class Healthitems extends StatefulWidget {
  // const healthitems({ Key? key }) : super(key: key);

  @override
  _HealthitemsState createState() => _HealthitemsState();
}

class _HealthitemsState extends State<Healthitems> {
  List<ShopCategoriesModle> healthCategoriesList = [];

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getHealthCategoriesList();
    healthCategoriesList = provider.throwHealthCategoriesList;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
            title: Text("Health"),
            backgroundColor: Colors.black,
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (contet) => Bottombar()));
              },
            ),
          ),
        ),
        body: Categories(list: healthCategoriesList));
  }
}

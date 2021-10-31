import 'package:flutter/material.dart';
import 'package:shopping_app/screens/home.dart';
import 'package:shopping_app/modles/shop_categories_modle.dart';
import 'package:shopping_app/provider/my_provider.dart';
import 'package:shopping_app/screen/categories.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/bottombar.dart';

class Mobileitems extends StatefulWidget {
  // const mobileitems({ Key? key }) : super(key: key);

  @override
  _MobileitemsState createState() => _MobileitemsState();
}

class _MobileitemsState extends State<Mobileitems> {
  List<ShopCategoriesModle> mobileCategoriesList = [];

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getMobileCategoriesList();
    mobileCategoriesList = provider.throwMobileCategoriesList;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
            title: Text("Mobile"),
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
        body: Categories(list: mobileCategoriesList));
  }
}

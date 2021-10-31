import 'package:flutter/material.dart';
import 'package:shopping_app/screens/home.dart';
import 'package:shopping_app/modles/shop_categories_modle.dart';
import 'package:shopping_app/provider/my_provider.dart';
import 'package:shopping_app/screen/categories.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/bottombar.dart';

class Toysitems extends StatefulWidget {
  // const toysitems({ Key? key }) : super(key: key);

  @override
  _ToysitemsState createState() => _ToysitemsState();
}

class _ToysitemsState extends State<Toysitems> {
  List<ShopCategoriesModle> toysCategoriesList = [];

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getToysCategoriesList();
    toysCategoriesList = provider.throwToysCategoriesList;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
            title: Text("Toys"),
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
        body: Categories(list: toysCategoriesList));
  }
}

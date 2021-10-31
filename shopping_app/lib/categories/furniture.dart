import 'package:flutter/material.dart';
import 'package:shopping_app/screens/home.dart';
import 'package:shopping_app/modles/shop_categories_modle.dart';
import 'package:shopping_app/provider/my_provider.dart';
import 'package:shopping_app/screen/categories.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/bottombar.dart';

class Furnitureitems extends StatefulWidget {
  // const furnitureitems({ Key? key }) : super(key: key);

  @override
  _FurnitureitemsState createState() => _FurnitureitemsState();
}

class _FurnitureitemsState extends State<Furnitureitems> {
  List<ShopCategoriesModle> furnitureCategoriesList = [];

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getFurnitureCategoriesList();
    furnitureCategoriesList = provider.throwFurnitureCategoriesList;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
            title: Text("Furniture"),
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
        body: Categories(list: furnitureCategoriesList));
  }
}

import 'package:flutter/cupertino.dart';

class ShopCategoriesModle {
  final String image;
  final String name;
  final int price;
  ShopCategoriesModle(
      {required this.image, required this.name, required this.price});
}

class ItemModle {
  final String image;
  final String name;
  final int price;
  final String des;
  ItemModle(
      {required this.image,
      required this.name,
      required this.price,
      required this.des});
}

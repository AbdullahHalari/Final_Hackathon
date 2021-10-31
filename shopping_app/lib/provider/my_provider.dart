// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_app/modles/shop_categories_modle.dart';
import 'package:flutter/cupertino.dart';

class MyProvider extends ChangeNotifier {
  //electronic
  List<ShopCategoriesModle> electronicCategoriesList = [];
  late ShopCategoriesModle electronicCategoriesModle;

  Future<void> getElectronicCategoriesList() async {
    List<ShopCategoriesModle> newElectronicCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('iFq6xkKffPZAVkCHYKf9')
        .collection('electronics')
        .get();
    querySnapshot.docs.forEach((element) {
      electronicCategoriesModle = ShopCategoriesModle(
        image: (element.data() as dynamic)['image'],
        name: (element.data() as dynamic)['name'],
        price: (element.data() as dynamic)['price'],
      );
      newElectronicCategoriesList.add(electronicCategoriesModle);
      electronicCategoriesList = newElectronicCategoriesList;
    });
  }

  get throwElectronicCategoriesList {
    return electronicCategoriesList;
  }
// //car

  List<ShopCategoriesModle> carCategoriesList = [];
  late ShopCategoriesModle carCategoriesModle;
  Future<void> getCarCategoriesList() async {
    List<ShopCategoriesModle> newCarCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('iFq6xkKffPZAVkCHYKf9')
        .collection('cars')
        .get();
    querySnapshot.docs.forEach((element) {
      carCategoriesModle = ShopCategoriesModle(
        image: (element.data() as dynamic)['image'],
        name: (element.data() as dynamic)['name'],
        price: (element.data() as dynamic)['price'],
      );
      newCarCategoriesList.add(carCategoriesModle);
      carCategoriesList = newCarCategoriesList;
    });
  }

  get throwCarCategoriesList {
    return carCategoriesList;
  }

// furniture

  List<ShopCategoriesModle> furnitureCategoriesList = [];
  late ShopCategoriesModle furnitureCategoriesModle;
  Future<void> getFurnitureCategoriesList() async {
    List<ShopCategoriesModle> newFurnitureCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('iFq6xkKffPZAVkCHYKf9')
        .collection('furniture')
        .get();
    querySnapshot.docs.forEach((element) {
      furnitureCategoriesModle = ShopCategoriesModle(
        image: (element.data() as dynamic)['image'],
        name: (element.data() as dynamic)['name'],
        price: (element.data() as dynamic)['price'],
      );
      newFurnitureCategoriesList.add(furnitureCategoriesModle);
      furnitureCategoriesList = newFurnitureCategoriesList;
    });
  }

  get throwFurnitureCategoriesList {
    return furnitureCategoriesList;
  }
//clothes

  List<ShopCategoriesModle> clothesCategoriesList = [];
  late ShopCategoriesModle clothesCategoriesModle;
  Future<void> getClothesCategoriesList() async {
    List<ShopCategoriesModle> newClothesCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('iFq6xkKffPZAVkCHYKf9')
        .collection('clothes')
        .get();
    querySnapshot.docs.forEach((element) {
      clothesCategoriesModle = ShopCategoriesModle(
        image: (element.data() as dynamic)['image'],
        name: (element.data() as dynamic)['name'],
        price: (element.data() as dynamic)['price'],
      );
      newClothesCategoriesList.add(clothesCategoriesModle);
      clothesCategoriesList = newClothesCategoriesList;
    });
  }

  get throwClothesCategoriesList {
    return clothesCategoriesList;
  }
//mobile

  List<ShopCategoriesModle> mobileCategoriesList = [];
  late ShopCategoriesModle mobileCategoriesModle;
  Future<void> getMobileCategoriesList() async {
    List<ShopCategoriesModle> newMobileCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('iFq6xkKffPZAVkCHYKf9')
        .collection('mobile')
        .get();
    querySnapshot.docs.forEach((element) {
      mobileCategoriesModle = ShopCategoriesModle(
        image: (element.data() as dynamic)['image'],
        name: (element.data() as dynamic)['name'],
        price: (element.data() as dynamic)['price'],
      );
      newMobileCategoriesList.add(mobileCategoriesModle);
      mobileCategoriesList = newMobileCategoriesList;
    });
  }

  get throwMobileCategoriesList {
    return mobileCategoriesList;
  }
// health

  List<ShopCategoriesModle> healthCategoriesList = [];
  late ShopCategoriesModle healthCategoriesModle;
  Future<void> getHealthCategoriesList() async {
    List<ShopCategoriesModle> newHealthCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('iFq6xkKffPZAVkCHYKf9')
        .collection('health')
        .get();
    querySnapshot.docs.forEach((element) {
      healthCategoriesModle = ShopCategoriesModle(
        image: (element.data() as dynamic)['image'],
        name: (element.data() as dynamic)['name'],
        price: (element.data() as dynamic)['price'],
      );
      newHealthCategoriesList.add(healthCategoriesModle);
      healthCategoriesList = newHealthCategoriesList;
    });
  }

  get throwHealthCategoriesList {
    return healthCategoriesList;
  }
//grocery

  List<ShopCategoriesModle> groceryCategoriesList = [];
  late ShopCategoriesModle groceryCategoriesModle;
  Future<void> getGroceryCategoriesList() async {
    List<ShopCategoriesModle> newGroceryCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('iFq6xkKffPZAVkCHYKf9')
        .collection('grocery')
        .get();
    querySnapshot.docs.forEach((element) {
      groceryCategoriesModle = ShopCategoriesModle(
        image: (element.data() as dynamic)['image'],
        name: (element.data() as dynamic)['name'],
        price: (element.data() as dynamic)['price'],
      );
      newGroceryCategoriesList.add(groceryCategoriesModle);
      groceryCategoriesList = newGroceryCategoriesList;
    });
  }

  get throwGroceryCategoriesList {
    return groceryCategoriesList;
  }
  //toys

  List<ShopCategoriesModle> toysCategoriesList = [];
  late ShopCategoriesModle toysCategoriesModle;
  Future<void> getToysCategoriesList() async {
    List<ShopCategoriesModle> newToysCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('iFq6xkKffPZAVkCHYKf9')
        .collection('toys')
        .get();
    querySnapshot.docs.forEach((element) {
      toysCategoriesModle = ShopCategoriesModle(
        image: (element.data() as dynamic)['image'],
        name: (element.data() as dynamic)['name'],
        price: (element.data() as dynamic)['price'],
      );
      newToysCategoriesList.add(toysCategoriesModle);
      toysCategoriesList = newToysCategoriesList;
    });
  }

  get throwToysCategoriesList {
    return toysCategoriesList;
  }
}

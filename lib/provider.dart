import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_order/categories.dart';
import 'package:food_order/foodModle.dart';

class Myprovider extends ChangeNotifier {
  List<CategoriesM> burgerList = [];
  late CategoriesM burgerM;

  Future<void> getBurgerCategory() async {
    List<CategoriesM> newBurgerList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('vhpKAKRmnneOCvhKP7d1')
        .collection('Burger')
        .get();
    querySnapshot.docs.forEach((element) {
      burgerM = CategoriesM(
        image: element.get('image') ?? '',
        name: element.get('name') ?? '',
      );
      print(burgerM.name);
      newBurgerList.add(burgerM);
      burgerList = newBurgerList;
    });
  }

  get throwBurgerList {
    return burgerList;
  }

  //2//////////
  List<CategoriesM> drinksList = [];
  late CategoriesM drinksM;

  Future<void> getDrinksCategory() async {
    List<CategoriesM> newDrinksList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('vhpKAKRmnneOCvhKP7d1')
        .collection('Drinks')
        .get();
    querySnapshot.docs.forEach((element) {
      drinksM = CategoriesM(
        image: element.get('image') ?? '',
        name: element.get('name') ?? '',
      );
      print(drinksM.name);
      newDrinksList.add(drinksM);
      drinksList = newDrinksList;
    });
  }

  get throwDrinksList {
    return drinksList;
  }

  //////////3//////////
  List<CategoriesM> grillList = [];
  late CategoriesM grillM;

  Future<void> getGrillCategory() async {
    List<CategoriesM> newGrillList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('vhpKAKRmnneOCvhKP7d1')
        .collection('Grill')
        .get();
    querySnapshot.docs.forEach((element) {
      grillM = CategoriesM(
        image: element.get('image') ?? '',
        name: element.get('name') ?? '',
      );
      print(grillM.name);
      newGrillList.add(grillM);
      grillList = newGrillList;
    });
  }

  get throwGrillList {
    return grillList;
  }

  //////////4///////////

  List<CategoriesM> momoList = [];
  late CategoriesM momoM;

  Future<void> getMomoCategory() async {
    List<CategoriesM> newMomoList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('vhpKAKRmnneOCvhKP7d1')
        .collection('Momos')
        .get();
    querySnapshot.docs.forEach((element) {
      momoM = CategoriesM(
        image: element.get('image') ?? '',
        name: element.get('name') ?? '',
      );
      print(momoM.name);
      newMomoList.add(momoM);
      momoList = newMomoList;
    });
  }

  get throwMomoList {
    return momoList;
  }

  List<CategoriesM> biriyaniList = [];
  late CategoriesM biriyaniM;

  Future<void> getBiriyaniCategory() async {
    List<CategoriesM> newBiriyaniList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('vhpKAKRmnneOCvhKP7d1')
        .collection('Biriyani')
        .get();
    querySnapshot.docs.forEach((element) {
      biriyaniM = CategoriesM(
        image: element.get('image') ?? '',
        name: element.get('name') ?? '',
      );
      print(biriyaniM.name);
      newBiriyaniList.add(biriyaniM);
      biriyaniList = newBiriyaniList;
    });
  }

  get throwBiriyaniList {
    return biriyaniList;
  }

  ////////////// Single Food Item //////
  List<FoodModle> foodModleList = [];
  late FoodModle foodModle;
  Future<void> getFoodList() async {
    List<FoodModle> newfoodModleList=[];
    QuerySnapshot querySnapshot  = await FirebaseFirestore.instance.collection('Foods').get();
    querySnapshot.docs.forEach((element) {
      foodModle = FoodModle(
          image: (element.data() as dynamic)['image'] ?? '',
          name: (element.data() as dynamic)['name'],
          price: (element.data() as dynamic)['price']
      );
    });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_order/categories.dart';
import 'package:food_order/main.dart';
import 'package:food_order/provider.dart';
import 'package:provider/provider.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  Widget categoriesContainer({required String image, required String name}) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: 20.0),
          height: 70.0,
          width: 70.0,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(image)),
              color: Color(getColorHexFromStr("#fde696")),
              borderRadius: BorderRadius.circular(10)),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 15, color: Colors.black87),
        )
      ],
    );
  }

  Widget bottomContainer(
      {required String image, required String name, required int price}) {
    return Container(
      height: 250,
      width: 200,
      decoration: BoxDecoration(
        color: Color(getColorHexFromStr('#fdebba')),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(image),
          ),
          ListTile(
            leading: Text(
              name,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
              ),
            ),
            trailing: Text(
              "\₹ $price",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  size: 20.0,
                  color: Colors.deepOrange,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget drawerItem({required String name, @required IconData}) {
    return ListTile(
      leading: Icon(
        IconData,
        color: Colors.black,
      ),
      title: Text(name, style: TextStyle(color: Colors.black)),
    );
  }

  List<CategoriesM> burgerList = [];
  List<CategoriesM> drinksList = [];
  List<CategoriesM> grillList = [];
  List<CategoriesM> momoList = [];
  List<CategoriesM> biriyaniList = [];

  Widget burger() {
    return Row(
        children: burgerList
            .map((e) => categoriesContainer(image: e.image, name: e.name))
            .toList()
    );
  }
  Widget drinks() {
    return Row(
        children: drinksList
            .map((e) => categoriesContainer(image: e.image, name: e.name))
            .toList()
    );
  }
  Widget grill() {
    return Row(
        children: grillList
            .map((e) => categoriesContainer(image: e.image, name: e.name))
            .toList()
    );
  }
  Widget momo() {
    return Row(
        children: momoList
            .map((e) => categoriesContainer(image: e.image, name: e.name))
            .toList()
    );
  }
  Widget biriyani() {
    return Row(
        children: biriyaniList
            .map((e) => categoriesContainer(image: e.image, name: e.name))
            .toList()
    );
  }

  @override
  Widget build(BuildContext context) {
    Myprovider provider = Provider.of<Myprovider>(context);
    provider.getBurgerCategory();
    provider.getDrinksCategory();
    provider.getGrillCategory();
    provider.getMomoCategory();
    provider.getBiriyaniCategory();
    burgerList = provider.throwBurgerList;
    drinksList = provider.throwDrinksList;
    grillList = provider.throwGrillList;
    momoList = provider.throwMomoList;
    biriyaniList = provider.throwBiriyaniList;

    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color(getColorHexFromStr('#fbcd7a')),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/image.png'),
                    )),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage('assets/profile.png'),
                    ),
                    accountName: Text(
                      "Anushika Bala",
                      style: TextStyle(color: Colors.black),
                    ),
                    accountEmail: Text(
                      "Anushikabala@gmail.com",
                      style: TextStyle(color: Colors.black),
                    )),
                drawerItem(name: "Profile", IconData: Icons.person),
                drawerItem(name: "Cart", IconData: Icons.add_shopping_cart),
                drawerItem(name: "Order", IconData: Icons.shop),
                drawerItem(name: "About", IconData: Icons.announcement_rounded),
                drawerItem(name: "About", IconData: Icons.person),
                Divider(
                  thickness: 2,
                  color: Colors.black,
                ),
                ListTile(
                  leading: Text("Communicate",
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                ),
                drawerItem(name: "Change", IconData: Icons.lock),
                drawerItem(name: "Logout", IconData: Icons.exit_to_app),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child:
                CircleAvatar(backgroundImage: AssetImage('assets/profile.png')),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 10.0,
              ),
              TextField(
                  decoration: InputDecoration(
                hintText: "Search Food",
                hintStyle: TextStyle(color: Colors.black54),
                prefixIcon: Icon(Icons.search, color: Colors.black54),
                filled: true,
                fillColor: Colors.white70,
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.orangeAccent, width: 3.0),
                    borderRadius: BorderRadius.circular(10)),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.orangeAccent, width: 3.0),
                    borderRadius: BorderRadius.circular(10)),
              )),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    burger(),
                    drinks(),
                    grill(),
                    momo(),
                    biriyani()
                    // categoriesContainer(
                    //     image: 'assets/burger.png', name: 'All'),
                    // categoriesContainer(
                    //     image: 'assets/burger.png', name: 'Burger'),
                    // categoriesContainer(
                    //     image: 'assets/momo.png', name: 'Momos'),
                    // categoriesContainer(
                    //     image: 'assets/grill.png', name: 'Grill'),
                    // categoriesContainer(
                    //     image: 'assets/juice.png', name: 'Drink'),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 510,
                child: GridView.count(
                  shrinkWrap: false,
                  primary: false,
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    bottomContainer(
                        image: 'assets/burger.png', name: 'All', price: 199),
                    bottomContainer(
                        image: 'assets/burger.png', name: 'Burger', price: 199),
                    bottomContainer(
                        image: 'assets/momo.png', name: 'Momos', price: 199),
                    bottomContainer(
                        image: 'assets/grill.png', name: 'Grill', price: 199),
                    bottomContainer(
                        image: 'assets/juice.png', name: 'Drink', price: 199),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

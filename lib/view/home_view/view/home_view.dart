import 'package:flutter/material.dart';
import 'package:learning/view/product/view/productDetails_view.dart';
import '../../../model/product_model'
    '.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Products> details = [
    Products('americano.png', 'Americano'),
    Products('cappuccino.png', 'Cappuccino'),
    Products('latte.png', 'Latte'),
    Products('flatWhite.png', 'Flat White'),
    Products('hot_chocolate.png', 'Hot Chocolate'),
    Products('espresso.png', 'Espresso'),
  ];

  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width;
    double phoneHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          welcomeText(phoneHeight, phoneWidth),
          userInfo(phoneHeight, phoneWidth),
          coffeeList(phoneWidth, phoneHeight),
        ]));
  }

  Padding welcomeText(double phoneHeight, double phoneWidth) {
    return Padding(
      padding:
          EdgeInsets.only(top: phoneHeight * 0.05, left: phoneWidth * 0.05),
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Welcome!',
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Padding userInfo(double phoneHeight, double phoneWidth) {
    return Padding(
      padding:
          EdgeInsets.only(top: phoneHeight * 0.01, left: phoneWidth * 0.05,bottom: phoneHeight * 0.02),
      child: const Align(
          alignment: Alignment.centerLeft,
          child: Text('Alex', style: TextStyle(fontSize: 28))),
    );
  }

  Expanded coffeeList(double phoneWidth, double phoneHeight) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Color(0xff324b59)),
        child: Column(children: [
          Padding(
              padding: EdgeInsets.only(
                  left: phoneWidth * 0.07,
                  top: phoneHeight * 0.02,
                  bottom: phoneHeight * 0.02),
              child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Select your coffee',
                      style:
                          TextStyle(color: Color(0xffd6d6d6), fontSize: 20)))),
          GridView.builder(
              padding: EdgeInsets.only(
                  left: phoneWidth * 0.05, right: phoneWidth * 0.05),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: details.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Products instance = details[index];
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductDetails(
                          instance.name,
                          instance.photo,
                      ),
                    ),
                    );
                   },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                        phoneWidth * 0.01,
                        phoneHeight * 0.01,
                        phoneWidth * 0.01,
                        phoneHeight * 0.01),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35.0)),
                        color: Colors.white,
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                              Expanded(
                                flex: 8,
                                child: Image.asset(
                                'assets/images/coffees/${details[index].photo}',
                                height: 150,
                                width: 150,
                              )),
                              Expanded(
                                flex: 2,
                                child: Text(
                                details[index].name,
                                style: const TextStyle(fontSize: 20),
                              )),
                        ])),
                  ),
                );
              }),
        ]),
      ),
    );
  }
}

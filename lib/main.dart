import 'package:flutter/material.dart';
import 'package:learning/view/home_view/view/home_view.dart';
import 'package:learning/view/product/view/productDetails_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/' : (context) => const Home(),
          '/productView' : (context) =>  ProductDetails('',''),
      }
    );
  }
}

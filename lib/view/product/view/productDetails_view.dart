import 'package:flutter/material.dart';


class ProductDetails extends StatefulWidget {
   String name;
   String photo;

   ProductDetails(this.name, this.photo);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery
        .of(context)
        .size
        .width;
    double phoneHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Order', style: TextStyle(fontSize: 25, color: Colors.black),),
          centerTitle: true,
        ),
        body: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                    width: phoneWidth * 0.85,
                    height: phoneHeight * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xfff7f8fb),
                    ),
                    child: Image.asset('assets/images/coffees/${widget.photo}',)
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: phoneHeight * 0.02, left: phoneWidth * 0.07),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(widget.name,style: const TextStyle(fontSize: 25,color: Colors.black),),
                  ),
                ),
                 Divider(
                  height: phoneHeight*0.05,
                  indent: phoneWidth*0.07,
                  endIndent: phoneWidth*0.07,
                  thickness: phoneWidth*0.005,
                  color: Color(0xfff7f8fb),
                )
              ],)
        )
    );
  }
}
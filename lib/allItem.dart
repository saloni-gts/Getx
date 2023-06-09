import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AllItems extends StatefulWidget {
  const AllItems({Key? key}) : super(key: key);

  @override
  State<AllItems> createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {
  final List<String> imgList = [
    "assets/images/dog_image2.png",
    "assets/images/dog_image3.png",
    "assets/images/dog_image5.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFF035AA6),

body: Center(
  child: Container(
    height: 400,
    width: 400,
    child: CarouselSlider(
      options:CarouselOptions(
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
        enableInfiniteScroll: true,
        enlargeCenterPage: true

      ) ,
      items: imgList.map((e) => Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.0,
                  spreadRadius: 5.0,
                  offset: Offset(
                    5.0,
                    5.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Colors.greenAccent),
 child: Image.asset(e),
      )).toList(),

    ),
  )

),

    );
  }
}

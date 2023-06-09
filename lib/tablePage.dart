import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/preview.dart';
import 'package:getx/product.dart';

import 'getController.dart';

class TablePage extends StatefulWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  List<Product> products = [
    Product(
      id: 11,
      price: 56,
      title: "Classic Leather Arm Chair",
      image: "assets/images/dog_image2.png",
      description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
    ),
    Product(
      id: 12,
      price: 68,
      title: "Poppy Plastic Tub Chair",
      image: "assets/images/dog_image3.png",
      description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
    ),
    Product(
      id: 13,
      price: 39,
      title: "Bar Stool Chair",
      image: "assets/images/dog_image5.png",
      description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
    ),
  ];
  @override
  void initState() {
    super.initState();
  }
  MyHomePageController controller = Get.put(MyHomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 28.0),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * .90,
                  decoration: BoxDecoration(
                    // color: Colors.white,
                      color: Color(0xFF035AA6),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0),
                      )),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Container(
                        height: MediaQuery.of(context).size.height * .70,
                        child: ListView.builder(
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              return
                                InkWell(
                                  onTap: () {
                                    controller.setSelectedProd(products[index]);

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PreviewScreen()));
                                    // prodDetailDialog(context:context,prod: products[index]);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Stack(
                                      children: [
                                        // Container(
                                        //   height: 100,
                                        //   width:MediaQuery.of(context).size.width*.90,
                                        //   decoration: BoxDecoration(
                                        //       color: Colors.lightBlueAccent,
                                        //       borderRadius: BorderRadius.all(Radius.circular(8))
                                        //   ),
                                        // ),
                                        Stack(
                                          children: [
                                            Container(
                                              height: 120,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  .88,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey,

                                                      blurRadius:
                                                      10.0, // soften the shadow
                                                      spreadRadius:
                                                      5.0, //extend the shadow
                                                      offset: Offset(
                                                        5.0, // Move to right 5  horizontally
                                                        5.0, // Move to bottom 5 Vertically
                                                      ),
                                                    )
                                                  ],
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 2,
                                                  ),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(8))),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(
                                                        13.0),
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .lightBlueAccent,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .all(Radius
                                                                  .circular(
                                                                  25))),
                                                          height: 70,
                                                          child: Image.asset(
                                                              products[index]
                                                                  .image),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        products[index].title,
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontFamily:
                                                          "assets/fonts/Poppins-Bold.ttf",
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: Container(
                                                height: 35,
                                                width: 65,
                                                decoration: BoxDecoration(
                                                    color: Colors.orange,
                                                    border: Border.all(
                                                      color: Colors.black,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(8))),
                                                child: Center(
                                                  child: Text(

                                                    products[index].price.toString(),
                                                    style:
                                                    TextStyle(fontSize: 20),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )

    );
  }
}

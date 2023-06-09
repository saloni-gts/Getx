import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx/preview.dart';

import 'addresspage.dart';
import 'appFont.dart';
import 'cartButton.dart';
import 'getController.dart';
import 'longbutton.dart';
import 'product.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // List<Product> cartProducts = [
  //   Product(
  //     id: 1,
  //     price: 56,
  //     title: "Classic Leather Arm Chair",
  //     image: "assets/images/dog_image2.png",
  //     description:
  //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  //   ),
  //   Product(
  //     id: 4,
  //     price: 68,
  //     title: "Poppy Plastic Tub Chair",
  //     image: "assets/images/dog_image3.png",
  //     description:
  //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  //   ),
  //   Product(
  //     id: 9,
  //     price: 39,
  //     title: "Bar Stool Chair",
  //     image: "assets/images/dog_image5.png",
  //     description:
  //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  //   ),
  // ];
  var TotalAmt=0;
  var TotalAmtShip=0;
  List<Product> cartProducts=[];
@override
  void initState() {
  cartProducts=controller.cartList;
  for(int i=0;i<cartProducts.length;i++){
    TotalAmt=TotalAmt+cartProducts[i].price;
  }
  print("=====${TotalAmt}");
  TotalAmtShip=100+TotalAmt;
controller.calAmt();
  controller.setFinAmt(TotalAmtShip);
  print("TotalAmtShip===${TotalAmtShip}");

    super.initState();
  }

  @override
  MyHomePageController controller = Get.put(MyHomePageController());
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text('Shopping Cart'),
          elevation: 0,
          backgroundColor: Color(0xFF035AA6),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        backgroundColor: Color(0xFF035AA6),
        body:

        GetBuilder<MyHomePageController>(
          builder: (controller) {
            return SingleChildScrollView(
               child:

               cartProducts.isEmpty?Container(
                 height:MediaQuery.of(context).size.height*.85,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,

                   children: [
                     Center(
                       child: Text("Cart is empty..",style: TextStyle(
                         fontFamily: AppFont.poppinsMedium,
                         fontSize: 18,
                         color: Colors.white,
                       ),),
                     ),
                   ],
                 ),
               ):

               Column(
                children: [
                  SizedBox(
                    height: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Container(
                      // color: Colors.grey,
                      height: MediaQuery.of(context).size.height * .95,
                      child: ListView.builder(

                          itemCount: cartProducts.length+1,
                          itemBuilder: (context, index) {
                            return index == cartProducts.length ?

                            Padding(
                              padding: const EdgeInsets.only(top: 45.0),
                              child: Column(
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                    child: Container(
                                      // height: 50,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,

                                              blurRadius: 10.0, // soften the shadow
                                              spreadRadius: 5.0, //extend the shadow
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
                                          borderRadius: BorderRadius.all(Radius.circular(8))),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Total Items",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                new Spacer(),
                                                Text(
                                                  cartProducts.length.toString(),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ) ,

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Total Price",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                new Spacer(),
                                                Text(
                                                  "Rs "+controller.crtAmt.toString(),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Shipping Charges",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                new Spacer(),
                                                Text(
                                                  "Rs 100",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10,),

                                          Divider(
                                            height: 5,
                                            color: Colors.grey,
                                            thickness: 1,
                                            indent : 10,
                                            endIndent : 10,
                                          ),
                                          SizedBox(height: 8,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Total Amount",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                new Spacer(),
                                                Text(
                                                  "Rs "+controller.finAmt.toString(),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          SizedBox(height: 8,),



                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15,),
                                  LongButton(
                                      context: context,
                                      onTap1: (){
                                        Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));
                                      },

                                      text: "Place Order"),

                                  SizedBox(height: 150,)
                                ],
                              ),
                            ):

                            Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.setSelectedProd(cartProducts[index]);

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PreviewScreen(frmCart: true,)));
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
                                              width: MediaQuery.of(context).size.width *
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
                                                    padding: const EdgeInsets.all(13.0),
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .lightBlueAccent,
                                                              borderRadius:
                                                                  BorderRadius.all(
                                                                      Radius.circular(
                                                                          25))),
                                                          height: 70,
                                                          child: Image.asset(
                                                              cartProducts[index]
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
                                                        cartProducts[index].title,
                                                        style: TextStyle(
                                                          fontSize: 15,

                                                          fontFamily: AppFont.poppinsMedium
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
                                                    borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(20.0),
                                                      bottomRight:
                                                          Radius.circular(10.0),
                                                      topRight: Radius.circular(5.0),
                                                    )),
                                                child: Center(
                                                  child: Text(
                                                    cartProducts[index]
                                                        .price
                                                        .toString(),
                                                    style: TextStyle(fontSize: 20),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  child: InkWell(
                                    child: Icon(
                                      Icons.cancel_rounded,
                                      color: Color(0xFF035AA6),
                                    ),
                                    onTap: () {
                                      controller.removeFromCart(cartProducts[index]);
                                      controller.calAmt();
                                      },
                                  ),
                                  right: 32,
                                  top: 20,
                                )
                              ],
                            );
                          }),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  //   child: Container(
                  //     // height: 50,
                  //     decoration: BoxDecoration(
                  //         boxShadow: [
                  //           BoxShadow(
                  //             color: Colors.grey,
                  //
                  //             blurRadius: 10.0, // soften the shadow
                  //             spreadRadius: 5.0, //extend the shadow
                  //             offset: Offset(
                  //               5.0, // Move to right 5  horizontally
                  //               5.0, // Move to bottom 5 Vertically
                  //             ),
                  //           )
                  //         ],
                  //         color: Colors.white,
                  //         border: Border.all(
                  //           color: Colors.black,
                  //           width: 2,
                  //         ),
                  //         borderRadius: BorderRadius.all(Radius.circular(8))),
                  //     child: Column(
                  //       children: [
                  //         SizedBox(
                  //           height: 10,
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  //           child: Row(
                  //             children: [
                  //               Text(
                  //                 "Total Items",
                  //                 style: TextStyle(
                  //                   color: Colors.black,
                  //                   fontSize: 18,
                  //                 ),
                  //               ),
                  //               new Spacer(),
                  //               Text(
                  //                 cartProducts.length.toString(),
                  //                 style: TextStyle(
                  //                   color: Colors.black,
                  //                   fontSize: 18,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ) ,
                  //
                  //         Padding(
                  //           padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  //           child: Row(
                  //             children: [
                  //               Text(
                  //                 "Total Price",
                  //                 style: TextStyle(
                  //                   color: Colors.black,
                  //                   fontSize: 18,
                  //                 ),
                  //               ),
                  //               new Spacer(),
                  //               Text(
                  //                 "Rs "+TotalAmt.toString(),
                  //                 style: TextStyle(
                  //                   color: Colors.black,
                  //                   fontSize: 18,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //
                  //         Padding(
                  //           padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  //           child: Row(
                  //             children: [
                  //               Text(
                  //                 "Shipping Charges",
                  //                 style: TextStyle(
                  //                   color: Colors.black,
                  //                   fontSize: 18,
                  //                 ),
                  //               ),
                  //               new Spacer(),
                  //               Text(
                  //                 "Rs 100",
                  //                 style: TextStyle(
                  //                   color: Colors.black,
                  //                   fontSize: 18,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         SizedBox(height: 10,),
                  //
                  //         Divider(
                  //           height: 5,
                  //           color: Colors.grey,
                  //           thickness: 1,
                  //           indent : 10,
                  //           endIndent : 10,
                  //         ),
                  //         SizedBox(height: 8,),
                  //
                  //         Padding(
                  //           padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  //           child: Row(
                  //             children: [
                  //               Text(
                  //                 "Total Amount",
                  //                 style: TextStyle(
                  //                   color: Colors.black,
                  //                   fontSize: 18,
                  //                 ),
                  //               ),
                  //               new Spacer(),
                  //               Text(
                  //                 "Rs "+TotalAmtShip.toString(),
                  //                 style: TextStyle(
                  //                   color: Colors.black,
                  //                   fontSize: 18,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //
                  //        SizedBox(height: 8,),
                  //
                  //
                  //
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 15,),
                  // LongButton(
                  //     context: context,
                  //     onTap1: (){
                  //       Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));
                  //     },
                  //
                  //     text: "Place Order"),
                  //
                  // SizedBox(height: 15,)


                ],
              ),
            );
          }
        ));
  }
}

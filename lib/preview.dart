import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/product.dart';

import 'cartButton.dart';
import 'cartPage.dart';
import 'getController.dart';

class PreviewScreen extends StatefulWidget {
  PreviewScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  @override
  void initState() {
    super.initState();
  }
  MyHomePageController controller = Get.put(MyHomePageController());
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFF035AA6),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child:InkWell(
          onTap: (){

            // Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
       controller.setCart();
            print("tap tap");
          },
          child: CartButton(
            context: context,
            text: "Added To Cart",
            width: 128
          ),
        )
        // FloatingActionButton(
        //   onPressed: (){},
        //   backgroundColor:  Color(0xFFFFA41B),
        //   tooltip: 'Increment',
        //   child:  Icon(Icons.shopping_cart,color: Color(0xff282747),),
        //
        // ),
      ),
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(
            color: Colors.black,
          onPressed: (){
              Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height*.65,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
            )),


        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 20),

                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 40.0),
                         child: Container(
                          // height: MediaQuery.of(context).size.height * .40,
                          // width: MediaQuery.of(context).size.width * .70,
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
                          child:
                              Image.asset(controller.selectedProd?.image??"", fit: BoxFit.fill,),
                      ),
                       ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      controller.selectedProd?.title??"",
                      style: TextStyle(
                          fontSize: 25, fontFamily: "assets/fonts/Poppins-Bold.ttf",
                      ),
                    ),

                        SizedBox(
                      height: 10,
                    ),


                           SizedBox(
                      height: 10,
                    ),
                    Text(
                      controller.selectedProd?.price.toString()??"",
                      style: TextStyle(
                        color: Color(0xFFFFA41B),
                          fontSize: 25, fontFamily: "assets/fonts/Poppins-Bold.ttf",
                      ),
                    ),

                        SizedBox(
                      height: 10,
                    ),





                    Text(
                      controller.selectedProd?.description??"",
                      maxLines: 5,
                      style: TextStyle(
                          fontSize: 20, fontFamily: "assets/fonts/Poppins-Bold.ttf",
                        color: Color(0xff282747),
                      ),
                    ),

            ],
          ),
        ),

      )


      // Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //

      //           SizedBox(
      //         height: 10,
      //       ),
      //       Text(
      //         controller.selectedProd?.description??"",
      //         maxLines: 5,
      //         style: TextStyle(
      //             fontSize: 20, fontFamily: "assets/fonts/Poppins-Bold.ttf",
      //           color: Color(0xff282747),
      //         ),
      //       ),





    //       ],
    //     ),
    //   ),
    );
  }
}

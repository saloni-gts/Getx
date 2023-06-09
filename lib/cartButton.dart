import 'package:flutter/material.dart';
import 'package:getx/upiPayment.dart';

import 'addresspage.dart';
import 'cartPage.dart';

Widget CartButton({required String text , required double width,required BuildContext context,required VoidCallback tap1} ){
  return InkWell(
    onTap: (){

    tap1();
    },
    child: Container(
width: width ,
      height: 50,
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.all(
              Radius.circular(28)),
        color:  Color(0xFFFFA41B),
      ),

      // backgroundColor: Color(0xFFFFA41B),
        child: Center(
          child: Text(
           text,
              style: TextStyle(color: Colors.black,fontSize: 20)
          ),
        )
    //     Row(
    //
    //   children: [
    //     SizedBox(width: 7,),
    //     // Icon(Icons.shopping_cart,),
    //
    //     Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 2.0),
    //       child: Center(child: Text(text,style: TextStyle(color: Colors.black),)),
    //     )
    //   ],
    // )

    ),
  );
}
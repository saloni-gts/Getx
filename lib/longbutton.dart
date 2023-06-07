import 'package:flutter/material.dart';
import 'package:getx/upiPayment.dart';

import 'addresspage.dart';
import 'cartPage.dart';

Widget LongButton({required String text ,required BuildContext context,
  required VoidCallback onTap1 }){
  return InkWell(
    onTap: (){
onTap1();

      // Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
      // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
      // Navigator.push(context, MaterialPageRoute(builder: (context)=>UpiPayment()));
      //
    },
    child: Container(
        width: MediaQuery.of(context).size.width*.9 ,
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


    ),
  );
}
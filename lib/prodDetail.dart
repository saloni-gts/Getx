import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:getx/product.dart';

void prodDetailDialog({required BuildContext context,required Product prod}){
  showDialog(context: context, builder: (context){
    return
    BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        scrollable: true,
        elevation: 4,
        backgroundColor:Color(0xffF7F7F7),
        content: Stack(
          children: [
            Column(
              children: [

                SizedBox(
                  // height: 10,
                ),

                Center(
                  child: Container(
                    // height: MediaQuery.of(context).size.height*.40,
                    // width: MediaQuery.of(context).size.width*.40,
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
                        borderRadius: BorderRadius.all(Radius.circular(8)),

                        color: Colors.greenAccent
                    ),
                    child: Image.asset("assets/images/dog_image2.png",fit: BoxFit.fill),
                  ),
                ),
                
                SizedBox(
                  height: 10,
                ),
                
                Text(prod.title,
                style: TextStyle(
                  fontFamily: "assets/fonts/Poppins-Bold.ttf",
                  fontSize: 20
                ),
                )

              ],
            ),
            InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.cancel,))
            
          ],
        ),
      ),
    );
  });
}